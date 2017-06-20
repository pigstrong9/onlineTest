/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dbhelper;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import sun.misc.BASE64Encoder;

public class dbBase {

    public String jdbcurl;
    public String username;
    public String password;

    public String getJdbcurl() {
        return jdbcurl;
    }

    public void setJdbcurl(String jdbcurl) {
        this.jdbcurl = jdbcurl;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    

    public dbBase() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("正在连接数据库！");
        } catch (ClassNotFoundException ex) {
            System.out.print("连接错误！");
            throw new RuntimeException(ex);
        }
    }

    public static String EncoderByMd5(String str) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        //确定计算方法

        MessageDigest md5 = MessageDigest.getInstance("MD5");

        BASE64Encoder base64en = new BASE64Encoder();
        //加密后的字符串

        String newstr = base64en.encode(md5.digest(str.getBytes("utf-8")));

        return newstr;

    }

    public Connection conGet() {
        Connection con = null;
        try {
            con = DriverManager.getConnection(jdbcurl, username, password);
        } catch (SQLException e) {
            System.out.print("连接错误！");
            throw new RuntimeException(e);
        } finally {
            return con;
        }
    }

    public void conDown(Connection con) {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public void staDown(Statement sta) {
        if (sta != null) {
            try {
                sta.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public void preDown(PreparedStatement pre) {
        if (pre != null) {
            try {
                pre.close();

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public void resDown(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

}
