/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dbhelper;

import com.model.Lession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class dbLession {

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

  
    public List<Lession> getLessionList() {
        List<Lession> List = null;
        try {
            con = db.conGet();
            sta = con.createStatement();
            rs = sta.executeQuery("select * from lession ");
            List = new ArrayList<>();
            while (rs.next()) {
                Lession ls = new Lession();
                ls.setLessionId(rs.getString(1));
                ls.setName(rs.getString(2));
                List.add(ls);
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

    public boolean newLession(Lession ls) {
        boolean ok = false;
        PreparedStatement pre = null;
        try {
            con = db.conGet();
            String sql = "insert into lession (lessionId,name) values('"+ls.getLessionId()+"','"+ls.getName()+"')";
            pre=con.prepareStatement(sql);
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
}
