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
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
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
<link href="${pageContext.request.contextPath}/css/jquery.gritter.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/daterangepicker.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/fullcalendar.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/jqvmap.css"
	rel="stylesheet" type="text/css" media="screen" />
<link href="${pageContext.request.contextPath}/css/jquery.easy-pie-chart.css"
	rel="stylesheet" type="text/css" media="screen" />
<link href="${pageContext.request.contextPath}/css/jqueryui/asDatepicker.css"
	rel="stylesheet" type="text/css" media="screen" />	
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
							<li><a href="${pageContext.request.contextPath }/doctorLogout"><i class="icon-key"></i> 退出</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
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
					<form class="sidebar-search" action="findPreByAll" method="post">
						<div class="input-box">
							<input type="text" name="search" placeholder="查询..." /> <input
								type="button" class="submit" />
						</div>
					</form>
				</li>
				<li class="start active "><a href="${pageContext.request.contextPath}/index"> <i
						class="icon-home"></i> <span class="title">主页</span> <span
						class="selected"></span>
				</a></li>
				<li class=""><a href="javascript:;"> <i class="icon-cogs"></i>
						<span class="title">处方管理</span> <span class="arrow "></span>
				</a>
					<ul class="sub-menu">
						<li><a href="${pageContext.request.contextPath}/addPre"> 添加处方</a></li>
					</ul></li>
				<li class=""><a href="javascript:;"> <i class="icon-user"></i>
						<span class="title">病人信息管理</span> <span class="arrow "></span>
				</a>
					<ul class="sub-menu">
						<li><a href="${pageContext.request.contextPath}/findUsers"> 所有病人</a></li>
						<li><a href="${pageContext.request.contextPath}/addUser"> 添加信息</a></li>
						<li><a href="${pageContext.request.contextPath}/findUsersByPage?page=1">分页查询用户</a></li>
						<li><a href="#"> 操作2</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- END SIDEBAR -->
		<!-- BEGIN PAGE -->
		<div class="page-content">
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
							<li><a href="#">处方管理</a></li>
							<li><i class="icon-angle-right"></i><a href="#">处方信息修改</a></li>
						</ul>
					</div>
				</div>
				
				<!-- BEGIN INLINE NOTIFICATIONS PORTLET-->
						<div class="portlet box blue">
							<div class="portlet-title">
								<div class="caption"><i class="icon-cogs"></i>修改 ${prescription.user.name} 的处方信息</div>
								<div class="tools">
									<a href="javascript:;" class="collapse"></a>
									<a href="javascript:;">
										<i class="icon-plus icon-white"></i>
										<span>添加新药方</span>
										</a>
								</div>
							</div>
							<div class="portlet-body">
								<div class="row-fluid">
									<c:forEach items="${prescription.prescriptionDetails }" var="detail">
									<div class="span3 detail">
										<!-- BEGIN Portlet PORTLET-->
										<div class="portlet box green">
											<div class="portlet-title">
												<div style="display: inline;font-size: 14px;">
													${detail.medicine.name }
												</div>
												<div class="tools">
													<a href="javascript:;" class="collapse" ></a>
													<a data-toggle="modal" href="${pageContext.request.contextPath }/#myModal1" class="delete"
													onclick="deletePreDetail(this)" lang="${detail.id}"></a>
												</div>
											</div>
											<div class="portlet-body">
												<div>
													<div class="modal-body">
														<div class="control-group">
															<div class="m-wrap">
															数量:&nbsp;&nbsp;<input type="text" id="count" value="${detail.count }" maxlength="2" name="count"
																	class="span6" style="width: 30px;" />
															</div>
														</div>
														<div class="control-gr">
															可用替代药品：
															<select class="span5" id="canuse" tabindex="1" name="canuse">
																<c:if test="${detail.canuse == '是' }">
																	<option selected="selected" value="是">是</option>
																	<option value="否">否</option>
																</c:if>
																<c:if test="${detail.canuse == '否' }">
																	<option value="是">是</option>
																	<option selected="selected" value="否">否</option>
																</c:if>
															</select>
														</div>
														单位
														<select class="span4" lang="${detail.unit }" id="unit" name="unit" tabindex="0">
															<option value="盒">盒</option>
															<option value="片">片</option>
															<option value="包">包</option>
															<option value="克">克</option>
															<option value="粒">粒</option>
															<option value="勺">勺</option>
															<option value="毫克">毫克</option>
															<option value="毫升">毫升</option>
															<option value="瓶">瓶</option>
															<option value="袋">袋</option>
															<option value="支">支</option>
														</select>
														<div class="control-group">
															<label class="control-label">服用方式</label>
															<div class="controls">
																<input type="text" id="take_method" name="take_method" value=${detail.takemethod }
																	class="span12" />
															</div>
														</div>
													</div>
													<div>
														<button lang=${detail.id } onclick="saveDetail(this);" class="btn green">保存修改</button>
													</div>
												</div>
											</div>
										</div>
										<!-- END Portlet PORTLET-->
									</div>
									</c:forEach>
									<!-- BEGIN Portlet PORTLET-->
									<div class="portlet box yellow">
										<div class="portlet-title">
											<div style="display: inline;font-size: 14px;">
												${prescription.user.name } 处方信息修改
											</div>
											<div class="tools">
												<a href="javascript:;" class="collapse" ></a>
											</div>
										</div>
										<div class="portlet-body">
											<label class="control-label">
												结束日期：<input name="enddate" value=${prescription.enddate } id="enddate" type="text"/>
											</label>
											<label class="control-label">抓取次数</label>
											<input type="text" value=${prescription.crawlagainst } name="crawlagainst" class="span2" />
											<br>
											<button lang=${prescription.id } onclick="savePre(this);" class="btn green">保存修改</button>
										</div>
									</div>
								</div>				
							</div>
						</div>
					<!-- END INLINE NOTIFICATIONS PORTLET-->
			</div>
		</div>
	</div>
	
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
			<button id="deletePreDetail"  data-dismiss="modal" class="btn red">确定</button>
		</div>
	</div>
	<div class="footer">
		<div class="footer-inner">2013 &copy; Silence 940109</div>
		<div class="footer-tools">
			<span class="go-top"> <i class="icon-angle-up"></i>
			</span>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/jquery-1.10.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.easy-pie-chart.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.sparkline.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/app.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/index.js" type="text/javascript"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/daterangepicker.js"></script>
	<script src="${pageContext.request.contextPath}/js/form-components.js"></script>
	<script src="${pageContext.request.contextPath}/js/jqueryui/jquery.hDialog.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jqueryui/jquery-asDatepicker.js" type="text/javascript"></script>
