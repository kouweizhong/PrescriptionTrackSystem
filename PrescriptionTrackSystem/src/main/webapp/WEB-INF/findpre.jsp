<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="utf-8" />
<title>病人信息管理</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/style-metro.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/style-responsive.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/default.css"
	rel="stylesheet" type="text/css" id="style_color" />
<link href="${pageContext.request.contextPath}/css/uniform.default.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/timeline.css"
	rel="stylesheet" type="text/css" />
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
				<a class="brand" href="doctorLogin"> 处方跟踪系统 </a>
				<!-- END LOGO -->
				<!-- BEGIN RESPONSIVE MENU TOGGLER -->
				<a href="javascript:;" class="btn-navbar collapsed"
					data-toggle="collapse" data-target=".nav-collapse"> <img
					src="${pageContext.request.contextPath}/image/menu-toggler.png"
					alt="" />
				</a>
				<!-- END RESPONSIVE MENU TOGGLER -->
				<!-- BEGIN TOP NAVIGATION MENU -->
				<ul class="nav pull-right">
					<li class="dropdown" id="header_inbox_bar"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"> <i
							class="icon-envelope"></i> <span class="badge">3</span>
					</a>
						<ul class="dropdown-menu extended inbox">
							<li>
								<p>你有三条新消息</p>
							</li>
							<li><a href="#"> <span class="photo"><img
										src="${pageContext.request.contextPath}/image/avatar2.jpg"
										alt="" /></span> <span class="subject"> <span class="from">婷心</span>
										<span class="time">刚刚</span>
								</span> <span class="message"> 干啥子 </span>
							</a></li>
							<li><a href="#"> <span class="photo"><img
										src="${pageContext.request.contextPath}/image/avatar3.jpg"
										alt="" /></span> <span class="subject"> <span class="from">智利</span>
										<span class="time">16 分钟前</span>
								</span> <span class="message"> 你在干啥 </span>
							</a></li>
							<li><a href="#"> <span class="photo"><img
										src="${pageContext.request.contextPath}/image/avatar1.jpg"
										alt="" /></span> <span class="subject"> <span class="from">波里</span>
										<span class="time">2小时前</span>
								</span> <span class="message"> 长沙理工大学 </span>
							</a></li>
							<li class="external"><a href="#">查看所有信息 <i
									class="m-icon-swapright"></i></a></li>
						</ul></li>
					<!-- END INBOX DROPDOWN -->
					<!-- BEGIN USER LOGIN DROPDOWN -->
					<li class="dropdown user"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> <img alt=""
							src="${pageContext.request.contextPath}/image/avatar1_small.jpg" />
							<span class="username">
								${sessionScope.doctor.department.name }
								${sessionScope.doctor.name } </span> <span class="position">${sessionScope.doctor.position.name }</span>
							<i class="icon-angle-down"></i>
					</a>
						<ul class="dropdown-menu">
							<li><a href="#"><i class="icon-user"></i> 我的信息</a></li>
							<li><a href="#"><i class="icon-calendar"></i> 我的日历</a></li>
							<li><a href="#"><i class="icon-envelope"></i> 我的消息(3)</a></li>
							<li><a href="#"><i class="icon-tasks"></i> 我的任务(4)</a></li>
							<li class="divider"></li>
							<li><a href=""><i class="icon-lock"></i> 关闭系统</a></li>
							<li><a href="doctorLogout"><i class="icon-key"></i> 退出</a></li>
						</ul></li>
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
					<div class="sidebar-toggler hidden-phone"></div> <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
				</li>
				<li>
					<form class="sidebar-search" action="${pageContext.request.contextPath }/findPreByAll" method="post">
						<div class="input-box">
							<input type="text" name="search" placeholder="查询..." />
							<input type="button" class="submit" />
						</div>
					</form>
					<!-- END RESPONSIVE QUICK SEARCH FORM -->
				</li>
				<li class="start active "><a href="${pageContext.request.contextPath }/index"> <i
						class="icon-home"></i> <span class="title">主页</span> <span
						class="selected"></span>
				</a></li>
				<li class=""><a href="javascript:;"> <i class="icon-cogs"></i>
						<span class="title">处方管理</span> <span class="arrow "></span>
				</a>
					<ul class="sub-menu">
						<li><a href="${ pageContext.request.contextPath }/addPre"> 添加处方</a></li>
					</ul></li>
				<li class=""><a href="javascript:;"> <i class="icon-user"></i>
						<span class="title">病人信息管理</span> <span class="arrow "></span>
				</a>
					<ul class="sub-menu">
						<li><a href="${ pageContext.request.contextPath }/findUsers"> 所有病人</a></li>
						<li><a href="${ pageContext.request.contextPath }/addUser"> 添加信息</a></li>
						<li><a href="${pageContext.request.contextPath }/findUsersByPage?page=1">分页查询用户</a></li>
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
									<li class="color-black current color-default"
										data-style="default"></li>
									<li class="color-blue" data-style="blue"></li>
									<li class="color-brown" data-style="brown"></li>
									<li class="color-purple" data-style="purple"></li>
									<li class="color-grey" data-style="grey"></li>
									<li class="color-white color-light" data-style="light"></li>
								</ul>
								<label> <span>布局</span> <select
									class="layout-option m-wrap small">
										<option value="fluid" selected>流式布局</option>
										<option value="boxed">盒子布局</option>
								</select>
								</label> <label> <span>头部</span> <select
									class="header-option m-wrap small">
										<option value="fixed" selected>固定</option>
										<option value="default">默认</option>
								</select>
								</label> <label> <span>侧边栏</span> <select
									class="sidebar-option m-wrap small">
										<option value="fixed">固定</option>
										<option value="default" selected>默认</option>
								</select>
								</label> <label> <span>底部</span> <select
									class="footer-option m-wrap small">
										<option value="fixed">固定</option>
										<option value="default" selected>默认</option>
								</select>
								</label>
							</div>
						</div>
						<!-- END BEGIN STYLE CUSTOMIZER -->
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->
						<h3 class="page-title">处方信息管理系统</h3>
						<ul class="breadcrumb">
							<li><i class="icon-home"></i> <a href="index">主页</a> <i
								class="icon-angle-right"></i></li>
							<li>处方管理 <i class="icon-angle-right"></i>
							</li>
							<li><a href="#">处方历史记录</a></li>
							<a href="javascript:history.go(-1);" class="btn icn-only">
								<i class="m-icon-swapleft"></i>返回</a>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				
				<!-- BEGIN PAGE CONTENT-->
				<div class="row-fluid">
					<div class="span12">
						<c:if test="${empty prescriptions}">
								<div class="alert alert-error">
									<button class="close" data-dismiss="alert"></button>
									<strong>提示!</strong> 该用户的处方为空！
								</div>								
							</c:if>
						<ul class="timeline">
							<c:forEach items="${prescriptions }" var="prescription">
								<li class="timeline-green">
									<div class="timeline-time">
										<span class="time">${prescription.begindate }</span>
										<span class="date">结束时间：${prescription.enddate }</span>
									</div>
									<div class="timeline-icon"><i class="icon-time"></i></div>
									<div class="timeline-body">
										<h2>姓名：${prescription.user.name }
											&nbsp;&nbsp;
											 医师姓名：${prescription.doctor.name }
											 &nbsp;&nbsp;
											 电话：${prescription.doctor.telephone }
											 &nbsp;&nbsp;
											 可取药次数：${prescription.crawlagainst }
										</h2>
										<div class="timeline-content">
											<a style="float:right;display: inline;" class="btn purple big">
												修改<i class="m-icon-big-swapright m-icon-white"></i>
											</a>
											<c:forEach items="${prescription.prescriptionDetails }" var="pre">
												<p>药品名字：${pre.medicine.name} ,&nbsp;&nbsp; 数量:${pre.count },
												单位:${pre.unit },服用方式：${pre.takemethod }</p>
												<p>副作用：${pre.medicine.sideeffect }</p>
												<c:if test="${pre.canuse == '是' }">
													可使用的替代药品列表:
													<c:if test="${empty pre.medicine.substitutes}">
																没有可用的替代的药物信息！
													</c:if>
													<c:forEach items="${pre.medicine.substitutes }" var="medicine">
														${medicine.name } &nbsp;、
													</c:forEach>
												</c:if>												
												<hr>
											</c:forEach>
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<!-- END PAGE CONTENT-->				
			</div>
		</div>
		<!-- END PAGE -->
	</div>
	<!-- END CONTAINER -->
	<div class="footer">
		<div class="footer-inner">2013 &copy; Silence 940109</div>
		<div class="footer-tools">
			<span class="go-top"> <i class="icon-angle-up"></i>
			</span>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/js/jquery-1.10.1.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery-migrate-1.2.1.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery-ui-1.10.1.custom.min.js"
		type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery.slimscroll.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery.blockui.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery.cookie.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery.uniform.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
	<!-- END PAGE LEVEL SCRIPTS -->
	<script>
		jQuery(document).ready(function() {
			App.init();
			var colors = ['timeline-yellow','timeline-blue','timeline-green','timeline-purple','timeline-red','timeline-grey'];
			$(".timeline").find("li").each(function(index){
				$(this).attr({"class":index > colors.length ? colors[(index) % colors.length] : colors[index]});
			});
			var btn_colors = ['btn purple big','btn white big','btn black big','btn green big','btn blue big','btn yellow big','btn red big','btn grey big']
			$(".timeline-content").find("a").each(function(index){
				$(this).attr({"class":index > btn_colors.length ? btn_colors[(index) % btn_colors.length] : btn_colors[index]});
			});
		});
	</script>
</body>
<!-- END BODY -->
</html>
