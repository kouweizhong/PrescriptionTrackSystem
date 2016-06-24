<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="utf-8" />
<title>病人信息管理</title>
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
	<!-- END GLOBAL MANDATORY STYLES -->
	<!-- BEGIN PAGE LEVEL STYLES -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-fileupload.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.gritter.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/chosen.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/select2_metro.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.tagsinput.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/clockface.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-wysihtml5.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datepicker.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/colorpicker.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-toggle-buttons.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/daterangepicker.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/multi-select-metro.css" />
	<link href="${pageContext.request.contextPath}/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/jqueryui/animate.min.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/jqueryui/common.css" rel="stylesheet" type="text/css" />
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
				<a class="brand" href="#"> 处方跟踪系统 </a>
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
					<!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
					<form class="sidebar-search" action="findPreByAll" method="post">
						<div class="input-box">
							<input type="text" name="search" placeholder="查询..." />
							<input type="button" class="submit" />
						</div>
					</form>
					<!-- END RESPONSIVE QUICK SEARCH FORM -->
				</li>
				<li class="start active "><a href="index"> <i
						class="icon-home"></i> <span class="title">主页</span> <span
						class="selected"></span>
				</a></li>
				<li class=""><a href="javascript:;"> <i class="icon-cogs"></i>
						<span class="title">处方管理</span> <span class="arrow "></span>
				</a>
					<ul class="sub-menu">
						<li><a href="addPre"> 添加处方</a></li>
						<li ><a href="findpres">所有处方</a></li>		
					</ul></li>
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
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->
						<h3 class="page-title">处方信息管理系统</h3>
						<ul class="breadcrumb">
							<li><i class="icon-home"></i> <a href="index">主页</a> <i
								class="icon-angle-right"></i></li>
							<li>病人信息管理 <i class="icon-angle-right"></i>
							</li>
							<li><a href="addUser">添加</a></li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				
				<div class="portlet box green">
					<!-- BEGIN SAMPLE FORM PORTLET-->   
						<div class="portlet box green">
							<div class="portlet-title">
								<div class="caption"><i class="icon-reorder"></i>添加信息</div>
								<div class="tools">
									<a href="javascript:;" class="collapse"></a>
									<a href="#portlet-config" data-toggle="modal" class="config"></a>
									<a href="javascript:;" class="reload"></a>
									<a href="javascript:;" class="remove"></a>
								</div>
							</div>
							<div class="portlet-body form">
								<!-- BEGIN FORM-->
								<form:form commandName="user" action="saveUser" class="form-horizontal"
									method="post" modelAttribute="user" onsubmit="return checkForm();">
									<div class="control-group">
										<label class="control-label">姓名</label>
										<div class="controls">
											<input type="text" id="name" name="name" class="span6" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">电话号码</label>
										<div class="controls">
											<input type="text" id="telephone" name="telephone" class="span6" onblur="checkTelephone(this);"/>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">出生日期</label>
										<div class="controls">
											<input class="date-picker" id="birthday" name="birthday" type="text" />
										</div>
									</div>
									
									<div class="control-group">
										<label class="control-label">承保公司</label>
										<div class="controls">
											<select name="insuranceCompany" class="span6 chosen" data-placeholder="选择一个承保公司" tabindex="1">
												<option value=""></option>
												<option value="太平洋承保公司">太平洋承保公司</option>
												<option value="麦吉丽有保险公司">麦吉丽有保险公司</option>
												<option value="中国人寿保险(集团)公司">中国人寿保险(集团)公司</option>
												<option value="中国平安保险(集团)股份有限公司">中国平安保险(集团)股份有限公司</option>
												<option value="中国人民保险(集团)股份有限公司">中国人民保险(集团)股份有限公司</option>
												<option value="美国友邦保险有限公司">美国友邦保险有限公司</option>
												<option value="新华人寿保险股份有限公司">新华人寿保险股份有限公司</option>
												<option value="泰康人寿保险股份有限公司">泰康人寿保险股份有限公司</option>
												<option value="阳光保险集团股份有限公司">阳光保险集团股份有限公司</option>
												<option value="中再集团公司旗下中国大地财产保险股份有限公司">中再集团公司旗下中国大地财产保险股份有限公司</option>
											</select>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">保单号</label>
										<div class="controls">
											<input class="span6 m-wrap" type="text" id="polictNumber" name="policyNumber"/>
										</div>
									</div>					
									<div class="form-actions">
										<button id="addUser" type="submit" class="btn green">提交</button>
										<button type="button" class="btn">取消</button>                            
									</div>
								</form:form>
								<!-- END FORM-->       
							</div>
						</div>
						<!-- END SAMPLE FORM PORTLET-->
				</div>
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
	<script src="${pageContext.request.contextPath}/js/jquery-1.10.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>      
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.slimscroll.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.blockui.min.js" type="text/javascript"></script>  
	<script src="${pageContext.request.contextPath}/js/jquery.cookie.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.uniform.min.js" type="text/javascript" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/chosen.jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/select2.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/wysihtml5-0.3.0.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-wysihtml5.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.tagsinput.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.toggle.buttons.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/clockface.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/date.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/daterangepicker.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-colorpicker.js"></script>  
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-timepicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.inputmask.bundle.min.js"></script>   
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.multi-select.js"></script>   
	<script src="${pageContext.request.contextPath}/js/bootstrap-modal.js" type="text/javascript" ></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap-modalmanager.js" type="text/javascript" ></script> 
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
	<script src="${pageContext.request.contextPath}/js/form-components.js"></script>
	<script src="${pageContext.request.contextPath}/js/jqueryui/jquery.hDialog.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/system/adduser.js" type="text/javascript"></script>    
	<!-- END PAGE LEVEL SCRIPTS -->
	<script>
		jQuery(document).ready(function() {       
		   // initiate layout and plugins
		   App.init();
		   FormComponents.init();
		});
	</script>
</body>
<!-- END BODY -->
</html>
