/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author Kunal
 */
public class QuizReport {
    
    private Integer totalQuizCount;
    private Integer quizAttemptedCount;
    private ArrayList<Quiz> quizAttempted;
    private Integer userId;

    
    public ArrayList<Quiz> getQuizAttempted() {
        return quizAttempted;
    }

    public void setQuizAttempted(ArrayList<Quiz> quizAttempted) {
        this.quizAttempted = quizAttempted;
    }
    
    public Integer getTotalQuizCount() {
        return totalQuizCount;
    }

    public void setTotalQuizCount(Integer totalQuizCount) {
        this.totalQuizCount = totalQuizCount;
    }

    public Integer getQuizAttemptedCount() {
        return quizAttemptedCount;
    }

    public void setQuizAttemptedCount(Integer quizAttemptedCount) {
        this.quizAttemptedCount = quizAttemptedCount;
    }

  
   
    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
    
}
