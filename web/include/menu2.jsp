<%-- 
    Document   : menu
    Created on : 1 Feb, 2017, 10:30:22 AM
    Author     : dipesh
--%>

<%@page import="bean.Person"%>
<%@page import="org.apache.struts2.ServletActionContext"%>
<%--<%@page import="org.jboss.weld.context.http.HttpRequestContext"%>--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!-- side bar column starts here -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<%
    String groupId = request.getParameter("groupId");
%>
<div class="col-md-3 left_col">
    <div class="left_col scroll-view">
        <div class="navbar nav_title" style="border: 0;">
            <a href="home.html" class="site_title"><i class="fa fa-paw"></i> <span>AnGLE!</span></a>
        </div>

        <div class="clearfix"></div>

        <!-- menu profile quick info -->
        <s:if test="#session.loggedInUser != null">
            <div class="profile clearfix">
                <div class="profile_pic">
                    <img src="images/user.jpg" alt="..." class="img-circle profile_img">
                </div>
                <div class="profile_info">
                    <span>Welcome,</span>
                    <h2><s:property value="#session.loggedInUser.loginName"/></h2>

                </div>
            </div>
        </s:if>

        <!-- /menu profile quick info -->

        <br />

        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">

                <ul class="nav side-menu">
                    <li>
                        <a href="groupPage.html"><i class="fa fa-home"></i>Home</a>
                    </li>
                    <li>
                        <a href="MainGroupPage.html?groupId=<%= groupId %>"><i class="fa fa-home"></i>Group Page</a>
                    </li>
                    
                   
                    <s:if test='profileId == 0 || profileId == 1 && parentId ==0' >
                        
                    
                    <li>
                        <a onclick="createSubgroup();" ><i class ="fa fa-edit"></i>Create Subgroup</a>
                    </li>
                                            
                    </s:if>
                     <s:if test='profileId == 0 || profileId == 1 && parentId ==0'>
                    <li id="groupTree"><a onclick="getTheGroupTree('<%=groupId %>')"><i class="fa fa-desktop"></i> Sub Groups <span class="fa fa-chevron-down"></span></a>
                        
                    </li>
                     </s:if>
                    
                     <s:if test='profileId == 0 || profileId == 1'>
                    <li>
                        <a onclick="showTopic()"><i class="fa fa-edit"></i>Create Topic</a>
                    </li>
                     </s:if>
                    <li><a><i class="fa fa-desktop"></i>My Topics<span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <s:iterator value="listOfTopics">
                                <li>
                                    <a>
                                        <s:property value="name"/>                                        	 
                                    </a>
                                </li>   
                            </s:iterator>
                        </ul>

                    </li>



                    
                    <!--
                        Start
                        Add New Profile
                    -->
                    <li><a><i class="fa fa-desktop"></i> Manage Group <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">

                            
                                <s:if test='profileId == 0 || profileId == 1'>

                                <li><a> Available Profiles <span class="fa fa-chevron-down"></span> </a>
                                    <ul class="nav child_menu">
                                        <s:iterator var="profiles" value="profilesList" status="incrementer">

                                            <li><a onclick="rights2('<s:property value="key"/>', '<s:property value="gid"/>', '1')"><s:property value="value" /> </a>
                                            </li>
                                        </s:iterator>

                                    </ul>
                                </li>
                            </s:if>

                        </ul>
                    </li>

                    <!--
                        End
                        Add New Profile
                    -->
                    <s:if test='profileId == 0 || profileId == 1'>
                    <!-- Analytics -->
                    <li><a><i class="fa fa-desktop"></i>Analytics<span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            
                             <li><a> Notes <span class="fa fa-chevron-down"></span> </a>
                                <ul class="nav child_menu"> 
                                   <li><a onclick="analytics('NotesAnalytics.html')" >Note Count vs User</a></li>
                                </ul>
                            </li>
                            <li><a> Assignment <span class="fa fa-chevron-down"></span> </a>
                                <ul class="nav child_menu"> 
                                    <li><a onclick="analytics('assignmentAnalysis.html')" >Assignment Analysis</a></li>
                                    <li><a onclick="analytics('lateSubmissionAnalysis.html')" >Late Assignment Submission Analysis</a></li>
                                    <li><a onclick="analytics('toppersAnalysis.html')" >Toppers Analysis</a></li>
                                    <li><a onclick="analytics('gradesAnalysis.html')" >Grades Analysis</a></li>
                                </ul>
                            </li>
                            <li><a> Poll <span class="fa fa-chevron-down"></span> </a>
                                <ul class="nav child_menu">
                                    <li><a onclick="analytics('PollUsers.html')">Users Vs Votes</a></li>
                                    <li><a onclick="analytics('PollVotes.html')">Votes Vs Poll</a></li>
                                    <li><a onclick="analytics('PollOptions.html')">Poll Vs Option</a></li>
                                </ul>
                            </li>
                            <li><a> Quiz <span class="fa fa-chevron-down"></span> </a>
                                <ul class="nav child_menu">
                                    <li><a onclick="analytics('UserAttendance.html')">User Attendance</a></li>
                                    <li><a onclick="analytics('QuizUserPerformance.html')">User Performance</a></li>
                                    <li><a onclick="analytics('QuizAttendance.html')">Quiz Attendance</a></li>
                                    <li><a onclick="analytics('QuizPerformance.html')">Quiz Performance</a></li>
                                </ul>
                            </li>
                            <li><a> Discussion Forum <span class="fa fa-chevron-down"></span> </a>
                                <ul class="nav child_menu">
                                    <li><a onclick="analytics('discussionDetails.html')">User Participation</a></li>
                                    <li><a onclick="analytics('groupDiscussionAnalytics.html')">Post Vs Users/Replies</a></li>
                                    <li><a onclick="analytics('postPerUser.html')">User Vs Post </a></li>
                                </ul>
                            </li>
                            <li><a> Video Conference <span class="fa fa-chevron-down"></span> </a>
                                <ul class="nav child_menu">
                                    <li><a onclick="analytics('conferenceAnalytics.html')">Conference Details</a></li>
                                </ul>
                            </li>
                        </ul>                        
                    </li>  
                   </s:if>

                    <!-- Analytics -->



                    <!-- View Groups -->


                    <!-- View Groups -->

                    <!-- View members -->
                    <li>
                        <a onclick="showMembers()"><i class="fa fa-user"></i>View Members</a>
                    </li>
                    
                    <!-- View members -->


                    <s:if test='profileId == 0 || profileId == 1'>
                    <!--    Inviting users feature  -->
                    <li><a data-toggle="modal" data-target="#inviteModal"><i class="fa fa-user"></i> Invite </a>
                        <!--   Inviting users modal Modal       -->
                        <div id="inviteModal" class="modal fade" role="dialog">
                            <div class="modal-dialog">   
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Invite a member</h4>
                                    </div>

                                    <div class="modal-body">
                                        <form id="sendInvite" action="SendInvite.html" name="sendInvite" data-parsley-validate  method="post" >
                                            <input type="email" name="email" placeholder="Enter an email address... " required id="email" class="form-control" />
                                            <input type="hidden" value="<%=groupId%>" name="groupId" id="groupId" class="form-control">
                                            <div id="link_div" class="form-group">
                                            </div>
                                            <br/>
                                            <button type="submit" id="Button" class="btn btn-primary">Invite</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </li>
                    </s:if>
                        <!--       Inviting users modal    -->                   
                </ul>
            </div>
            <div class="menu_section">  

            </div>

        </div>
        <!-- /sidebar menu -->

        <!-- /menu footer buttons -->
        <div class="sidebar-footer hidden-small">
            <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="fa fa-cog" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="fa fa-arrows-alt" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="fa fa-lock" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Logout">
                <span class="fa fa-sign-out" aria-hidden="true"></span>
            </a>
        </div>
        <!-- /menu footer buttons -->
    </div>
