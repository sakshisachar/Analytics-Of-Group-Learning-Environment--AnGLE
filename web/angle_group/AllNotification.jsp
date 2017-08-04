<%-- 
    Document   : AllNotification
    Created on : 3 Jul, 2017, 8:43:11 PM
    Author     : pratik
--%>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notification</title>
    </head>
    <body>
        <h2>All Notifications</h2>
        <s:iterator value="allNotifications" status="incrementer">
            <li>
                <a>
                    <span>
                        <span><s:property value="groupName"/></span>
                        <br>
                        <span><s:property value="title" /></span>
                        <br>
                    </span>
                    <span class="message"><s:property value="content" /></span>
                    <br><br>
                </a>
            </li>
        </s:iterator>

    </body>
</html>
