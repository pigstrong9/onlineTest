/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import com.model.MCQ;
import com.model.SCQ;
import com.model.CodeQ;
import com.model.Classes;
import com.model.Exam;
import com.dbhelper.dbAnswer;
import com.dbhelper.dbExam;
import com.dbhelper.dbClass;
import com.dbhelper.dbScore;
import static com.action.user.getUserType;
import static com.action.user.getUsername;
import com.opensymphony.xwork2.ActionSupport;
import com.util.ApplicationContextUtil;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;

public class paper extends ActionSupport {

    private List<Exam> examList;
    private List<Classes> noExamList;
    private String result;
    private SCQ newSCQ;
    private MCQ newMCQ;
    private CodeQ newCODEQ;
    private List<CodeQ> CODEQlist;
    private List<SCQ> SCQlist;
    private List<MCQ> MCQlist;

    private ApplicationContext ac;
    private static dbClass dbc;
    private static dbExam dbe;
    private static dbScore dbs;
    private static dbAnswer dba;

    public paper() {
        ac = ApplicationContextUtil.getApplicationContext();
        dbc = (dbClass) ac.getBean("dbClass");
        dbe = (dbExam) ac.getBean("dbExam");
        dbs = (dbScore) ac.getBean("dbScore");
        dba = (dbAnswer) ac.getBean("dbAnswer");
    }

    public List<CodeQ> getCODEQlist() {
        return CODEQlist;
    }

    public void setCODEQlist(List<CodeQ> CODEQlist) {
        this.CODEQlist = CODEQlist;
    }

    public List<SCQ> getSCQlist() {
        return SCQlist;
    }

    public void setSCQlist(List<SCQ> SCQlist) {
        this.SCQlist = SCQlist;
    }

    public List<MCQ> getMCQlist() {
        return MCQlist;
    }

    public void setMCQlist(List<MCQ> MCQlist) {
        this.MCQlist = MCQlist;
    }

    public MCQ getNewMCQ() {
        return newMCQ;
    }

    public void setNewMCQ(MCQ newMCQ) {
        this.newMCQ = newMCQ;
    }

    public CodeQ getNewCODEQ() {
        return newCODEQ;
    }

    public void setNewCODEQ(CodeQ newCODEQ) {
        this.newCODEQ = newCODEQ;
    }

    public SCQ getNewSCQ() {
        return newSCQ;
    }

    public void setNewSCQ(SCQ newSCQ) {
        this.newSCQ = newSCQ;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public List<Classes> getNoExamList() {
        return noExamList;
    }

    public void setNoExamList(List<Classes> noExamList) {
        this.noExamList = noExamList;
    }

    public List<Exam> getExamList() {
        return examList;
    }

    public void setExamList(List<Exam> examList) {
        this.examList = examList;
    }

    public void setMessage(boolean a) {
        String r = null;
        if (a) {
            r = "提交成功!";
        } else {
            r = "提交失败,请联系管理员 !";
        }
        this.result = r;
    }

    public String show() {              //加载模块首页面
        return "show";
    }

    public String myPaper() {           //加载我的试卷页面
        if (getUserType() == 1) {
            this.examList = (dbe.getExamList(getUsername()));        //获取有试卷的科目
            this.noExamList = (dbc.getNoExamClass(getUsername()));     //获取没有试卷的科目
        } else if (getUserType() == 2) {
            this.examList = (dbe.getExamList(null));        //获取有试卷的科目
            this.noExamList = (dbc.getNoExamClass(null));     //获取没有试卷的科目
        }
        return SUCCESS;
    }

    public String modify() {
        if (getNewSCQ() != null) {                  //修改单选题
            setMessage(dbe.modifySCQ(getNewSCQ()));
        } else if (getNewMCQ() != null) {            //修改多选题
            setMessage(dbe.modifyMCQ(getNewMCQ()));
        } else if (getNewCODEQ() != null) {          //修改简答题
            setMessage(dbe.modifyCODEQ(getNewCODEQ()));
        }
        return "message";
    }

    public String add() {                   //为试卷添加一道题目
        if (getNewSCQ() != null) {                  //添加单选题
            setMessage(dbe.addSCQ(getNewSCQ()));
        } else if (getNewMCQ() != null) {            //添加多选题
            setMessage(dbe.addMCQ(getNewMCQ()));
        } else if (getNewCODEQ() != null) {          //添加简答题
            setMessage(dbe.addCODEQ(getNewCODEQ()));
        } else {                                    //添加试卷
            HttpServletRequest request = ServletActionContext.getRequest();
            int cid = Integer.parseInt(request.getParameter("cid"));
            setMessage(dbe.newExam(cid));

        }
        return "message";
    }

    public String del() {               //删除试卷或题目

        HttpServletRequest request = ServletActionContext.getRequest();
        int id = Integer.parseInt(request.getParameter("id"));
        String type = request.getParameter("type");
        if (type == null) {
            setMessage(dbe.delExam(id));
        } else {
            setMessage(dbe.delQuestion(id, type));
        }
        return "message";
    }

    public String selectSCQ() {         //获取单选题列表
        HttpServletRequest request = ServletActionContext.getRequest();
        this.SCQlist = dbe.getSCQlist(Integer.parseInt(request.getParameter("examId")));
        return SUCCESS;
    }

    public String selectMCQ() {         //获取多选题列表
        HttpServletRequest request = ServletActionContext.getRequest();
        this.MCQlist = dbe.getMCQlist(Integer.parseInt(request.getParameter("examId")));
        return SUCCESS;
    }

    public String selectCODEQ() {         //获取单选题列表
        HttpServletRequest request = ServletActionContext.getRequest();
        this.CODEQlist = dbe.getCodeQlist(Integer.parseInt(request.getParameter("examId")));
        return SUCCESS;
    }

}
