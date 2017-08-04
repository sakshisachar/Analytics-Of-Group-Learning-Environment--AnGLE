<%-- 
    Document   : AnalyseQuizMarks
    Created on : 3 Jul, 2017, 12:58:02 AM
    Author     : pratik
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@taglib prefix="s" uri="/struts-tags"%>
<head>

    <link href="asset/datatables/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
<!--    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>-->
    <script type="text/javascript"></script>
    <script src="js/analyseQuizMarks.js"></script>
    <style>
        #exTab1 .tab-content {
            color: #1e0b0b;
        }
    </style>
</head> 


<div id="barchart_material" style="width: 1000px; height: 500px; margin-top: 70px"></div>
<s:iterator value="quizMarks">
    <script> quiz = "<s:property value="title" />";</script>
    <script> min = "<s:property value="min" />";</script>
    <script> max = "<s:property value="max" />";</script>
    <script> avg = "<s:property value="avg" />";</script>
    <script>
        var key = quiz.toString();
        mapMin[key] = min;
        mapMax[key] = max;
        mapAvg[key] = avg;
        length++;
    </script>
</s:iterator>
    
<script>

        google.charts.setOnLoadCallback(drawChart);

    
</script>

<%@ include file="/include/script.jsp" %>