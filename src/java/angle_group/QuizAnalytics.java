/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;

import bean.AnalyseQuizMarks;
import bean.Person;
import bean.UserGroup;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import utilities.Utility;

/**
 *
 * @author Kunal
 */
public class QuizAnalytics {
    
    private ArrayList<AnalyseQuizMarks> quizMarks = new ArrayList<AnalyseQuizMarks> ();
    private Integer totalQuiz;
    private Integer totalMarks;
    private HashMap<Integer, HashMap<String, Integer>> quiz_Attendance = new HashMap<Integer, HashMap<String, Integer>>();
    private ArrayList<UserGroup> members=new ArrayList<UserGroup> ();
    private HashMap<Integer, HashMap<String, Integer>> userPerformance = new HashMap<Integer, HashMap<String, Integer>> ();
    private Integer count;
    private Person person;
    private Integer groupId;
    

    
    public Integer getTotalMarks() {
        return totalMarks;
    }

    public void setTotalMarks(Integer totalMarks) {
        this.totalMarks = totalMarks;
    }

    
    public Integer getTotalQuiz() {
        return totalQuiz;
    }

    public void setTotalQuiz(Integer totalQuiz) {
        this.totalQuiz = totalQuiz;
    }

    public ArrayList<UserGroup> getMembers() {
        return members;
    }

    public void setMembers(ArrayList<UserGroup> members) {
        this.members = members;
    }

    public HashMap<Integer, HashMap<String, Integer>> getUserPerformance() {
        return userPerformance;
    }

    public void setUserPerformance(HashMap<Integer, HashMap<String, Integer>> userPerformance) {
        this.userPerformance = userPerformance;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public HashMap<Integer, HashMap<String, Integer>> getQuiz_Attendance() {
        return quiz_Attendance;
    }

    public void setQuiz_Attendance(HashMap<Integer, HashMap<String, Integer>> quiz_Attendance) {
        this.quiz_Attendance = quiz_Attendance;
    }

    public ArrayList<AnalyseQuizMarks> getQuizMarks() {
        return quizMarks;
    }

    public void setQuizMarks(ArrayList<AnalyseQuizMarks> quizMarks) {
        this.quizMarks = quizMarks;
    }
    
    
    public String getUsersPerformance()
    {
        try
        {
             AngleUtility utility=new AngleUtility();
             HttpServletRequest req = ServletActionContext.getRequest();
             HttpSession session=req.getSession();
             groupId = Integer.parseInt(req.getParameter("gid").toString());
             person = (Person) session.getAttribute(Utility.USER_HANDLE);
             totalQuiz = utility.getTotalQuiz(groupId);
             if(person!=null && groupId > 0)
             {
                 totalMarks=utility.getTotalMarksByGroup(groupId);
                 members = utility.getAllMembers(groupId);
                 for (UserGroup member : members)
                 {
                     count=0;
                     HashMap<String, Integer> user = new HashMap<String, Integer>();
                     count=utility.userTotalQuizMarks(groupId, member.getUserId());
                     user.put(member.getUserName(), count);
                     userPerformance.put(member.getUserId(),user);
                 }
                 return Utility.SUCCESS;
             }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return Utility.ERROR;
    }
    
    public String getUsersAttendance()
    {
        try
        {
             AngleUtility utility=new AngleUtility();
             HttpServletRequest req = ServletActionContext.getRequest();
             HttpSession session=req.getSession();
             groupId = Integer.parseInt(req.getParameter("gid").toString());
             person = (Person) session.getAttribute(Utility.USER_HANDLE);
             if(person!=null && groupId > 0)
             {
                 totalQuiz = utility.getTotalQuiz(groupId);
                 members = utility.getAllMembers(groupId);
                 for (UserGroup member : members)
                 {
                     count=0;
                     HashMap<String, Integer> user = new HashMap<String, Integer>();
                     count=utility.userQuizAttendance(groupId, member.getUserId());
                     user.put(member.getUserName(), count);
                     userPerformance.put(member.getUserId(),user);
                 }
                 return Utility.SUCCESS;
             }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return Utility.ERROR;   
    }
    public String getQuizAttendance()
    {
        try
        {
             AngleUtility utility=new AngleUtility();
             HttpServletRequest req = ServletActionContext.getRequest();
             HttpSession session=req.getSession();
             groupId = Integer.parseInt(req.getParameter("gid").toString());
             if ( groupId > 0)
             {
                 members = utility.getAllMembers(groupId);
                 quiz_Attendance = utility.getQuizAttendance(groupId);
                 System.out.println(members.size() + " "+quiz_Attendance.size());
                 return Utility.SUCCESS;
             }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return Utility.ERROR;   
    }
    public String getQuizMarksAnalytics()
    {
        try
        {
             AngleUtility utility=new AngleUtility();
             HttpServletRequest req = ServletActionContext.getRequest();
             HttpSession session=req.getSession();
             groupId = Integer.parseInt(req.getParameter("gid").toString());
             person = (Person) session.getAttribute(Utility.USER_HANDLE);
             if(person!=null && groupId > 0)
             {
                 //totalQuiz = utility.getTotalQuiz(groupId);
                 //members = utility.getAllMembers(groupId);
                 quizMarks = utility.analyseQuizMark(groupId);
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
