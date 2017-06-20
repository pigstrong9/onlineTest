package com.model;

import com.dbhelper.dbBase;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

public class User {

    private String username;
    private String password;
    private int type;
    private String name;
    private String email;
    private String major;
    private String phone;
    private String typeName;

    public String getTypeName() {
        String tn=null;
        switch(this.type){
            case 0:
                tn="学生";
                break;
            case 1:
                tn="教师";
                break;
            case 2:
                tn="管理员";
                break;
        }
        return tn;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
    

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

  

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        this.password = dbBase.EncoderByMd5(password);
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
