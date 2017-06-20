/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import com.model.User;
import com.model.Menu;
import com.opensymphony.xwork2.ActionSupport;
import com.dbhelper.*;
import com.util.ApplicationContextUtil;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;

public class user extends ActionSupport {

    private final ApplicationContext ac;
    private User user;
    private List<Class> lessionList;
    private String result;
    private List<User> userList;
    private static dbUser dbu;

    public user() {
        ac = ApplicationContextUtil.getApplicationContext();
        dbu = (dbUser) ac.getBean("dbUser");
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public  void setMessage(boolean a) {
        String r = null;
        if (a) {
            r = "提交成功!";
        } else {
            r = "提交失败,请联系管理员 !";
        }
        this.result = r;
    }

    public List<Class> getLessionList() {
        return lessionList;
    }

    public void setLessionList(List<Class> lessionList) {
        this.lessionList = lessionList;
    }

    public String show() {              //加载模块首页面
        return "show";
    }

    public String login() {         //返回登录界面
        return INPUT;
    }

    public String logout() {        //注销
        ServletActionContext.getContext().getSession().clear();
        return INPUT;
    }

    public String checkLogin() {        //判断用户名与密码是否匹配,并加载顶部菜单

        if (dbu.check(user)) {
            this.user = dbu.getUserMsg(user);
            ServletActionContext.getContext().getSession().put("user", user);
            dbMenu dbm = (dbMenu) ac.getBean("dbMenu");
            List<Menu> mn = dbm.getList(user.getType());
            ServletActionContext.getContext().getSession().put("Menu", mn);
            return SUCCESS;
        } else {
            this.addActionError("用户名或密码错误!");
            return INPUT;
        }
    }

    public String myInfo() {        //获取个人信息
            this.user = (User) ServletActionContext.getContext().getSession().get("user");
        return SUCCESS;
    }

    public String modifyInfo() {            //修改个人资料
        setMessage(dbu.modifyUser(this.user));
        ServletActionContext.getContext().getSession().put("user", this.user);
        return "message";
    }

    public String modifyPassword() throws NoSuchAlgorithmException, UnsupportedEncodingException {            //修改密码
        this.user = (User) ServletActionContext.getContext().getSession().get("user");
        HttpServletRequest request = ServletActionContext.getRequest();
        String password = dbBase.EncoderByMd5(request.getParameter("password"));
        String newPassword = dbBase.EncoderByMd5(request.getParameter("newPassword"));
        if (user.getPassword().equals(password)) {         //判断旧密码是否正确
            setMessage(dbu.modifyPassword(this.user, newPassword));
            ServletActionContext.getContext().getSession().clear();
        } else {
            this.result = "旧密码错误!";
        }
        return "message";
    }

    public static int getUserType() {        //获取当前用户类型

        User user = (User) (ServletActionContext.getContext().getSession().get("user"));
        return user.getType();
    }

    public static String getUsername() {        //获取当前登录的用户名
        User user = (User) (ServletActionContext.getContext().getSession().get("user"));
        return user.getUsername();
    }

    public String modify() {
        return SUCCESS;
    }

    public String list() { //获取用户列表
        HttpServletRequest request = ServletActionContext.getRequest();
        if (request.getParameter("type") != null) {
            this.userList = dbu.getUserList(request.getParameter("type"), "");
        } else if (request.getParameter("username") != null) {
            this.userList = dbu.getUserList("", request.getParameter("username"));
        } else {
            this.userList = dbu.getUserList("", "");
        }
        return SUCCESS;
    }

    public String addUser() {
        setMessage(dbu.addUser(this.user));
        return "message";
    }

    public String delUser() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String username = request.getParameter("username");
        setMessage(dbu.delUser(username));
        return "message";
    }

}
