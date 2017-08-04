<%-- 
    Document   : openQuiz
    Created on : 29 Jun, 2017, 12:52:17 PM
    Author     : pratik
--%>
<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@ include file="/include/header.jsp" %>
    <title>Quiz</title>

    <!-- iCheck -->
    <link href="asset/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- Switchery -->
    <link href="asset/switchery/dist/switchery.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>

    <!-- Ion.RangeSlider -->
    <!--<link href="ion.rangeSlider/normalize.css" rel="stylesheet">-->
    <link href="ion.rangeSlider/css/ion.rangeSlider.css" rel="stylesheet">
    <link href="ion.rangeSlider/css/ion.rangeSlider.skinModern.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="css/daterangepicker.css" rel="stylesheet">
    <link href="asset/bootstrap_timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            font-size: 140%;
            font-weight: normal;
        }
    </style>
</head>

<body style="background: #d7e9c1;">
    <div class="container body" style="background-color: #d7e9c1;">
        <div class="main_container" >
            <div class="row">
                <div class="col-md-12 col-xs-12" style="height:200px;background-image: url(images/bg-1.jpg) ;background-size:cover;">  
                </div>
            </div>
            <div class="row">
                <div class="col-md-2 col-sm-1">               
                </div>
                <div class="col-md-8 col-sm-10" style="min-height: 1105px;position: relative;bottom: 50px;">
                    <div class="row" style="">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2 style="color:#3f5265;"><b>Quiz : <s:property value="title"/> </b></h2>
                                    <div class="clearfix"></div>
                                </div>

                                <div class="x_content">
                                    <br>
                                    <label style="color:#526374;"> Total Marks Obtained : : <s:property value="totalMarks"/></label> 
                                    <br>
                                    <br>
                                        <s:iterator value="response" status="itStatus">    
                                            <label style="color:#526374;"> <s:property escape="false" value="#itStatus.index+1"/>. <s:property escape="false" value="question"/></label> 
                                            <label style="color:#526374; margin-left: 70%">  Marks Obtained : [<s:property escape="false" value="marks"/>]</label> 
                                            <br>
                                            <%
                                                if(request.getAttribute("answerId") == request.getAttribute("selectedOptionId"))
                                                {
                                            %>
                                            <br><br><label style="color:green;"> Correct answer : <s:property value="correctAnswer"/>  </label>
                                            <br>
                                            <label style="color:green;"> Selected option : <s:property value="correctAnswer"/>  </label>
                                            <%
                                                }
                                                else
                                                {
                                            %>
                                            <label style="color:green;"> Correct answer : <s:property value="correctAnswer"/>  </label>
                                            <br>
                                            <%
                                                    if((Integer)request.getAttribute("selectedOptionId") > 0)
                                                    {
                                            %>
                                                    <label style="color:red;"> Selected option : <s:property value="selectedOption"/>  </label>
                                            <%
                                                    }
                                                    else
                                                    {
                                            %>
                                                    <label style="color:red;"> Selected option : none  </label>
                                            <%
                                                    }
                                                }
                                            %>
                                            <br> <br> <br>
                                        </s:iterator>                                       
                                        <br/><br/>

                                        <div class="col-md-2 col-sm-12 col-xs-12"></div>
                                        <div class="col-md-8 col-sm-12 col-xs-12">
                                            <center><button class="btn btn-primary" onclick="window.location='groupPage.html'" value="GoToHome">Go To Home</button></center>
                                        </div>
                                        <div class="col-md-2 col-sm-12 col-xs-12"></div>
                                        <!--<span class="btn btn-primary">Validate form</span>-->


                                </div>
                            </div>        
                        </div>    
                    </div> 

                </div>
                <div class="col-md-2 ">               
                </div>
            </div>

        </div>
    </div>     
    <%@ include file="/include/script.jsp" %>

    <script src="js/moment.min.js"></script>
    <script src="js/daterangepicker.js"></script>
    <script src="asset/iCheck/icheck.min.js"></script>
    <script src="asset/switchery/dist/switchery.min.js"></script>
    <!-- Ion.RangeSlider -->
    <script src="ion.rangeSlider/js/ion.rangeSlider.min.js"></script>
    <script src="asset/bootstrap_timepicker/bootstrap-timepicker.min.js"></script>
</body>
