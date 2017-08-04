<%--
    Document   : DAO_saveQuestionsDetails
    Created on : 28 Jun, 2017, 1:32:25 PM
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="angle_group.AngleUtility"%>
<%
    String marks=request.getParameter("qMarks");
    String quizId= request.getParameter("quiz_id");
    String question = request.getParameter("question");
    String options=request.getParameter("optionarr");
    String optionsArray[]=options.split("__");
    String answerId= request.getParameter("answer");
    String questionId = request.getParameter("questionId");
    String result = "";

    System.out.println(marks+ " "+quizId+" " + answerId+ " "+questionId);
    System.out.println(questionId);
    AngleUtility utility = new AngleUtility();
    int status = utility.saveQuestionDetails(Integer.parseInt(quizId), question, Integer.parseInt(marks), optionsArray, Integer.parseInt(answerId));
    
    result += questionId + "#" + status;
    
    Gson gson = new Gson();
    gson.toJson(result);
    out.print(gson.toJson(result));
%>