</body>
	<script>
		//保存更新处方信息
		function savePre(item){
			var $enddate = $(item).parent().find("#enddate");//获取结束日期
			var $crawlagainst = $(item).parent().find('.span2');//获取可抓取次数
			var id = $(item).attr("lang").trim();
			//验证正整数
			if (!/^\+?[1-9][0-9]*$/.test($crawlagainst.val().trim())){
				$.tooltip(' 请输入正确的数字,该数字不能小于1！', 2000, false);
				$crawlagainst.val("");
				$crawlagainst.focus();
				return;
			}
			//验证时间格式
			if (!/^201(\d{1})\/(\d{2})\/(\d{2})$/.test($enddate.val().trim())){
				$.tooltip('请选择正确的时间格式！', 2000, false);
				$enddate.val("");
				$enddate.focus();
				return;
			}
			$.ajax({
				type:"post",
				data:{"enddate":$enddate.val().trim(),"crawlagainst":$crawlagainst.val().trim(),"id":id},
				url:window.location.pathname.substring(0,25)+"updatePrescription",
				success:function(data){
					if (data){						
						$.tooltip('保存成功成功！', 2000, true);
					}else{
						$.tooltip('删除失败，请检查服务器或网络状态！', 2000, false);	
					}
				},
				error:function(){
					$.tooltip('删除失败，请检查服务器或网络状态！', 2000, false);
				}
			});
		}
		
		var pdid;//保存处方详细的id
		var $tmp;//用于保存当前删除的对象的引用
		//保存更新处方详细信息
		function saveDetail(item){
			var pdid = $(item).attr("lang").trim();//处方详细唯一编号
			var $count;//数量
			var canuse;//是否可用替代药品
			var unit;//实用药品单位
			var take_method;//服用方法
			//遍历找到一个处方详细的信息
			$(item).parent().parent().find(".modal-body").each(function(index){
				$count = $(this).find("#count");
				canuse = $(this).find("#canuse").find("option:selected").val().trim();
				unit = $(this).find("#unit").val().trim();
				take_method = $(this).find("#take_method").val().trim();
			});
			if (!/^\+?[1-9][0-9]*$/.test($count.val().trim())){
				$.tooltip(' 请输入正确的数字,该数字不能小于1！', 2000, false);
				$count.val("1").focus();
				return;
			}
			//发送ajax保存处方详细信息
			$.ajax({
				type:"POST",
				data:{"id":pdid,"count":$count.val().trim(),"canuse":canuse,"unit":unit,"takemethod":take_method},
				url:window.location.pathname.substring(0,25)+"saveUpdateDetail",
				success:function(data){
					if (data){						
						$.tooltip('保存成功成功！', 2000, true);
					}else{
						$.tooltip('删除失败，请检查服务器或网络状态！', 2000, false);	
					}
				},
				error:function(){
					$.tooltip('删除失败，请检查服务器或网络状态！', 2000, false);
				}
			});
		}
		jQuery(document).ready(function() {
			$("#enddate").asDatepicker();
			App.init();
			//在下拉框中选择药品的单位
			$(".span4").each(function(index){
				var unit = $(this).attr("lang").trim();
				var $d = $(this);
				$d.find("option").each(function(item){
					if (unit == $(this).attr("value").trim()){
						$(this).attr("selected","selected");
					}
				});
			});
			//设定每个药品详细的位置,一行四个，设定下一行的左边距
			$(".span3").each(function(index){
				if ((index + 1) % 5 == 0){
					$(this).css({"margin-left":"0px"});
				}
			});
			//给每个处方详细分配颜色
			var colors = ['portlet box green','portlet box red','portlet box yellow','portlet box purple','portlet box blue','portlet box grey']
			$(".detail").each(function(index){
				$(this).find("div:first").attr("class",colors[index > colors.length ? (index + 1) % colors.length:index]);
			});
			//确认删除处方详细数据
			$("#deletePreDetail").click(function(){
			    $.ajax({
					type:"POST",
					data:null,
					url:window.location.pathname.substring(0,25)+"deletePreDetail/"+pdid,
					success:function(data){
						if (data){
							$tmp.closest(".span3").remove();
							//重新控制每个药品的距离
						    $(".span3").each(function(index){
						    	if ((index + 1) % 4 == 0){
									$(this).css({"margin-left":"25px"});
								}
						    	if (index > 3 && index % 4 == 0){
						    		$(this).css({"margin-left":"0px"});
						    	}
							});
							$.tooltip('删除成功！', 2000, true);
						}else{
							$.tooltip('无法完成删除！', 2000, false);
						}
					},
					error:function(){
						$.tooltip('无法完成删除，请检网络是否通畅！', 2000, false);
					}
				});
			});
		});
		//删除处方详细的函数，pdid用于保存处方详细的编号
		function deletePreDetail(item){
			pdid = $(item).attr("lang");
			$tmp = $(item);
		}
	</script>
</html>