/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import static com.action.user.getUserType;
import com.model.User;
import com.model.Lession;
import com.model.Classes;
import com.dbhelper.dbLession;
import com.dbhelper.dbAnswer;
import com.dbhelper.dbUser;
import com.dbhelper.dbExam;
import com.dbhelper.dbClass;
import com.dbhelper.dbScore;
import static com.action.user.getUsername;
import com.opensymphony.xwork2.ActionSupport;
import com.util.ApplicationContextUtil;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;

public class classAction extends ActionSupport {

    private List<Classes> classList;
    private List<Lession> lessionList;
    private List<User> teacherList;
    private String result;
    private Classes newClass;
    private Lession newLession;
    private String url;

    private final ApplicationContext ac;
    private static dbClass dbc;
    private static dbScore dbs;
    private static dbUser dbu;
    private static dbLession dbl;

    public classAction() {
        ac = ApplicationContextUtil.getApplicationContext();
        dbc = (dbClass) ac.getBean("dbClass");
        dbs = (dbScore) ac.getBean("dbScore");
        dbu = (dbUser) ac.getBean("dbUser");
        dbl = (dbLession) ac.getBean("dbLession");
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Classes getNewClass() {
        return newClass;
    }

    public void setNewClass(Classes newClass) {
        this.newClass = newClass;
    }

    public Lession getNewLession() {
        return newLession;
    }

    public void setNewLession(Lession newLession) {
        this.newLession = newLession;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public List<Lession> getLessionList() {
        return lessionList;
    }

    public void setLessionList(List<Lession> lessionList) {
        this.lessionList = lessionList;
    }

    public List<User> getTeacherList() {
        return teacherList;
    }

    public void setTeacherList(List<User> teacherList) {
        this.teacherList = teacherList;
    }

    public List<Classes> getClassList() {
        return classList;
    }

    public void setClassList(List<Classes> classList) {
        this.classList = classList;
    }

    public String choiceList() {
        this.classList = dbc.getChoiceList(getUsername());
        return SUCCESS;
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

    public String modify() {
        this.classList = dbc.getMyClass(null);
        this.lessionList = dbl.getLessionList();
        this.teacherList = dbu.getUserList("1", "");
        return SUCCESS;
    }

    public String addClass() {
        setMessage(dbc.addClass(this.newClass));
        return "message";
    }

    public String delClass() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String cId = request.getParameter("cId");
        setMessage(dbc.delClass(cId));
        return "message";
    }

    public String choiceClass() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String cId = request.getParameter("cId");
        ServletActionContext.getContext().getSession().remove("lessionList1");
        setMessage(dbs.choiceClass(cId, getUsername()));
        return "message";
    }

    public String addLession() {
        setMessage(dbl.newLession(newLession));
        return "message";
    }
}
