<%-- 
    Document   : DAO_getTheGroupTree
    Created on : 30 Jun, 2017, 1:47:37 AM
    Author     : ubuntu
--%>

<%@page import="bean.GroupTree"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="angle_group.AngleUtility"%>
<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page contentType="text/json" pageEncoding="UTF-8"%>
<%
  GroupTree groupTree;
  int groupId= Integer.parseInt(request.getParameter("groupId"));
  System.out.println("groupid : " +groupId);
   AngleUtility util = new AngleUtility();
    try{
      groupTree=util.getTheGroupTree(groupId);
       Gson gson = new Gson();
       //gson.toJson(groupTree);
       System.out.println("here");
       out.print(gson.toJson((groupTree)));
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
 
  
%>
