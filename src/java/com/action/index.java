/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import com.model.User;
import com.model.Article;
import com.opensymphony.xwork2.ActionSupport;
import com.dbhelper.dbArticle;
import com.dbhelper.dbBase;
import com.dbhelper.dbUser;
import com.util.ApplicationContextUtil;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;

public class index extends ActionSupport {

    private User user;
    private Article art;
    private dbArticle dba;
    private ApplicationContext ac;
    private static dbUser dbu;
    private String result;

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public index() {
        ac = ApplicationContextUtil.getApplicationContext();
        dba = (dbArticle) ac.getBean("dbArticle");
        dbu = (dbUser) ac.getBean("dbUser");
    }

    public Article getArt() {
        return art;
    }

    public void setArt(Article art) {
        this.art = art;
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

    public String modifyInfo() {            //修改个人资料
        ServletActionContext.getContext().getSession().put("user", user);
        setMessage(dbu.modifyUser(this.user));
        return "message";
    }

    public String show() {              //加载模块首页面
        user = (User) ServletActionContext.getContext().getSession().get("user");
        return "show";
    }

    public String list() {                   //获取首页文章列表
        if (ServletActionContext.getContext().getSession().get("artList") == null) {
            List<Article> artList = dba.getList();
            ServletActionContext.getContext().getSession().put("artList", artList);
        }
        return SUCCESS;
    }

    public String article() {

        HttpServletRequest request = ServletActionContext.getRequest();
        int id = Integer.parseInt(request.getParameter("id"));
        List<Article> artList = (List<Article>) (ServletActionContext.getContext().getSession().get("artList"));
        this.art = (artList.get(id));
        return SUCCESS;
    }

}
