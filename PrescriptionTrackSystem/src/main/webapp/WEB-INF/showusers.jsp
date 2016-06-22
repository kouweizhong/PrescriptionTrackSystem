<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<meta charset="utf-8" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/style-metro.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/style-responsive.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/default.css" rel="stylesheet" type="text/css" id="style_color" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/multi-select-metro.css" />
<link href="${pageContext.request.contextPath}/css/uniform.default.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/select2_metro.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/DT_bootstrap.css" />
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/image/favicon.ico" />
<link href="css/jqueryui/animate.min.css" rel="stylesheet" type="text/css" />
<link href="css/jqueryui/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/default.css" rel="stylesheet" type="text/css" id="style_color" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/datepicker.css" />
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
							<input type="text" name="search" placeholder="查询..." /> <input
								type="button" class="submit" />
						</div>
					</form> <!-- END RESPONSIVE QUICK SEARCH FORM -->
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
						<h3 class="page-title">处方信息跟踪</h3>
						<ul class="breadcrumb">
							<li><i class="icon-home"></i> <a href="index">主页</a> <i
								class="icon-angle-right"></i></li>
							<li>用户管理 <i class="icon-angle-right"></i>
							</li>
							<li><a href="#">分页查询</a></li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- BEGIN SAMPLE TABLE PORTLET-->
				<div class="portlet box green">
					<div class="portlet-title">
						<div class="caption">
							<i class="icon-cogs"></i>病人信息
						</div>
						<div class="tools">
							<a href="javascript:;" class="collapse"></a> <a
								href="#portlet-config" data-toggle="modal" class="config"></a> <a
								href="javascript:;" class="reload"></a> <a href="javascript:;"
								class="remove"></a>
						</div>
					</div>
					<div class="portlet-body flip-scroll">
						<table
							class="table-bordered table-striped table-condensed flip-content">
							<thead class="flip-content">
								<tr>
									<th>姓名</th>
									<th>出生日期</th>
									<th>电话号码</th>
									<th>承保公司</th>
									<th>保单号</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody style="text-align: center">
								<c:forEach var="user" items="${users }">
									<tr>
										<td>${user.name }</td>
										<td>${user.birthday }</td>
										<td>${user.telephone }</td>
										<td>${user.insuranceCompany }</td>
										<td>${user.policyNumber }</td>
										<td style="display: none;">${user.id }</td>
										<td>
											<div class="btn-group">
												<a class="btn yellow" href="#" data-toggle="dropdown"> <i
													class="icon-suser"></i>用户操作 <i class="icon-angle-down"></i>
												</a>
												<ul class="dropdown-menu">
													<li><a data-toggle="modal" href="#stack1" onclick="edit(this);"
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

						<div class="pagination" style="margin-right: 100px;">
							<ul>
								<li><a class="icon-step-backward"
									href="findUsersByPage?page=1"></a></li>
								<c:if test="${page != 1 }">
									<li><a href="findUsersByPage?page=${page -1 }">«</a></li>
								</c:if>
								<c:forEach var="i" begin="1" end="${count }">
									<c:if test="${page ==i }">
										<li class="page"><a style="background-color: green" href="#">${i }</a></li>
									</c:if>
									<c:if test="${page !=i }">
										<li class="page"><a href="findUsersByPage?page=${i }">${i }</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${page != count }">
									<li><a href="findUsersByPage?page=${page + 1 }">»</a></li>
								</c:if>
								<li><a class="icon-step-forward"
									href="findUsersByPage?page=${count }"></a></li>
							</ul>
						</div>
					</div>
				</div>
				
				<div id="container"></div>
				<!-- 用于显示病人信息的百分比 -->
				<div>
					<div id="columnchart"></div>
				</div>			
				<!-- END SAMPLE TABLE PORTLET-->

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
								<label class="control-label">姓名</label>
								<div class="controls">
									<input type="text" id="name" name="name"
										class="span5" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">出生日期</label>
									<div class="controls">
										<input class="date-picker" id="birthday" name="birthday" type="text" />
									</div>
								</div>
							<div class="control-group">
								<label class="control-label">电话号码</label>
								<div class="controls">
									<input type="text" id="telephone" name="telephone"
										class="span5" />
								</div>
							</div>
							<div class="control-group">
										<label class="control-label">承保公司</label>
										<div class="controls">
											<select name="insuranceCompany" id="insuranceCompany" class="span5 chosen" data-placeholder="选择一个承保公司" tabindex="1">
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
									<input class="span5" type="text" id="polictNumber"
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
		<!-- END PAGE --
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/clockface.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/date.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/daterangepicker.js"></script>
	
	<script src="${pageContext.request.contextPath}/js/highcharts/highcharts.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/highcharts/custom.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/highcharts/exporting.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/form-components.js"></script>
	<script src="${pageContext.request.contextPath}/js/system/showusers.js"></script>
	<script>
		jQuery(document).ready(function() {
			var $selected;//保存当前页的标签
			$(".pagination").find("ul").find(".page").each(function(index){	
				if ($(this).find("a").attr("href").trim() == "#")
					$selected = $(this);
			});
			$selected.prev().prev().prevAll('.page').remove();
			$selected.next().next().nextAll('.page').remove();
			App.init();
			TableAdvanced.init();
			FormComponents.init();
		});
	</script>
	<!-- END BODY -->