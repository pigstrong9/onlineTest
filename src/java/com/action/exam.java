package com.action;

import com.model.MCQ;
import com.model.SCQ;
import com.model.Classes;
import com.model.CodeQ;
import com.model.Article;
import com.model.Exam;
import com.dbhelper.dbAnswer;
import com.dbhelper.dbExam;
import com.dbhelper.dbClass;
import com.dbhelper.dbScore;
import static com.action.user.getUsername;
import com.opensymphony.xwork2.ActionSupport;
import com.util.ApplicationContextUtil;
import java.io.UnsupportedEncodingException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;

public class exam extends ActionSupport {

    private Article art = null;
    private Exam exam = null;
    private List<String> SCQanswer;         //保存考生的单选题答案
    private List<String> MCQanswer;         //保存考生的多选题答案
    private List<CodeQ> CODEanswer;         //保存考生的简答题答案
    private String result;                  //返回提示

    private final ApplicationContext ac;
    private static dbClass dbc;
    private static dbExam dbe;
    private static dbScore dbs;
    private static dbAnswer dba;

    public exam() {
        ac = ApplicationContextUtil.getApplicationContext();
        dbc = (dbClass) ac.getBean("dbClass");
        dbe = (dbExam) ac.getBean("dbExam");
        dbs = (dbScore) ac.getBean("dbScore");
        dba = (dbAnswer) ac.getBean("dbAnswer");
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public List<String> getMCQanswer() {
        return MCQanswer;
    }

    public void setMCQanswer(List<String> MCQanswer) {
        this.MCQanswer = MCQanswer;
    }

    public List<CodeQ> getCODEanswer() {
        return CODEanswer;
    }

    public void setCODEanswer(List<CodeQ> CODEanswer) {
        this.CODEanswer = CODEanswer;
    }

    public List<String> getSCQanswer() {
        return SCQanswer;
    }

    public void setSCQanswer(List<String> SCQanswer) {
        this.SCQanswer = SCQanswer;
    }

    public Exam getExam() {
        return exam;
    }

    public void setExam(Exam exam) {
        this.exam = exam;
    }

    public Article getArt() {
        return art;
    }

    public void setArt(Article art) {
        this.art = art;
    }

    public String show() {
        if (ServletActionContext.getContext().getSession().get("lessionList1") == null) {
            leftList();
        }
        return "show";
    }

    public void leftList() {            //获取页面左边的科目列表

        List<Classes> lessionList1 = dbc.getLessonList(getUsername(), 0);//待考试
        List<Classes> lessionList2 = dbc.getLessonList(getUsername(), 2);//待补考
        List<Classes> lessionList3 = dbc.getLessonList(getUsername(), 1);//待批改
        ServletActionContext.getContext().getSession().put("lessionList1", lessionList1);
        ServletActionContext.getContext().getSession().put("lessionList2", lessionList2);
        ServletActionContext.getContext().getSession().put("lessionList3", lessionList3);

    }

    public String list() {                  //加载list页面,判断是否加载过
        if (ServletActionContext.getContext().getSession().get("lessionList1") == null) {
            leftList();
        }
        return SUCCESS;
    }

    public String welcome() {                   //加载考试规定
        List<Article> artList = (List<Article>) (ServletActionContext.getContext().getSession().get("artList"));
        this.art = (artList.get(0));
        return SUCCESS;
    }

    public String test() {                      //加载试卷
        String id = ServletActionContext.getRequest().getParameter("id");
        this.exam = (dbe.getExam(id));
        return SUCCESS;
    }

    public int correct(List<String> result, int id, int score, String type) {       //将考生成绩与答案进行匹配,返回成绩
        int part = 0;
        if (result == null) {
            return part;
        }
        if (type.equals("SCQ")) {
            List<SCQ> answer = dbe.getSCQlist(id);
            for (int i = 0; i < result.size(); i++) {
                if (result.get(i).equals(answer.get(i).getAnswer())) {
                    part += score;
                }
            }
        } else if (type.equals("MCQ")) {
            List<MCQ> answer = dbe.getMCQlist(id);
            for (int i = 0; i < result.size(); i++) {
                if (result.get(i).equals(answer.get(i).getAnswer())) {
                    part += score;
                }
            }
        }

        return part;
    }

    public String send() throws UnsupportedEncodingException {       //计算成绩并把选择题成绩保存到数据库

        HttpServletRequest request = ServletActionContext.getRequest();
        int id = Integer.parseInt(request.getParameter("id"));
        String cId = request.getParameter("cId");
        int s = Integer.parseInt(request.getParameter("SCQscore"));//单选题分值
        int m = Integer.parseInt(request.getParameter("MCQscore"));//多选题分值

        int part1 = correct(getSCQanswer(), id, s, "SCQ");          //单选题得分    
        int part2 = correct(getMCQanswer(), id, m, "MCQ");          //多选题得分

        if (dbs.saveSelectionScore(getUsername(), cId, part1 + part2) && dba.saveResult(CODEanswer, getUsername())) {
            setResult("提交成功");
            ServletActionContext.getContext().getSession().remove("lessionList1");
        } else {
            setResult("提交失败，请联系管理员！");
        }

        return "message";
    }

}
