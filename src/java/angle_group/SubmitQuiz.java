/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;

import bean.Person;
import bean.QuizResponse;
import bean.QuizSelectedOptions;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Objects;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import utilities.Utility;

/**
 *
 */
public class SubmitQuiz extends ActionSupport{

    private String Id;
    private Integer userId;
    private Integer quizId;
    ArrayList<QuizResponse> response=new ArrayList<QuizResponse>();
    ArrayList<QuizSelectedOptions> selectedOptions = new ArrayList<QuizSelectedOptions> ();
    Integer totalMarks;

    public String getId() {
        return Id;
    }

    public void setId(String Id) {
        this.Id = Id;
    }

    
    public ArrayList<QuizResponse> getResponse() {
        return response;
    }

    public void setResponse(ArrayList<QuizResponse> response) {
        this.response = response;
    }
  
    public Integer getTotalMarks() {
        return totalMarks;
    }

    public void setTotalMarks(Integer totalMarks) {
        this.totalMarks = totalMarks;
    }
   
    public ArrayList<QuizSelectedOptions> getSelectedOptions() {
        return selectedOptions;
    }

    public void setSelectedOptions(ArrayList<QuizSelectedOptions> selectedOptions) {
        this.selectedOptions = selectedOptions;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getQuizId() {
        return quizId;
    }

    public void setQuizId(Integer quizId) {
        this.quizId = quizId;
    }
   
    
    /*
        Function to submit quiz
    */
    public String submitQuiz()
    {
        totalMarks=0;
        userId=getUserId();
        selectedOptions=getSelectedOptions();
        
        ArrayList<Integer> quesId = new ArrayList<Integer>();
        ArrayList<Integer> selectedOption = new ArrayList<Integer>();
        
        AngleUtility utility=new AngleUtility();
        for(int i=0; i<selectedOptions.size(); i++)
        {
            quesId.add(selectedOptions.get(i).getQuestionId());
            selectedOption.add(selectedOptions.get(i).getOptionId());
            if(!Objects.equals(selectedOptions.get(i).getOptionId(), selectedOptions.get(i).getAnswerId())) {
            } else {
                totalMarks+=selectedOptions.get(i).getMarks();
            }
        }
            utility.saveQuizResponse(userId, quizId, totalMarks, quesId, selectedOption);
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session = request.getSession();
            session.setAttribute("quizId",String.valueOf(quizId));
        
        return Utility.SUCCESS;
    }
    
   public String showReport()
   {
        HttpServletRequest request = ServletActionContext.getRequest();
            try
            {
                AngleUtility utility=new AngleUtility();
                Id=(String)request.getParameter("Id");
                userId=Integer.parseInt(request.getParameter("userId"));    
                if (Id != null && userId > 0)
                {
                    totalMarks = 0;
                    quizId = Integer.parseInt(Id);
                    response = utility.getQuizResponse(userId, quizId);
                    for (QuizResponse r : response) {
                        totalMarks += r.getMarks();
                    }
                    System.out.println(quizId+ " " + response.size() + " " + userId);
                    return Utility.SUCCESS;
                }
            }
            catch(Exception e)
            {     
                e.printStackTrace();
            }
            return Utility.ERROR;
   }
    public String displayResult()
    {
        try
        {
            Person person=null;
            AngleUtility utility=new AngleUtility();           
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session = request.getSession();
            person = (Person) session.getAttribute("loggedInUser");
            Id = (String) session.getAttribute("quizId");
            session.setAttribute("quizId", null);
            if (person != null && Id != null) {
                totalMarks = 0;
                quizId = Integer.parseInt(Id);
                userId = person.getLoginId();
                response = utility.getQuizResponse(userId, quizId);
                for (QuizResponse r : response) {
                    totalMarks += r.getMarks();
                }
                System.out.println(quizId+ " " + response.size() + " " + userId);

                return Utility.SUCCESS;
            }
          }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return Utility.ERROR;
    }
    
}
