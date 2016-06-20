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
				<a class="brand" href="doctorLogin">
					处方跟踪系统
				</a>
				<!-- END LOGO -->
				<!-- BEGIN RESPONSIVE MENU TOGGLER -->
				<a href="javascript:;" class="btn-navbar collapsed" data-toggle="collapse" data-target=".nav-collapse">
				<img src="${pageContext.request.contextPath}/image/menu-toggler.png" alt="" />
				</a>          
				<!-- END RESPONSIVE MENU TOGGLER -->            
				<!-- BEGIN TOP NAVIGATION MENU -->              
				<ul class="nav pull-right">
					<li class="dropdown" id="header_inbox_bar">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<i class="icon-envelope"></i>
						<span class="badge">3</span>
						</a>
						<ul class="dropdown-menu extended inbox">
							<li>
								<p>你有三条新消息</p>
							</li>
							<li>
								<a href="#">
								<span class="photo"><img src="${pageContext.request.contextPath}/image/avatar2.jpg" alt="" /></span>
								<span class="subject">
								<span class="from">婷心</span>
								<span class="time">刚刚</span>
								</span>
								<span class="message">
									干啥子
								</span>  
								</a>
							</li>
							<li>
								<a href="#">
								<span class="photo"><img src="${pageContext.request.contextPath}/image/avatar3.jpg" alt="" /></span>
								<span class="subject">
								<span class="from">智利</span>
								<span class="time">16 分钟前</span>
								</span>
								<span class="message">
									你在干啥
								</span>  
								</a>
							</li>
							<li>
								<a href="#">
								<span class="photo"><img src="${pageContext.request.contextPath}/image/avatar1.jpg" alt="" /></span>
								<span class="subject">
								<span class="from">波里</span>
								<span class="time">2小时前</span>
								</span>
								<span class="message">
									长沙理工大学
								</span>  
								</a>
							</li>
							<li class="external">
								<a href="#">查看所有信息 <i class="m-icon-swapright"></i></a>
							</li>
						</ul>
					</li>
					<!-- END INBOX DROPDOWN -->
				
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
							<li><a href="doctorLogout"><i class="icon-key"></i>  退出</a></li>
						</ul>
					</li>
					<!-- END USER LOGIN DROPDOWN -->
				</ul>
				<!-- END TOP NAVIGATION MENU --> 
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
						<li >
							<a href="addPre">
							添加处方</a>
						</li>						
					</ul>
				</li>
				<li class=""><a href="javascript:;"> <i class="icon-user"></i>
						<span class="title">病人信息管理</span> <span class="arrow "></span>
				</a>
					<ul class="sub-menu">
						<li><a href="findUsers"> 所有病人</a></li>
						<li><a href="addUser"> 添加信息</a></li>
						<li><a href="findUsersByPage?page=1">分页查询用户</a></li>
						<li><a href="#"> 操作2</a></li>
					</ul></li>
			</ul>
			<!-- END SIDEBAR MENU -->
		</div>
		<!-- END SIDEBAR -->
		
		<!-- BEGIN PAGE -->
		<div class="page-content">
			<!-- BEGIN PAGE CONTAINER-->
			<div class="container-fluid">
				<!-- BEGIN PAGE HEADER-->
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN STYLE CUSTOMIZER -->
						<div class="color-panel hidden-phone">
							<div class="color-mode-icons icon-color"></div>
							<div class="color-mode-icons icon-color-close"></div>
							<div class="color-mode">
								<p>主题颜色</p>
								<ul class="inline">
									<li class="color-black current color-default" data-style="default"></li>
									<li class="color-blue" data-style="blue"></li>
									<li class="color-brown" data-style="brown"></li>
									<li class="color-purple" data-style="purple"></li>
									<li class="color-grey" data-style="grey"></li>
									<li class="color-white color-light" data-style="light"></li>
								</ul>
								<label>
									<span>布局</span>
									<select class="layout-option m-wrap small">
										<option value="fluid" selected>流式布局</option>
										<option value="boxed">盒子布局</option>
									</select>
								</label>
								<label>
									<span>头部</span>
									<select class="header-option m-wrap small">
										<option value="fixed" selected>固定</option>
										<option value="default">默认</option>
									</select>
								</label>
								<label>
									<span>侧边栏</span>
									<select class="sidebar-option m-wrap small">
										<option value="fixed">固定</option>
										<option value="default" selected>默认</option>
									</select>
								</label>
								<label>
									<span>底部</span>
									<select class="footer-option m-wrap small">
										<option value="fixed">固定</option>
										<option value="default" selected>默认</option>
									</select>
								</label>
							</div>
						</div>
						<!-- END BEGIN STYLE CUSTOMIZER -->    
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->
						<h3 class="page-title">
							处方信息管理系统
						</h3>
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
				<div>
					<div id="columnchart"></div>
				</div>
				<div id="container"></div>
				<div id="showYMD"></div>
				<div id="dashboard">
					<div class="clearfix"></div>
					<div class="row-fluid">
					</div>
					<div class="clearfix"></div>
					<div class="row-fluid">
						<div class="span6">
							<div class="portlet box purple">
								<div class="portlet-title">
									<div class="caption"><i class="icon-calendar"></i>General Stats</div>
									<div class="actions">
										<a href="javascript:;" class="btn yellow easy-pie-chart-reload"><i class="icon-repeat"></i> Reload</a>
									</div>
								</div>
								<div class="portlet-body">
									<div class="row-fluid">
										<div class="span4">
											<div class="easy-pie-chart">
												<div class="number transactions"  data-percent="55"><span>+55</span>%</div>
												<a class="title" href="#">Transactions <i class="m-icon-swapright"></i></a>
											</div>
										</div>
										<div class="margin-bottom-10 visible-phone"></div>
										<div class="span4">
											<div class="easy-pie-chart">
												<div class="number visits"  data-percent="85"><span>+85</span>%</div>
												<a class="title" href="#">New Visits <i class="m-icon-swapright"></i></a>
											</div>
										</div>
										<div class="margin-bottom-10 visible-phone"></div>
										<div class="span4">
											<div class="easy-pie-chart">
												<div class="number bounce"  data-percent="46"><span>-46</span>%</div>
												<a class="title" href="#">Bounce <i class="m-icon-swapright"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="span6">
							<div class="portlet box blue">
								<div class="portlet-title">
									<div class="caption"><i class="icon-calendar"></i>Server Stats</div>
									<div class="tools">
										<a href="" class="collapse"></a>
										<a href="#portlet-config" data-toggle="modal" class="config"></a>
										<a href="" class="reload"></a>
										<a href="" class="remove"></a>
									</div>
								</div>
								<div class="portlet-body">
									<div class="row-fluid">
										<div class="span4">
											<div class="sparkline-chart">
												<div class="number" id="sparkline_bar"></div>
												<a class="title" href="#">Network <i class="m-icon-swapright"></i></a>
											</div>
										</div>
										<div class="margin-bottom-10 visible-phone"></div>
										<div class="span4">
											<div class="sparkline-chart">
												<div class="number" id="sparkline_bar2"></div>
												<a class="title" href="#">CPU Load <i class="m-icon-swapright"></i></a>
											</div>
										</div>
										<div class="margin-bottom-10 visible-phone"></div>
										<div class="span4">
											<div class="sparkline-chart">
												<div class="number" id="sparkline_line"></div>
												<a class="title" href="#">Load Rate <i class="m-icon-swapright"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row-fluid">
						<div class="system">
						</div>
					</div>
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
	<script>
		jQuery(document).ready(function() {    
		   App.init();
		   Index.initMiniCharts();
		   //显示不同承保部门人数所占的百分比
		   $.ajax({
				url : "getData",
				type : "GET",
				dataType : 'json',
				success : function(data) {
					ColumnChart("#columnchart",data);
				}
			});
			//显示不同年龄段人数的分布
			$.ajax({
				type:"get",
				url:"getCountByAge",
				success:function(data){
					data = eval('('+ data + ')');
					var year = [];
					var count = [];
					for (var i = 0; i < data.length; i++){
						year.push(data[i][1]);
						count.push(data[i][0]);
					}
					showYear("#container",year,count);
				}
			});
			$.ajax({
				type:"get",
				url:"findByYeayMontheDay",
				success:function(d){
					var s = d.trim();
					var t = eval('(' + s + ')');
					showYearMonthDay(t);
				}
			});
		});
	</script>
</html>
