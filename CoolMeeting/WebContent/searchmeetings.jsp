﻿<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<script type="text/javascript">
		function startPage(){
			document.location="SelectMeetingPageAction?jump=1";
		}
		function endPage(){
			document.location="SelectMeetingPageAction?jump=2";
		}
		function nextPage(){
			document.location="SelectMeetingPageAction?jump=3";
		}
		function lastPage(){
			if("${sessionScope.selectPage}" == 1)
				alert("已经是第一页");
			else
				document.location="SelectMeetingPageAction?jump=4";
		}
		function selectPage(uname, uunm, ustate){
			selectPage = document.getElementById("pagenum").value;
			if(selectPage == ""||selectPage <= 0)
				alert("请输入正确页码");
			else
				document.location="SelectMeetingPageAction?selectPage="+selectPage+"&jump=5";
		}
	</script>
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>CoolMeeting会议管理系统</title>
        <link rel="stylesheet" href="styles/common.css"/>
    </head>
     <body>
        <div class="page-header">
            <div class="header-banner"><img src="images/header.png" alt="CoolMeeting"/></div>
            <div class="header-title"> 欢迎访问Cool-Meeting会议管理系统 </div>
            <div class="header-quicklink">
            	欢迎您，<strong>${sessionScope.uname}</strong>
            	<a href="changepassword.html">[修改密码]</a>
            </div>
        </div>
        <div class="page-body">
			<div class="page-sidebar">
				<div class="sidebar-menugroup">
					<div class="sidebar-grouptitle">个人中心</div>
					<ul class="sidebar-menu">
						<li class="sidebar-menuitem"><a href="NotificationsAction">最新通知</a></li>
						<li class="sidebar-menuitem active"><a href="MyBookMeetingAction">我的预定</a></li>
						<li class="sidebar-menuitem"><a href="MyMeetingAction">我的会议</a></li>
					</ul>
				</div>
				<div class="sidebar-menugroup">
					<div class="sidebar-grouptitle">人员管理</div>
					<ul class="sidebar-menu">
						<li class="sidebar-menuitem"><a href="GetAllDeptAction">部门管理</a></li>
						<li class="sidebar-menuitem"><a href="RegisterDeptActoin">员工注册</a></li>
						<li class="sidebar-menuitem"><a href="ApproveListAction">注册审批</a></li>
						<li class="sidebar-menuitem"><a href="SearchAction">搜索员工</a></li>
					</ul>
				</div>
				<div class="sidebar-menugroup">
					<div class="sidebar-grouptitle">会议预定</div>
					<ul class="sidebar-menu">
						<li class="sidebar-menuitem"><a href="addmeetingroom.jsp">添加会议室</a></li>
						<li class="sidebar-menuitem"><a href="SelectRoomAction">查看会议室</a></li>
						<li class="sidebar-menuitem"><a href="SelectRoomDeptAction">预定会议</a></li>
						<li class="sidebar-menuitem"><a href="SearchMeetingAction">搜索会议</a></li>
					</ul>
				</div>
			</div>
            <div class="page-content">
                <div class="content-nav"> 会议预定 > 搜索会议</div>
                <form action="SelectMeetingAction">
                    <fieldset>
                        <legend>搜索会议</legend>
                        <table class="formtable">
                            <tr>
                                <td>会议名称：</td>
                                <td>
                                    <input type="text" name="mname" id="meetingname" maxlength="20"/>
                                </td>
                                <td>会议室名称：</td>
                                <td>
                                    <input type="text" name="mroom" id="roomname" maxlength="20"/>
                                </td>
                                <td>预定者姓名：</td>
                                <td>
                                    <input type="text" name="morgzer" id="reservername" maxlength="20"/>
                                </td>
                            </tr>
                            <tr>
                                <td>预定日期：</td>
                                <td colspan="5">
                                   	从&nbsp;<input type="date" id="reservefromdate" name="mreserve_l" placeholder="例如：2013-10-20"/>
                                   	到&nbsp;<input type="date" id="reservetodate" name="mreserve_r" placeholder="例如：2013-10-22"/>
                                </td>
                            </tr>
                            <tr>
                                <td>会议日期：</td>
                                <td colspan="5">
									从&nbsp;<input type="date" id="meetingfromdate" name="mdate_l" placeholder="例如：2013-10-20"/>
									到&nbsp;<input type="date" id="meetingtodate" name="mdate_r" placeholder="例如：2013-10-22"/>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6" class="command">
                                    <input type="submit" class="clickbutton" value="查询"/>
                                    <input type="reset" class="clickbutton" value="重置"/>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </form>
                <div>
                    <h3 style="text-align:center;color:black">查询结果</h3>
                    <div class="pager-header">
                        <div class="header-info">
							共<span class="info-number">${sessionScope.meetingListSize}</span>条结果，
							分成<span class="info-number">${sessionScope.meetingPageSize}</span>页显示，
							当前第<span class="info-number">${sessionScope.selectPage}</span>页
                        </div>
                        <div class="header-nav">
                            <input type="button" class="clickbutton" value="首页" onclick="startPage()"/>
                            <input type="button" class="clickbutton" value="上页" onclick="lastPage()"/>
                            <input type="button" class="clickbutton" value="下页" onclick="nextPage()"/>
                            <input type="button" class="clickbutton" value="末页" onclick="endPage()"/>
							 跳到第<input type="text" id="pagenum" class="nav-number"/>页
                            <input type="button" class="clickbutton" value="跳转" onclick="selectPage()"/>
                        </div>
                    </div>
                </div>
                <table class="listtable">
                    <tr class="listheader">
                        <th>会议名称</th>
                        <th>会议室名称</th>
                        <th>会议开始时间</th>
                        <th>会议结束时间</th>
                        <th>会议预定时间</th>
                        <th>预定者</th>
                        <th>操作</th>
                    </tr>
                   <c:forEach items="${requestScope.showList}" var="meetingInfo">
	                   <tr>
	                        <td>${meetingInfo.mname}</td>
	                        <td>${meetingInfo.mroom}</td>
	                        <td>${meetingInfo.mstart}</td>
	                        <td>${meetingInfo.mend}</td>
	                        <td>${meetingInfo.mreserve}</td>
	                        <td>${meetingInfo.morgzer}</td>
	                        <td><a class="clickbutton" href="ViewMeetingDetailAction?mno=${meetingInfo.mno}">查看详情</a></td>
	                    </tr>
                   </c:forEach>
                </table>
            </div>
        </div>
        <div class="page-footer">
            <hr/>更多问题，欢迎联系<a href="mailto:webmaster@eeg.com">管理员</a>
            <img src="images/footer.png" alt="CoolMeeting"/>
        </div>
    </body>
</html>