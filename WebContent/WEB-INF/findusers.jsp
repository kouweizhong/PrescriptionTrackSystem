<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<meta charset="utf-8" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css"
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
<!-- END GLOBAL MANDATORY STYLES -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/select2_metro.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/DT_bootstrap.css" />
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/image/favicon.ico" />
<link href="css/jqueryui/animate.min.css" rel="stylesheet"
	type="text/css" />
<link href="css/jqueryui/common.css" rel="stylesheet" type="text/css" />
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
	<!-- BEGIN HEADER -->
	<div class="header navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="brand" href="#"> 处方跟踪系统 </a>
				<a href="javascript:;" class="btn-navbar collapsed"
					data-toggle="collapse" data-target=".nav-collapse"> <img
					src="${pageContext.request.contextPath}/image/menu-toggler.png"
					alt="" />
				</a>
				<ul class="nav pull-right">
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
				</ul>
			</div>
		</div>
	</div>
	<!-- END HEADER -->
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<div class="page-sidebar nav-collapse collapse">
			<ul class="page-sidebar-menu">
				<li>
					<div class="sidebar-toggler hidden-phone"></div> <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
				</li>
				<li>
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
						<li ><a href="${ pageContext.request.contextPath }/findpres">所有处方</a></li>
						<li><a href="${pageContext.request.contextPath }/findPrescriptionsByUserCount">处方用户数量</a></li>
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
							<li>处方管理 <i class="icon-angle-right"></i>
							</li>
							<li><a href="addUser">查询用户以及处方信息</a></li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				<!-- END EXAMPLE TABLE PORTLET-->
				
				<!-- BEGIN EXAMPLE TABLE PORTLET-->
						<div class="portlet box grey">
							<div class="portlet-title">
								<div class="caption"><i class="icon-globe"></i>查询结果如下</div>
								<div class="actions">
									<div class="btn-group">
										<a class="btn" href="#" data-toggle="dropdown">
										显示属性
										<i class="icon-angle-down"></i>
										</a>
										<div id="sample_2_column_toggler" class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">
											<label><input type="checkbox" checked data-column="0">姓名</label>
											<label><input type="checkbox" checked data-column="1">出生日期</label>
											<label><input type="checkbox" checked data-column="2">电话号码</label>
											<label><input type="checkbox" checked data-column="3">承保公司</label>
											<label><input type="checkbox" checked data-column="4">保单号</label>
											<label><input type="checkbox" checked data-column="5">操作</label>
										</div>
									</div>
								</div>
							</div>
							<div class="portlet-body">
								<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
									<thead>
										<tr>
											<th>姓名</th>
											<th>出生日期</th>
											<th class="hidden-480">电话号码</th>
											<th class="hidden-480">承保公司</th>
											<th class="hidden-480">保单号</th>
											<th class="hidden-480">操作</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="user" items="${users }">
									<tr>
										<td>${user.name }</td>
										<td>${user.birthday }</td>
										<td class="hidden-480">${user.telephone }</td>
										<td class="hidden-480">${user.insuranceCompany }</td>
										<td class="hidden-480">${user.policyNumber }</td>
										<td>
											<div class="btn-group">
												<a class="btn yellow" href="#" data-toggle="dropdown"> <i
													class="icon-suser"></i>用户操作 <i class="icon-angle-down"></i>
												</a>
												<ul class="dropdown-menu">
													<li><a data-toggle="modal" href="#stack1" onclick="edit(this);" lang="${user.id}"
														class="btn green"> <i class="icon-pencil"></i>编辑
													</a></li>
													<li><a href="#myModal1" lang=${user.id }  data-toggle="modal" 
														onclick="deleteUser(this)" class="btn red">
															<i class="icon-trash"></i>删除
													</a></li>
													<li><a href="javascript:void(0)" lang=${user.id }
														onclick="findPre(this)" class="btn blue"> <i
															class="icon-ban-circle"></i>处方记录
													</a></li>
												</ul>
											</div>
										</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
								
								<!-- 模态框，确认删除 -->
								<div id="myModal1" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
										<h3 id="myModalLabel1">确认删除？</h3>
									</div>
									<div class="modal-body">
										<p>删除的数据不可恢复</p>
									</div>
									<div class="modal-footer">
										<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
										<button id="deleteUser"  data-dismiss="modal" class="btn red">确定</button>
									</div>
								</div>
								<!-- 弹出层，修改用户信息 -->
								<div id="stack1" class="modal hide fade" tabindex="-1"
									data-focus-on="input:first">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true"></button>
										<h3>编辑用户信息</h3>
									</div>
									<form action="#">
										<div class="modal-body">
											<div class="control-group">
												<label class="control-label">姓名:</label>
												<div class="controls">
													<input type="text" id="name" name="name"
														class="span5" />
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">出生日期:</label>
													<div class="controls">
														<input id="birthday" name="birthday" type="text" />
													</div>
												</div>
											<div class="control-group">
												<label class="control-label">电话号码:</label>
												<div class="controls">
													<input type="text" id="telephone" name="telephone"
														class="span5" />
												</div>
											</div>
											<div class="control-group">
														承保公司
														<div class="controls">
															<select name="insuranceCompany" id="insuranceCompany" class="span8 chosen" data-placeholder="选择一个承保公司" tabindex="1">
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
													<input class="span8" type="text" id="polictNumber"
														name="policyNumber" />
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" data-dismiss="modal" class="btn">关闭</button>
											<button id="updateUser" type="submit"
												data-dismiss="modal" class="btn red">确定</button>
										</div>
									</form>
								</div>
								<!-- 弹出层，修改用户信息结束 -->
							</div>
						</div>
						<!-- END EXAMPLE TABLE PORTLET-->
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
	<script src="${pageContext.request.contextPath}/js/jquery.uniform.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/select2.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/DT_bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/table-advanced.js"></script>
	<script src="${pageContext.request.contextPath}/js/app.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/index.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jqueryui/jquery.hDialog.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/system/users.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jqueryui/jquery-asDatepicker.js" type="text/javascript"></script>
	
	<script>
		jQuery(document).ready(function() {
			App.init();
			TableAdvanced.init();
		});
	
	</script>
<!-- END BODY -->
