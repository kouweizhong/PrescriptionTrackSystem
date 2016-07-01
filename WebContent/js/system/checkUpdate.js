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
			if (data.trim() == "1"){						
				$.tooltip('保存成功成功！', 2000, true);
				start("updatePre");
			} else if (data.trim() == "2"){
				$.tooltip('您没有权限修改！', 2000, false);
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
			if (data.trim() == "1"){						
				$.tooltip('保存成功成功！', 2000, true);
				start("saveDetail");
			}else if (data.trim() == "2"){
				$.tooltip('您没有权限修改！', 2000, false);
			}else{
				$.tooltip('保存失败，请检查服务器或网络状态！', 2000, false);	
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
			data:{"id":pdid},
			url:window.location.pathname.substring(0,25)+"deletePreDetail",
			success:function(data){
				if (data.trim() == "1"){
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
					start("deletePreDetail");
				}else if (data.trim() == "2"){
					$.tooltip('您没有权限修改！', 2000, false);
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