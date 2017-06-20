package com.dbhelper;

import com.model.Score;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class dbScore {

    private dbBase db;
    private Connection con = null;
    private Statement sta = null;
    private ResultSet rs = null;

    public dbBase getDb() {
        return db;
    }

    public void setDb(dbBase db) {
        this.db = db;
    }

    public boolean delScore(String cId, String sId) {
        boolean ok = false;
        try {
            con = db.conGet();
            sta = con.createStatement();
            String sql = "delete from score where cId=" + cId + " and sId='" + sId + "'";
            sta.executeUpdate(sql);
            ok = true;
        } catch (SQLException e) {
            System.out.print("连接错误！");
            throw new RuntimeException(e);
        }
        db.conDown(con);
        db.staDown(sta);
        return ok;
    }

    public boolean choiceClass(String cId, String sId) {            //学生选课
        boolean ok = false;
        PreparedStatement pre = null;
        try {
            con = db.conGet();
            sta = con.createStatement();
            String sql = "insert into score(cId,sId) values(" + cId + ",'" + sId + "')";
            pre = con.prepareStatement(sql);
            pre.executeUpdate();
            pre.close();
            ok = true;
        } catch (SQLException e) {
            System.out.print("连接错误！");
            throw new RuntimeException(e);
        }
        db.conDown(con);
        db.staDown(sta);

        return ok;
    }

    public boolean savaCodeqScore(String sId, int score, String cId) {      //保存最终成绩

        // 0 待考试 1 待批阅 2待补考 3 已通过
        boolean ok = false;
        int state = 0;
        try {
            con = db.conGet();
            sta = con.createStatement();
            rs = sta.executeQuery("select score from score where sId='" + sId + "' and cId='" + cId + "'");
            if (rs.next()) {
                score += rs.getInt(1);
            }
             if (score >= 60) {           //判断是否需要补考
                    state = 3;
                } else {
                    state = 2;
                }
            System.out.println(state);
            String sql = "update score set score =" + score + " , state=" + state + " where sId='" + sId + "' and cId='" + cId + "'";
            sta.executeUpdate(sql);
            ok = true;
        } catch (SQLException e) {
            System.out.print("连接错误！");
            throw new RuntimeException(e);
        }
        db.conDown(con);
        db.staDown(sta);
        return ok;
    }

    public List<Score> getScore(String cid) {       //获取该门课程的所有学生列表
        List<Score> List = null;
        try {
            con = db.conGet();
            sta = con.createStatement();
            rs = sta.executeQuery("select users.username,users.name,score,state from score,users where score.sId=users.username and cId=" + cid);
            List = new ArrayList<>();
            while (rs.next()) {
                Score s = new Score();
                s.setSid(rs.getString(1));
                s.setStuName(rs.getString(2));
                s.setScore(rs.getInt(3));
                s.setState(rs.getInt(4));
                s.setCid(Integer.parseInt(cid));
                List.add(s);
            }
        } catch (SQLException e) {
            System.out.print("连接错误！");
            throw new RuntimeException(e);
        }
        db.conDown(con);

        db.staDown(sta);

        db.resDown(rs);

        return List;

    }

    public List<Score> getMyScore(String sId) {     //学生用于获取自己所有成绩
        List<Score> sList = null;
        try {
            con = db.conGet();
            sta = con.createStatement();
            rs = sta.executeQuery("select class.cId,lession.lessionId,lession.name,users.name,score,state from score,class,users,lession "
                    + "where lession.lessionId=class.lessionId and class.cId=score.cId and class.tecId=users.username  "
                    + "and sId='" + sId + "'");
            sList = new ArrayList<Score>();
            while (rs.next()) {
                Score s = new Score();
                s.setCid(rs.getInt(1));
                s.setLessionId(rs.getString(2));
                s.setLessionName(rs.getString(3));
                s.setTecName(rs.getString(4));
                s.setScore(rs.getInt(5));
                s.setState(rs.getInt(6));
                sList.add(s);
            }
        } catch (SQLException e) {
            System.out.print("连接错误！");
            throw new RuntimeException(e);
        }
        db.conDown(con);

        db.staDown(sta);

        db.resDown(rs);

        return sList;
    }

    public boolean saveSelectionScore(String username, String cId, int score) {       //将学生的选择题成绩保存到数据库
        boolean ok = false;
        try {
            con = db.conGet();
            sta = con.createStatement();
            String sql = "update score set score=" + score + ", state=1 where sId='" + username + "' and cId='" + cId + "'";
            int result = sta.executeUpdate(sql);
            if (result > 0) {
                System.out.println("操作成功");
            } else {
                System.out.println("操作失败");
            }

            ok = true;
        } catch (SQLException e) {
            System.out.print("连接错误！");
            throw new RuntimeException(e);
        }
        db.conDown(con);
        db.staDown(sta);
        return ok;
    }

}
