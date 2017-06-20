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
import java.util.ArrayList;
import java.util.List;
import com.model.Menu;

public class dbMenu {

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

   
    
    public List<Menu> getList(int type) {
        List<Menu> list = null;
        try {
            con = db.conGet();
            sta = con.createStatement();
            rs = sta.executeQuery("select * from menu where type=" + type + " order by sx ASC");
             list = new ArrayList<>();
            while (rs.next()) {
                Menu m = new Menu();
                m.setSx(rs.getInt(1));
                m.setType(rs.getInt(2));
                m.setMenu(rs.getString(3));
                m.setMenuUrl(rs.getString(4));
                list.add(m);
            }
        } catch (SQLException e) {
            System.out.print("连接错误！");
            throw new RuntimeException(e);
        }
        db.conDown(con);

        db.staDown(sta);

        db.resDown(rs);

        return list;

    }
}
