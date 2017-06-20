/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

public class Score {

    private String sid;         //学生编号
    private int cid;            //班级编号
    private String lessionId;   //课程编号
    private String lessionName; //课程名称
    private String tecId;       //教师编号
    private String stuName;     //学生姓名
    private String tecName;     //教师姓名
    private int score;         //分数
    private String state;          //状态    0待考试,1待批阅,2待补考,3已通过

    public String getLessionName() {
        return lessionName;
    }

    public void setLessionName(String lessionName) {
        this.lessionName = lessionName;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getLessionId() {
        return lessionId;
    }

    public void setLessionId(String lessionId) {
        this.lessionId = lessionId;
    }

    public String getTecId() {
        return tecId;
    }

    public void setTecId(String tecId) {
        this.tecId = tecId;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getTecName() {
        return tecName;
    }

    public void setTecName(String tecName) {
        this.tecName = tecName;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getState() {
        return state;
    }

    public void setState(int s) {

        //0待考试,1待批阅,2待补考,3已通过
        switch (s) {
            case 0:
                this.state = "待考试";
                break;
            case 1:
                this.state = "待批改";
                break;
            case 2:
                this.state = "待补考";
                break;
            case 3:
                this.state = "已通过";
                break;
        }

    }

}
