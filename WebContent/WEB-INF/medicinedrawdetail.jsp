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
							<li><a href="addUser">处方详细信息</a></li>

						</ul>
					</div>
					<div class="portlet box blue">
						<div class="portlet-title">
							<div class="caption">
								<i class="icon-globe"></i>${prescription.user.name } 处方详细信息,
								开始时间:${prescription.begindate },结束时${prescription.enddate }
								可取药的次数:${prescription.crawlagainst }
							</div>
							<div class="actions">
							<a id="modifyCheck" lang="${prescription.id }" href="#" class="btn green">确认处理</a>
								<div class="btn-group">
									<a class="btn" href="#" data-toggle="dropdown"> 显示属性 <i
										class="icon-angle-down"></i>
									</a>
									<div id="sample_2_column_toggler"
										class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">
										<label><input type="checkbox" checked data-column="0">药品名称</label>
										<label><input type="checkbox" checked data-column="0">药品单位</label>
										<label><input type="checkbox" checked data-column="1">药品数量</label>
										<label><input type="checkbox" checked data-column="2">是否可用替代药品</label>
										<label><input type="checkbox" checked data-column="3">可使用的替代药品列表</label>
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
										<th>药品名称</th>
										<th>药品单位</th>
										<th>药品数量</th>
										<th>是否可用替代药品</th>
										<th>可使用的替代药品列表</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="p" items="${prescription.prescriptionDetails }">
										<tr>
											<td>${p.medicine.name }</td>
											<td>${p.unit }</td>
											<td>${p.count }</td>
											<td>${p.canuse }</td>
											<td>
												<c:if test="${p.canuse == '否' }">
													不可使用替代药物
												</c:if>
												<c:if test="${p.canuse == '是' }">
													<c:if test="${empty p.medicine.substitutes }">
														没有可用的药物
													</c:if>
													<c:if test="${p.medicine.substitutes != null}">														
														<c:forEach items="${p.medicine.substitutes }" var="medicine">
															${medicine.name } &nbsp;&nbsp;
														</c:forEach>
													</c:if>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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
			$("#modifyCheck").one("click",function(){
				var id = $(this).attr("lang").trim();	
				var flag = false;
				$.ajax({
					type:"post",
					url:"findCrawlagainstById",
					data:{"id":id},
					async:false,
					success:function(data){
						if (parseInt(data.trim()) <= 0){
							$.tooltip("该取药的次数已经为0，无法执行操作！",3000,false);
							flag = true;
							return;
						}										
					}
				});
				if (flag){
					return false;
				}
				$.ajax({
					type:"get",
					data:{"id":id},
					url:"decreasePrescription",
					success:function(data){
						if (data.trim() == "1"){
							$.tooltip("处理成功，2秒钟后自动关闭！",2000,true);							
							setTimeout(function(){
								window.close();
								window.opener.location.reload(); 
							}, 2000);
						}else{
							$.tooltip("服务器连接失败，请稍后再试！",2000,false);														
						}
					}
				});
			});
		});
		webSocket.onmessage = function(event) {
			onMessage(event)
		};
		function onMessage(event) {
			if (event.data != ""){
				$.tooltip('服务器后台数据刷新，5秒后将自动刷新！', 5000, false);
				setTimeout(function(){
					window.location.reload();
				}, 5000);
			}
		}
	</script>
</body>
</html>