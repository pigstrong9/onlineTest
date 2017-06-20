package com.dbhelper;

import com.model.MCQ;
import com.model.SCQ;
import com.model.CodeQ;
import com.model.Exam;
import static com.dbhelper.dbArticle.toDate;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class dbExam {

    private dbBase db;
    private Connection con;
    private Statement sta;
    private ResultSet rs;

    public dbBase getDb() {
        return db;
    }

    public void setDb(dbBase db) {
        this.db = db;
    }

    public boolean addCODEQ(CodeQ cq) {             //添加一道简答题
        boolean ok = false;
        PreparedStatement pre = null;
        try {
            con = db.conGet();
            String sql = "insert into codeq (examId,question,answer) values(?,?,?)";
            pre = con.prepareStatement(sql);
            pre.setInt(1, cq.getExamId());
            pre.setString(2, cq.getQuestion());
            pre.setString(3, cq.getAnswer());
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

    public boolean addMCQ(MCQ mcq) {            //添加一道多选题
        boolean ok = false;
        PreparedStatement pre = null;
        try {
            con = db.conGet();
            sta = con.createStatement();
            String sql = "insert into mcq (examId,question,selectionA,selectionB,selectionC,selectionD,answer) values(?,?,?,?,?,?,?)";
            pre = con.prepareStatement(sql);
            pre.setInt(1, mcq.getExamId());
            pre.setString(2, mcq.getQuestion());
            pre.setString(3, mcq.getSelectionA());
            pre.setString(4, mcq.getSelectionB());
            pre.setString(5, mcq.getSelectionC());
            pre.setString(6, mcq.getSelectionD());
            pre.setString(7, mcq.getAnswer());
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

    public boolean modifySCQ(SCQ scq) {             //修改单选题
        boolean ok = false;
        try {
            con = db.conGet();
            sta = con.createStatement();
            String sql = "update scq set question='" + scq.getQuestion() + "' ,selectionA='" + scq.getSelectionA() + "' ,selectionB='" + scq.getSelectionB()
                    + "' ,selectionC='" + scq.getSelectionC() + "' ,selectionD='" + scq.getSelectionD() + "' ,answer='" + scq.getAnswer() + "' where id=" + scq.getId();
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

    public boolean modifyMCQ(MCQ mcq) {     //修改多选题
        boolean ok = false;
        try {
            con = db.conGet();
            sta = con.createStatement();
            String sql = "update mcq set question='" + mcq.getQuestion() + "' ,selectionA='" + mcq.getSelectionA() + "' ,selectionB='" + mcq.getSelectionB()
                    + "' ,selectionC='" + mcq.getSelectionC() + "' ,selectionD='" + mcq.getSelectionD() + "' ,answer='" + mcq.getAnswer() + "' where id=" + mcq.getId();
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

    public boolean modifyCODEQ(CodeQ cq) {
        boolean ok = false;
        try {
            con = db.conGet();
            sta = con.createStatement();
            String sql = "update codeq set question='" + cq.getQuestion() + "' ,answer='" + cq.getAnswer() + "' where id=" + cq.getId();
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

    public boolean addSCQ(SCQ scq) {            //添加一道单选题
        boolean ok = false;
        PreparedStatement pre = null;
        try {
            con = db.conGet();
            String sql = "insert into scq (examId,question,selectionA,selectionB,selectionC,selectionD,answer) values(?,?,?,?,?,?,?)";
            pre = con.prepareStatement(sql);
            pre.setInt(1, scq.getExamId());
            pre.setString(2, scq.getQuestion());
            pre.setString(3, scq.getSelectionA());
            pre.setString(4, scq.getSelectionB());
            pre.setString(5, scq.getSelectionC());
            pre.setString(6, scq.getSelectionD());
            pre.setString(7, scq.getAnswer());
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

    public boolean newExam(int cId) {           //新建一张试卷
        boolean ok = false;
        PreparedStatement pre = null;
        try {
            con = db.conGet();
            String sql = "insert into exam (cId,dateline) values(?,?)";
            pre = con.prepareStatement(sql);
            pre.setInt(1, cId);
            pre.setLong(2, System.currentTimeMillis());
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

    public List<CodeQ> getCodeQlist(int examId) {       //获取对应试卷的所有简答题

        Connection con1 = null;
        Statement sta1 = null;
        ResultSet rs1 = null;
        List<CodeQ> CodeQlist = null;
        try {
            con1 = db.conGet();
            sta1 = con1.createStatement();
            rs1 = sta1.executeQuery("select * from codeq where examId=" + examId);
            CodeQlist = new ArrayList<>();
            while (rs1.next()) {
                CodeQ cq = new CodeQ();
                cq.setId(rs1.getInt(1));
                cq.setExamId(rs1.getInt(2));
                cq.setQuestion(rs1.getString(3));
                cq.setAnswer(rs1.getString(4));
                CodeQlist.add(cq);
            }
        } catch (SQLException e) {
            System.out.print("连接错误！");
            throw new RuntimeException(e);
        }
        db.conDown(con1);

        db.staDown(sta1);

        db.resDown(rs1);
        return CodeQlist;
    }

    public List<SCQ> getSCQlist(int examId) {           //获取试卷的所有单选题
        List<SCQ> SCQlist = null;
        Connection con1 = null;
        Statement sta1 = null;
        ResultSet rs1 = null;

        try {
            con1 = db.conGet();
            sta1 = con1.createStatement();
            rs1 = sta1.executeQuery("select * from SCQ where examId=" + examId);
            SCQlist = new ArrayList<>();
            while (rs1.next()) {
                SCQ mcq = new SCQ();
                mcq.setId(rs1.getInt(1));
                mcq.setExamId(rs1.getInt(2));
                mcq.setQuestion(rs1.getString(3));
                mcq.setSelectionA(rs1.getString(4));
                mcq.setSelectionB(rs1.getString(5));
                mcq.setSelectionC(rs1.getString(6));
                mcq.setSelectionD(rs1.getString(7));
                mcq.setAnswer(rs1.getString(8));
                SCQlist.add(mcq);
            }
        } catch (SQLException e) {
            System.out.print("连接错误！");
            throw new RuntimeException(e);
        }
        db.conDown(con1);

        db.staDown(sta1);

        db.resDown(rs1);
        return SCQlist;
    }

    public List<MCQ> getMCQlist(int examId) {           //获取对应试卷的所有多选题
        List<MCQ> MCQlist = null;
        Connection con1 = null;
        Statement sta1 = null;
        ResultSet rs1 = null;
        try {
            con1 = db.conGet();
            sta1 = con1.createStatement();
            rs1 = sta1.executeQuery("select * from MCQ where examId=" + examId);
            MCQlist = new ArrayList<>();
            while (rs1.next()) {
                MCQ mcq = new MCQ();
                mcq.setId(rs1.getInt(1));
                mcq.setExamId(rs1.getInt(2));
                mcq.setQuestion(rs1.getString(3));
                mcq.setSelectionA(rs1.getString(4));
                mcq.setSelectionB(rs1.getString(5));
                mcq.setSelectionC(rs1.getString(6));
                mcq.setSelectionD(rs1.getString(7));
                mcq.setAnswer(rs1.getString(8));
                MCQlist.add(mcq);
            }
        } catch (SQLException e) {
            System.out.print("连接错误！");
            throw new RuntimeException(e);
        }
        db.conDown(con1);

        db.staDown(sta1);

        db.resDown(rs1);
        return MCQlist;
    }

    public List<Exam> getExamList(String tecId) {        //获取有试卷的科目
        List<Exam> eList = null;
        try {
            con = db.conGet();
            sta = con.createStatement();
            if (tecId != null) {
                rs = sta.executeQuery("select id,lession.name,class.cId,dateline,scqNumber,mcqNumber,codeqNumber from exam,class,lession "
                        + "where exam.cId=class.cId and lession.lessionId=class.lessionId and tecId='" + tecId + "'");
            } else {
                rs = sta.executeQuery("select id,lession.name,class.cId,dateline,scqNumber,mcqNumber,codeqNumber from exam,class,lession "
                        + "where exam.cId=class.cId and lession.lessionId=class.lessionId");
            }

            eList = new ArrayList<>();
            while (rs.next()) {
                Exam exam = new Exam();
                exam.setId(rs.getInt(1));
                exam.setName(rs.getString(2));
                exam.setcId(rs.getString(3));
                exam.setDateline(toDate(rs.getLong(4)));
                exam.setScqNumber(rs.getInt(5));
                exam.setMcqNumber(rs.getInt(6));
                exam.setCodeqNumber(rs.getInt(7));
                eList.add(exam);
            }
        } catch (SQLException e) {
            System.out.print("连接错误！");
            throw new RuntimeException(e);
        }
        db.conDown(con);

        db.staDown(sta);

        db.resDown(rs);
        return eList;
    }

    public Exam getExam(String cId) {           //获取该门课程的试卷
        Exam exam = new Exam();
        try {
            con = db.conGet();
            sta = con.createStatement();
            rs = sta.executeQuery("select id, lession.name as lname  ,  users.name  ,  dateline  ,  class.cId   from exam,class,users,lession "
                    + "where class.cId=exam.cId and users.username=class.tecId  and lession.lessionId=class.lessionId "
                    + "and exam.cId=" + cId);
            while (rs.next()) {
                exam.setId(rs.getInt(1));
                exam.setName(rs.getString(2));
                exam.setAuthor(rs.getString(3));
                exam.setDateline(toDate(rs.getLong(4)));
                exam.setcId(rs.getString(5));
            }
            exam.setSCQlist(getSCQlist(exam.getId()));
            exam.setMCQlist(getMCQlist(exam.getId()));
            exam.setCodeQlist(getCodeQlist(exam.getId()));
        } catch (SQLException e) {
            System.out.print("连接错误！");
            throw new RuntimeException(e);
        }
        db.conDown(con);

        db.staDown(sta);

        db.resDown(rs);
        return exam;
    }

    public boolean delExam(int examId) {            //删除试卷
        boolean ok = false;
        try {
            con = db.conGet();
            sta = con.createStatement();
            sta.executeUpdate("delete from exam where id =" + examId);
            ok = true;
        } catch (SQLException e) {
            System.out.print("连接错误！");
            throw new RuntimeException(e);
        }
        db.conDown(con);
        db.staDown(sta);
        return ok;

    }

    public boolean delQuestion(int id, String type) {
        boolean ok = false;
        try {
            con = db.conGet();
            sta = con.createStatement();
            sta.executeUpdate("delete from " + type + " where id =" + id);
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
