package com.util;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.dbhelper.*;

final public class ApplicationContextUtil {

    private static ApplicationContext ac = null;

    private ApplicationContextUtil() {

    }

    static {
        ac = new ClassPathXmlApplicationContext("applicationContext.xml");
    }

    public static ApplicationContext getApplicationContext() {
        return ac;
    }

    public static void getdbBeans(dbClass dbc, dbExam dbe, dbScore dbs, dbAnswer dba, dbUser dbu, dbLession dbl) {
        dbc = (dbClass) ac.getBean("dbClass");
        dbe = (dbExam) ac.getBean("dbExam");
        dbs = (dbScore) ac.getBean("dbScore");
        dba = (dbAnswer) ac.getBean("dbAnswer");
        dbu = (dbUser) ac.getBean("dbUser");
        dbl = (dbLession) ac.getBean("dbLession");
    }

    public static void getdbBeans(dbClass dbc, dbExam dbe, dbScore dbs,
            dbAnswer dba) {
        dbc = (dbClass) ac.getBean("dbClass");
        dbe = (dbExam) ac.getBean("dbExam");
        dbs = (dbScore) ac.getBean("dbScore");
        dba = (dbAnswer) ac.getBean("dbAnswer");
    }

    public static void getdbBeans(dbScore dbs, dbClass dbc, dbAnswer dba) {
        dbs = (dbScore) ac.getBean("dbScore");
        dbc = (dbClass) ac.getBean("dbClass");
        dba = (dbAnswer) ac.getBean("dbAnswer");
    }

}
