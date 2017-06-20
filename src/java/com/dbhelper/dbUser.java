
package com.dbhelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.User;

public class dbUser {

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


    public boolean delUser(String username) {
        boolean ok = false;
        try {
            con = db.conGet();
            sta = con.createStatement();
            String sql = "delete from users where username='"+username+"'";
            sta.executeUpdate(sql);
            ok = true;
        } catch (SQLException e) {
            System.out.print("连接错误！");
            throw new RuntimeException(e);
        }
        db.conDown(con);
        db.staDown(sta);
        return ok;
    }

    public List<User> getUserList(String type, String username) {
        List<User> list = null;
        try {
            con = db.conGet();
            sta = con.createStatement();
            String sql = "select username,name,phone,email,type,major from users";
            if (!type.equals("")) {
                sql = sql + " where type= " + type;           //按类型查询
            } else if (!username.equals("")) {
                sql = sql + " where username like '" + username + "%'";  //按学号用户名查询
            }

            rs = sta.executeQuery(sql);
            list = new ArrayList<>();
            while (rs.next()) {
                User u = new User();
                u.setUsername(rs.getString(1));
                u.setName(rs.getString(2));
                u.setPhone(rs.getString(3));
                u.setEmail(rs.getString(4));
                u.setType(rs.getInt(5));
                u.setMajor(rs.getString(6));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.print("连接错误！");
            throw new RuntimeException(e);
        }
        db.conDown(con);
        db.staDown(sta);
        db.resDown(rs);
        System.out.println(list.size());
        return list;
    }

    public boolean modifyPassword(User user, String password) {
        boolean ok = false;
        try {
            con = db.conGet();
            sta = con.createStatement();
            String sql = "update users set password='" + password + "' "
                    + "where username='" + user.getUsername() + "' ";
            sta.executeUpdate(sql);
            ok = true;
        } catch (SQLException e) {
            System.out.print("连接错误！");
            throw new RuntimeException(e);
        }
        db.conDown(con);
        db.staDown(sta);
        return ok;

    }

    public boolean modifyUser(User user) {
        boolean ok = false;
        try {
            con = db.conGet();
            sta = con.createStatement();
            String sql = "update users set name='" + user.getName() + "' , phone=" + user.getPhone() + " ,email='" + user.getEmail() + "' "
                    + "where username='" + user.getUsername() + "' ";
            sta.executeUpdate(sql);
            ok = true;
        } catch (SQLException e) {
            System.out.print("连接错误！");
            throw new RuntimeException(e);
        }
        db.conDown(con);
        db.staDown(sta);
        return ok;

    }

    public boolean check(User user) // 判断用户密码是否正确
    {
        boolean ok = false;
        try {
            con = db.conGet();
            sta = con.createStatement();
            String sql = "select * from  users where username= '" + user.getUsername() + "' and password= '" + user.getPassword() + "'" + "and type= " + user.getType() + "";
            rs = sta.executeQuery(sql);
            if (rs.next()) {
                ok = true;
            }
        } catch (SQLException e) {
            System.out.print("连接错误！");
            throw new RuntimeException(e);
        }
        db.conDown(con);
        db.staDown(sta);
        db.resDown(rs);
        return ok;

    }

    public boolean addUser(User user) {
        boolean ok = false;
        PreparedStatement pre = null;
        try {
            con = db.conGet();
            sta = con.createStatement();
            String sql = "insert into users(username,name,phone,major,type) values(?,?,?,?,?)";
            pre = con.prepareStatement(sql);
            pre.setString(1, user.getUsername());
            pre.setString(2, user.getName());
            pre.setString(3, user.getPhone());
            pre.setString(4, user.getMajor());
            pre.setInt(5, user.getType());
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

    public User getUserMsg(User a) // 获取用户的其他信息
    {

        try {
            con = db.conGet();
            sta = con.createStatement();
            rs = sta.executeQuery("select name,email,major,phone from users where username='" + a.getUsername() + "'");
            while (rs.next()) {
                a.setName(rs.getString(1));
                a.setEmail(rs.getString(2));
                a.setMajor(rs.getString(3));
                a.setPhone(rs.getString(4));
            }
        } catch (SQLException e) {
            System.out.print("连接错误！");
            throw new RuntimeException(e);
        }
        db.conDown(con);
        db.staDown(sta);
        db.resDown(rs);
        return a;
    }

}
