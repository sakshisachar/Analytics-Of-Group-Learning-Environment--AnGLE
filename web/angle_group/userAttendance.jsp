<%-- 
    Document   : userAttendance
    Created on : 1 Jul, 2017, 11:04:43 PM
    Author     : pratik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@taglib prefix="s" uri="/struts-tags"%>
<head>
    <link href="asset/datatables/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <!--<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>-->
    <script type="text/javascript"></script>
    <script src="js/userAttendance.js"></script>
    <style>
        #exTab1 .tab-content {
            color: #1e0b0b;
        }
    </style>
</head>
<input type="hidden" id="quizCount" value='<s:property value="totalQuiz"/>' >
<div id="barchart_material" style="width: 1000px; height: 500px; margin-top: 70px"></div>
<s:iterator value="userPerformance">
    <script> userId = "<s:property value="key" />";</script>
    <s:iterator value="value">
        <script> userName = "<s:property value="key" />";</script>
        <script> userQuiz = "<s:property value="value" />";</script>
    </s:iterator>
    <script>
        var key = userId;
        var value1 = userName.toString();
        var value = userQuiz;
        map[key] = value;
        map1[key] = value1;
        length++;
    </script>
</s:iterator>
    
<script>

        google.charts.setOnLoadCallback(drawChart);

    
</script>

<%@ include file="/include/script.jsp" %>