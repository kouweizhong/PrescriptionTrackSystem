<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<meta charset="utf-8" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
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
							<input type="text" name="search" placeholder="查询..." /> <input
								type="button" class="submit" />
						</div>
					</form> <!-- END RESPONSIVE QUICK SEARCH FORM -->
				</li>
				<li class="start active "><a href="index"> <i
						class="icon-home"></i> <span class="title">主页</span> <span
						class="selected"></span>
				</a></li>
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
					<div class="portlet box green">
						<div class="portlet-title">
							<div class="caption">
								<i class="icon-globe"></i>最新处方信息
							</div>
							<div class="actions">
								<div class="btn-group">
									<a class="btn" href="#" data-toggle="dropdown"> 显示属性 <i
										class="icon-angle-down"></i>
									</a>
									<div id="sample_2_column_toggler"
										class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">
										<label><input type="checkbox" checked data-column="0">开始时间</label>
										<label><input type="checkbox" checked data-column="0">处方编号</label>
										<label><input type="checkbox" checked data-column="1">结束时间</label>
										<label><input type="checkbox" checked data-column="2">可取次数</label>
										<label><input type="checkbox" checked data-column="3">客户姓名</label>
										<label><input type="checkbox" checked data-column="4">医师姓名</label>
										<label><input type="checkbox" checked data-column="5">操作</label>
									</div>
								</div>
							</div>
						</div>
						<div class="portlet-body">
							<table
								class="table table-striped table-bordered table-hover table-full-width"
								id="sample_2">
								<thead>
									<tr>
										<th>开始时间</th>
										<th>处方编号</th>
										<th>结束时间</th>
										<th>可取次数</th>
										<th>客户姓名</th>
										<th>医师姓名</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="p" items="${prescriptions }">
										<tr>
											<td>${p.begindate }</td>
											<td>${p.id }</td>
											<td>${p.enddate }</td>
											<td>${p.crawlagainst }</td>
											<td>${p.user.name }</td>
											<td>${p.doctor.name }</td>
											<td><a target="_blank" onclick="return check(this);" href="preDetails?pid=${p.id }">处方信息</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
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
	<script
		src="${pageContext.request.contextPath}/js/jquery.slimscroll.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.blockui.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.cookie.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.uniform.min.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/select2.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/DT_bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/table-advanced.js"></script>
	<script src="${pageContext.request.contextPath}/js/app.js"
		type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/index.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/js/jqueryui/jquery.hDialog.min.js"
		type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/system/websocket.js"
		type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/system/utils.js"
		type="text/javascript"></script>
	<script>
		jQuery(document).ready(function() {
			App.init();
			TableAdvanced.init();
		});
		webSocket.onmessage = function(event) {
			onMessage(event)
		};
		function onMessage(event) {
			if (event.data.trim() == "addPre") {
				$.tooltip('你有一条新的消息需要处理！', 10000, false);
				setTimeout(function() {
					$.ajax({
						type : "post",
						data : null,
						url : "findLastPrescription",
						success : function(data) {
							var info = data.trim().split(",");
							var s = "<tr style='background-color: red;'>";
							for (var i =0;i< info.length;i++){
								if (i != info.length - 1){
									s+=("<td>"+info[i]+"</td>");
								}else{
									s+=("<td><a target='_blank' onclick='return check(this);' href='preDetails?pid=" +info[1]+ "'>处方信息</a></td>");
								}
							}
							s += "</tr>";
							$("tbody").before(s);
						}
					});
				}, 4000);
			}else {
				$.tooltip('服务器后台数据刷新，5秒后将自动刷新！', 5000, false);
				setTimeout(function(){
					window.location.reload();
				}, 5000);
			}
		}
		function check(item){
			var enddate = $(item).parent().closest("tr").find("td").eq(2).text().trim();
			var drawlagainst = $(item).parent().closest("tr").find("td").eq(3).text().trim();
			if(enddate < new Date().Format("yyyy-MM-dd").toString()){
				$.tooltip("该处方已经操作时间未处理，暂时不能处理！", 2000, false);
				return false;
			}
			if (parseInt(drawlagainst) < 1){
				$.tooltip("可取次数小于等于0，无法操作！", 2000, false);
				return false;				
			}
		}
	</script>
</body>
</html>