
package com.dbhelper;

import com.model.Classes;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class dbClass {

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

    
    public List<Classes> getChoiceList(String sId){             //学生获取可以选择的课程
         List<Classes> List = null;
        try {
            con = db.conGet();
            sta = con.createStatement();
            String sql = "select cId,lession.lessionId,lession.name,member,tecId,users.name from class,users,lession"
                    + " where users.username=class.tecId and lession.lessionId=class.lessionId "
                    + "and lession.lessionId not in (select lessionId from score,class where score.cId=class.cId and sId='"+sId+"')";
              rs = sta.executeQuery(sql);
            List = new ArrayList<>();
            while (rs.next()) {
                Classes les = new Classes();
                les.setCid(rs.getString(1));
                les.setLessionId(rs.getString(2));
                les.setName(rs.getString(3));
                les.setMenber(rs.getInt(4));
                les.setTecId(rs.getString(5));
                les.setTecName(rs.getString(6));
                List.add(les);
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
    public boolean addClass(Classes ca) {
        boolean ok = false;
        PreparedStatement pre = null;
        try {
            con = db.conGet();
            sta = con.createStatement();
            String sql = "insert into class(cId,lessionId,tecId) values(?,?,?)";
            pre = con.prepareStatement(sql);
            pre.setString(1, ca.getCid());
            pre.setString(2, ca.getLessionId());
            pre.setString(3, ca.getTecId());
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

    public boolean delClass(String cId) {
        boolean ok = false;
        try {
            con = db.conGet();
            sta = con.createStatement();
            String sql = "delete from class where cId=" + cId;
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

    public List<Classes> getMyClass(String tecId) {          //教师获取自己的所有课程,管理员获取所有课程
        List<Classes> List = null;
        try {
            con = db.conGet();
            sta = con.createStatement();
            String sql = "select cId,lession.lessionId,lession.name,member,tecId,users.name from class,users,lession"
                    + " where users.username=class.tecId and lession.lessionId=class.lessionId";
            if (tecId != null) {
                sql = sql + " and tecId ='" + tecId + "'";
            
            }
              rs = sta.executeQuery(sql);
            List = new ArrayList<>();
            while (rs.next()) {
                Classes les = new Classes();
                les.setCid(rs.getString(1));
                les.setLessionId(rs.getString(2));
                les.setName(rs.getString(3));
                les.setMenber(rs.getInt(4));
                les.setTecId(rs.getString(5));
                les.setTecName(rs.getString(6));
                List.add(les);
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

    public List<Classes> getNoExamClass(String tecId) {              //获取教师没命题的科目
        List<Classes> List = null;
        try {
            con = db.conGet();
            sta = con.createStatement();
            if (tecId != null) {
                rs = sta.executeQuery("select cId,lession.name,tecId,users.name from class,lession,users  where tecId ='"
                        + tecId + "' and cId not in(select cId from exam) and lession.lessionId=class.lessionId and users.username=class.tecId ");
            } else {
                rs = sta.executeQuery("select cId,lession.name,tecId,users.name from class,lession,users where lession.lessionId=class.lessionId and users.username=class.tecId and cId not in(select cId from exam) ");
            }

            List = new ArrayList<>();
            while (rs.next()) {
                Classes les = new Classes();
                les.setCid(rs.getString(1));
                les.setName(rs.getString(2));
                les.setTecId(rs.getString(3));
                les.setTecName(rs.getString(4));
                List.add(les);
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

    public List<Classes> getLessonList(String sId, int type) {           //学生获取科目列表

        //typy 0 待考试 1 待批阅 2待补考 3 已通过
        List<Classes> List = null;
        try {
            con = db.conGet();
            sta = con.createStatement();
            rs = sta.executeQuery("select cId,lession.name,tecId from class,lession"
                    + " where cId in ( select cId from score where sId='" + sId + "' and state=" + type + ")"
                    + " and cId in(select cId from exam where scqNumber>0 and mcqNumber>0 and codeqNumber>0 )"
                    + "and lession.lessionId=class.lessionId");
            List = new ArrayList<>();
            while (rs.next()) {
                Classes les = new Classes();
                les.setCid(rs.getString(1));
                les.setName(rs.getString(2));
                les.setTecId(rs.getString(3));
                List.add(les);
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
}
