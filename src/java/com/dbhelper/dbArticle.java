/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dbhelper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.model.Article;

public class dbArticle {

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

  

    public static String toDate(Long dateline) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日");
        Date date = new Date(dateline);
        return format.format(date);
    }

    public List<Article> getList() {

        List<Article> artList = null;
        try {
            con = db.conGet();
            sta = con.createStatement();
            rs = sta.executeQuery("select id,title,users.name,dateline,content from article,users where users.username=article.authorId order by id");
            artList = new ArrayList<>();
            while (rs.next()) {
                Article art = new Article();
                art.setId(rs.getInt(1));
                art.setTitle(rs.getString(2));
                art.setAuthor(rs.getString(3));
                art.setDateline(toDate(rs.getLong(4)));
                art.setContent(rs.getString(5));
                artList.add(art);
            }
        } catch (SQLException e) {
            System.out.print("连接错误！");
            throw new RuntimeException(e);
        }
        db.conDown(con);

        db.staDown(sta);

        db.resDown(rs);

        return artList;

    }
    

}
