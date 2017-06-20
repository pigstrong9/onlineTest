/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.util.List;

public class Exam {

    //SCQ 单选题 MCQ 多选题 codeQ 代码题
    private int id;
    private String name;
    private String cId;
    private String author;
    private String dateline;
    private List<SCQ> SCQlist;
    private List<MCQ> MCQlist;
    private List<CodeQ> CodeQlist;
    private int scqNumber;
    private int mcqNumber;
    private int codeqNumber;

    private int SCQscore;
    private int MCQscore;
    private int CODEscore;

    public int getScqNumber() {
        return scqNumber;
    }

    public void setScqNumber(int scqNumber) {
        this.scqNumber = scqNumber;
    }

    public int getMcqNumber() {
        return mcqNumber;
    }

    public void setMcqNumber(int mcqNumber) {
        this.mcqNumber = mcqNumber;
    }

    public int getCodeqNumber() {
        return codeqNumber;
    }

    public void setCodeqNumber(int codeqNumber) {
        this.codeqNumber = codeqNumber;
    }
    
    
    
    public String getcId() {
        return cId;
    }

    public void setcId(String cId) {
        this.cId = cId;
    }

    public int getSCQscore() {
        SCQscore = 30 / (SCQlist.size());
        return SCQscore;
    }

    public int getMCQscore() {
        MCQscore = 20 / (MCQlist.size());
        return MCQscore;
    }

    public int getCODEscore() {
        CODEscore = 50 / (CodeQlist.size());
        return CODEscore;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<SCQ> getSCQlist() {
        return SCQlist;
    }

    public void setSCQlist(List<SCQ> SCQlist) {
        this.SCQlist = SCQlist;
    }

    public List<MCQ> getMCQlist() {
        return MCQlist;
    }

    public void setMCQlist(List<MCQ> MCQlist) {
        this.MCQlist = MCQlist;
    }

    public List<CodeQ> getCodeQlist() {
        return CodeQlist;
    }

    public void setCodeQlist(List<CodeQ> CodeQlist) {
        this.CodeQlist = CodeQlist;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDateline() {
        return dateline;
    }

    public void setDateline(String dateline) {
        this.dateline = dateline;
    }

}
