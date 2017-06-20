/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import static com.action.user.getUserType;
import static com.action.user.getUsername;
import com.model.Score;
import com.model.CodeQ;
import com.model.Classes;
import com.dbhelper.dbAnswer;
import com.dbhelper.dbClass;
import com.dbhelper.dbScore;
import com.opensymphony.xwork2.ActionSupport;
import com.util.ApplicationContextUtil;
import java.util.List;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;

public class score extends ActionSupport {

    private String url;
    private List<Score> scoreList;      //学生成绩
    private List<Classes> classList;  //教师录入成绩时的课程列表
    private List<CodeQ> answerList;     //考生回答列表
    private String score[];            //分数数组
    private int fenzhi;             //每道题的分值
    private String sid;           //学生ID
    private String cid;           //课程ID
    private String result;                  //返回提示
    private ApplicationContext ac;
    private static dbScore dbs;
    private static dbClass dbc;
    private static dbAnswer dba;

    public score() {
        ac = ApplicationContextUtil.getApplicationContext();
        dbs = (dbScore) ac.getBean("dbScore");
        dbc = (dbClass) ac.getBean("dbClass");
        dba = (dbAnswer) ac.getBean("dbAnswer");
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String[] getScore() {
        return score;
    }

    public void setScore(String[] score) {
        this.score = score;
    }

    public int getFenzhi() {
        return fenzhi;
    }

    public void setFenzhi(int fenzhi) {
        this.fenzhi = fenzhi;
    }

    public List<CodeQ> getAnswerList() {
        return answerList;
    }

    public void setAnswerList(List<CodeQ> answerList) {
        this.answerList = answerList;
    }

    public List<Classes> getClassList() {
        return classList;
    }

    public void setClassList(List<Classes> classList) {
        this.classList = classList;
    }

    public List<Score> getScoreList() {
        return scoreList;
    }

    public void setScoreList(List<Score> scoreList) {
        this.scoreList = scoreList;
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

    public String myClass() {                         //获取课程信息
        if (getUserType() == 1) {
            this.classList = dbc.getMyClass(getUsername());
        } else if (getUserType() == 2) {
            this.classList = dbc.getMyClass(null);
        }
        return SUCCESS;

    }

    public String delScore() {                             //删除成绩或退选
        this.sid = ServletActionContext.getRequest().getParameter("sid");
        this.cid = ServletActionContext.getRequest().getParameter("cid");
        setMessage(dbs.delScore(this.cid, this.sid));
        return "message";
    }

    public String classList() {                         //获取该门课程的学生列表
        this.cid = ServletActionContext.getRequest().getParameter("cid");
        this.scoreList = dbs.getScore(cid);
        return SUCCESS;
    }

    public String checkAnswer() {                    //获取学号为sid考生的cid课程的简答题答案
        this.sid = ServletActionContext.getRequest().getParameter("sid");
        this.cid = ServletActionContext.getRequest().getParameter("cid");
        this.answerList = dba.getAnswer(this.sid, this.cid);
        this.fenzhi = (50 / getAnswerList().size());       //简答题总分50分,除去题目数得到分值

        return SUCCESS;
    }

    public String myAchievement() {             //获取登录的学生学号的成绩信息
        this.scoreList = dbs.getMyScore(getUsername());
        return SUCCESS;
    }

    public String calculate() {              //计算成绩并上传服务器
        int score1 = 0;
        for (int i = 0; i < this.score.length; i++) {
            score1 += Integer.parseInt(this.score[i]);
        }
        if (dbs.savaCodeqScore(this.sid, score1, this.cid)) {
            this.result = "提交成功!";
        } else {
            this.result = "提交失败!";
        }
        return "message";
    }
}