</div>

<!-- side bar column ends here -->
<!-- top navigation -->
<div class="top_nav">
    <div class="nav_menu">
        <nav>
            <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
            </div>

            <ul class="nav navbar-nav navbar-right">
                <s:if test="#session.loggedInUser != null">
                    <li class="">
                        <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                            <img src="images/user_img.jpg" alt=""><s:property value="#session.loggedInUser.loginName"/>
                            <span class=" fa fa-angle-down"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-usermenu pull-right">
                            <li><a onclick="changeUserProfile();"> Profile</a></li>
                            <li><a href="index.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                        </ul>
                    </li>

                    <!--notifications-->

                    <li role="presentation" class="dropdown" onclick="fetchUnreadNotifications(); markUnreadNotificationRead();">
                        <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                            <i class="fa fa-envelope-o"></i>
                            <span class="badge bg-green" id="NotificationCount"></span>
                        </a>
                        <ul class="dropdown-menu list-unstyled msg_list" id="Notifications" role="menu">

                            <!--list of notifications-->

                            <li>
                                <div class="text-center">
                                    <a>
                                        <strong>See All Notifications &nbsp;</strong>
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </s:if>
            </ul>
        </nav>
    </div>
</div> 
<script>
    /*
     * function to show User Profile and Change User Name and Password
     * @@author Kunal-
     */
    function changeUserProfile()
    {
        document.getElementById('posts').style.display = "none";
        document.getElementById('groupPage').style.display = "none";
        document.getElementById('membersList').style.display = "none";
        document.getElementById("userProfile").style.display = "block";
    }
//    function openTopic(tid)
//    {
//        window.location = "TopicPage.html?tid=" + tid;
//    }

</script>

<!-- /top navigation -->

