/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dbhelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.model.CodeQ;

public class dbAnswer {

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

   

    public List<CodeQ> getAnswer(String id, String cid) {
        List<CodeQ> list = null;
        try {
            con = db.conGet();
            sta = con.createStatement();
            rs = sta.executeQuery("select answer.id,examId,question,answer,stuAnswer from answer,codeq where codeq.id=answer.id and sId='" + id+"'"
                    + " and examId in (select id from exam where cId = '" + cid + "' )");
            list = new ArrayList<>();
            while (rs.next()) {
                CodeQ cq = new CodeQ();
                cq.setId(rs.getInt(1));
                cq.setExamId(rs.getInt(2));
                cq.setQuestion(rs.getString(3));
                cq.setAnswer(rs.getString(4));
                cq.setStuAnswer(rs.getString(5));
                list.add(cq);
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

    public boolean saveResult(List<CodeQ> cql, String id) {
        boolean ok = false;
        PreparedStatement pre = null;
        try {
            con = db.conGet();
            for (int i = 0; i < cql.size(); i++) {
                String sql = "insert into answer (id,sId,stuAnswer) values(?,?,?)";
                pre = con.prepareStatement(sql);
                pre.setInt(1, cql.get(i).getId());
                pre.setString(2, id);
                pre.setString(3, cql.get(i).getAnswer());
                pre.executeUpdate();
                pre.close();
            }
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
