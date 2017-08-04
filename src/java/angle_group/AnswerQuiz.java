/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;

import bean.Question;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import utilities.Utility;

/**
 *
 *
 */
public class AnswerQuiz extends ActionSupport {
  
    private Integer quizId;
    private Integer groupId;
    private Integer userId;
    private String title;
    private ArrayList<Question> quizQuestions;

    public ArrayList<Question> getQuizQuestions() {
        return quizQuestions;
    }

    public void setQuizQuestions(ArrayList<Question> quizQuestions) {
        this.quizQuestions = quizQuestions;
    }
    
    public Integer getQuizId() {
        return quizId;
    }

    public void setQuizId(Integer quizId) {
        this.quizId = quizId;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    
    public String execute()
    {
        try
        {
            groupId=getGroupId();
            userId=getUserId();
            quizId=getQuizId();
            title=getTitle();
            AngleUtility utility=new AngleUtility();
            quizQuestions=utility.getQuizQuestions(quizId, groupId, userId);
            return Utility.SUCCESS;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return Utility.ERROR;
        }
    }
}