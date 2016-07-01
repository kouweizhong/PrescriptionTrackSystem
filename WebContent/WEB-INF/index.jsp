<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html lang="en" class="no-js">
<head>
	<meta charset="utf-8" />
	<title>处方系统</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<!-- BEGIN GLOBAL MANDATORY STYLES -->
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/style-metro.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/style-responsive.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>
	<link href="${pageContext.request.contextPath}/css/uniform.default.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/jquery.gritter.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/daterangepicker.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/fullcalendar.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/jqvmap.css" rel="stylesheet" type="text/css" media="screen"/>
	<link href="${pageContext.request.contextPath}/css/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen"/>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/image/favicon.ico" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
	<!-- BEGIN HEADER -->
	<div class="header navbar navbar-inverse navbar-fixed-top">
		<!-- BEGIN TOP NAVIGATION BAR -->
		<div class="navbar-inner">
			<div class="container-fluid">
				<!-- BEGIN LOGO -->
				<a class="brand" href="#">
					处方跟踪系统
				</a>
				<!-- END LOGO -->
				<!-- BEGIN RESPONSIVE MENU TOGGLER -->
				<a href="javascript:;" class="btn-navbar collapsed" data-toggle="collapse" data-target=".nav-collapse">
				<img src="${pageContext.request.contextPath}/image/menu-toggler.png" alt="" />
				</a>          
				<ul class="nav pull-right">
					<!-- BEGIN USER LOGIN DROPDOWN -->
					<li class="dropdown user">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<img alt="" src="${pageContext.request.contextPath}/image/avatar1_small.jpg" />
						<span class="username">
						${sessionScope.doctor.department.name }
						${sessionScope.doctor.name }
						</span>
						<span class="position">${sessionScope.doctor.position.name }</span>
						<i class="icon-angle-down"></i>
						</a>
						<ul class="dropdown-menu">
							<li><a href="#"><i class="icon-user"></i> 我的信息</a></li>
							<li><a href="#"><i class="icon-calendar"></i> 我的日历</a></li>
							<li><a href="#"><i class="icon-envelope"></i> 我的消息(3)</a></li>
							<li><a href="#"><i class="icon-tasks"></i>  我的任务(4)</a></li>
							<li class="divider"></li>
							<li><a href=""><i class="icon-lock"></i> 关闭系统</a></li>
							<li><a href="${pageContext.request.contextPath }/doctorLogout"><i class="icon-key"></i> 退出</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<!-- END TOP NAVIGATION BAR -->
	</div>
	<!-- END HEADER -->
	
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
		<div class="page-sidebar nav-collapse collapse">
			<!-- BEGIN SIDEBAR MENU -->        
			<ul class="page-sidebar-menu">
				<li>
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
					<div class="sidebar-toggler hidden-phone"></div>
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
				</li>
				<li>
					<!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
					<form class="sidebar-search" action="findPreByAll" method="post">
						<div class="input-box">
							<input type="text" name="search" placeholder="查询..." />
							<input type="button" class="submit" />
						</div>
					</form>
					<!-- END RESPONSIVE QUICK SEARCH FORM -->
				</li>
				<li class="start active ">
					<a href="index">
					<i class="icon-home"></i> 
					<span class="title">主页</span>
					<span class="selected"></span>
					</a>
				</li>
				<li class="">
					<a href="javascript:;">
					<i class="icon-cogs"></i> 
					<span class="title">处方管理</span>
					<span class="arrow "></span>
					</a>
					<ul class="sub-menu">
						<li ><a href="addPre">添加处方</a></li>
						<li ><a href="findpres">所有处方</a></li>
						<li><a href="${pageContext.request.contextPath }/findPrescriptionsByUserCount">处方用户数量</a></li>						
					</ul>
				</li>
				<li class=""><a href="javascript:;"> <i class="icon-user"></i>
						<span class="title">病人信息管理</span> <span class="arrow "></span>
				</a>
					<ul class="sub-menu">
						<li><a href="findUsers"> 所有病人</a></li>
						<li><a href="addUser"> 添加信息</a></li>
						<li><a href="findUsersByPage?page=1"> 分页查询用户</a></li>
						<li><a href="#"> 操作2</a></li>
					</ul></li>
			</ul>
			<!-- END SIDEBAR MENU -->
		</div>
		<!-- END SIDEBAR -->
		
		<!-- BEGIN PAGE -->
		<div class="page-content">
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<h3 class="page-title">处方信息管理系统</h3>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i>
								<a href="index">主页</a> 
								<i class="icon-angle-right"></i>
							</li>
							<li><a href="index">主页信息</a></li>
						</ul>
					</div>
				</div>
				<div class="row-fluid margin-bottom-20">
					<div class="span12">
						<p>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;随着互联网不断的发展，计算机已经深入到了各行各业，计算机不再局限于对科学技术的研究，
							当今时代，计算机可以决解大部分的具体问题，而且有利于人们的控制，这大大方便了人们的需求。
							本系统是专门为处方专门设计的，我们知道，传统的记录使用手工的方式来记录数据，但是如果用
							手工的方式记录数据，如果数据量很大，那么结果往往就很容易出错；而且，随着时间的积累，
							据变得越来越多，且容易丢失,传统的手工管理极大的浪费了人力和财力，不能满足医师和医院之间
							的需求。	总的来说，使用一个高效率的系统来处理这些繁杂的流程是必须的，所以我们有必要建立
							一个处方跟踪系统来处理这一系列的问题，让医师可以通过系统方便的记录病史症状，开处方，查阅
							历史处方，保存。通过这样，这些数据能被即使、准确、有效的处理。这不仅可以提高工作效率还可
							以确保信息的安全和准确。
						</p>
					</div>
				</div>
				<div id="container"></div>
				<div>
					<div id="columnchart"></div>
				</div>
				<div id="showYMD"></div>
				<div style="width: 80%;height: 100%;margin: 20px auto">
					<img width="100%" height="100%" src="${pageContext.request.contextPath }/image/system/uml.png">
				</div>
			</div>
		</div>
	</div>
	<div class="footer">
		<div class="footer-inner">
			2013 &copy; Silence 940109
		</div>
		<div class="footer-tools">
			<span class="go-top">
			<i class="icon-angle-up"></i>
			</span>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/jquery-1.10.1.min.js" type="text/javascript"></script>      
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.easy-pie-chart.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.sparkline.min.js" type="text/javascript"></script>  
	<script src="${pageContext.request.contextPath}/js/app.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/index.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/highcharts/highcharts.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/highcharts/custom.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/highcharts/exporting.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/highcharts/highcharts-3d.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/system/index.js" type="text/javascript"></script>
	<script>
		jQuery(document).ready(function() {    
		   App.init();
		   Index.initMiniCharts();
		   getAjaxDate();
		});
	</script>
</html>
