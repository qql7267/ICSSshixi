﻿<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<script type="text/javascript">
			function cancelMeeting(){
				var mno = ${requestScope.mno};
				var mcancel = document.getElementById("mcancel").innerHTML;
				document.location.href="SureCancelAction?mno="+mno+"&mcancel="+mcancel;
			}
		</script>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>CoolMeeting会议管理系统</title>
        <link rel="stylesheet" href="styles/common.css"/>
        <style type="text/css">
            #divfrom{
                float:left;
                width:200px;
            }
            #divto{
                float:left;
                width:200px;
            }
            #divoperator{
                float:left;
                width:50px;
                padding:60px 5px;
            }
            #divoperator input[type="button"]{
                margin:10px 0;
            }
            #selDepartments{
                display:block;
                width:100%;
            }
            #selEmployees{
                display:block;
                width:100%;
                height:200px;
            }
            #selSelectedEmployees{
                display:block;
                width:100%;
                height:225px;
            }
        </style>
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
                <div class="content-nav">会议预定 > 撤销会议预定</div>
                <form action="SureCancelAction">
                    <fieldset>
                        <legend>撤销预定</legend>
                        <table class="formtable">
                            <tr>
                                <td>会议名称：</td>
                                <td>${requestScope.mname}
                             	</td>
                            </tr>
                            <tr>
                                <td>预计开始时间：</td>
                                <td>${requestScope.mstart}</td>
                            </tr>
                            <tr>
                                <td>撤销理由：</td>
                                <td> <textarea id="mcancel" rows="5"></textarea></td>
                            </tr>
                            <tr>
                                <td class="command" colspan="2">
                                    <input type="button" class="clickbutton" value="确认撤销" onclick="cancelMeeting()"/>
                                    <input type="button" class="clickbutton" value="返回" onclick="window.history.back();"/>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </form>
            </div>
        </div>
        <div class="page-footer">
            <hr/>更多问题，欢迎联系<a href="mailto:webmaster@eeg.com">管理员</a>
            <img src="images/footer.png" alt="CoolMeeting"/>
        </div>
    </body>
</html>