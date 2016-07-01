//修改用户信息
var s = [];
var $item;
function edit(item) {
	$item = $(item);
	$(item).closest("tr").find("td").each(function(index) {
		s[index] = $(this).text();
	});
	s[5] = $item.attr("lang").trim();
	
	var $name = $("#name");
	var $telephone = $("#telephone");
	var $birthday = $("#birthday");
	var $insuranceCompany = $("#insuranceCompany");
	var $polictNumber = $("#polictNumber");
	$name.val(s[0]);
	$telephone.val(s[2]);
	var str = s[1].split('-');
	$birthday.val(str[1] + "/" + str[2] + "/" + str[0]);
	$insuranceCompany.val(s[3]);
	$polictNumber.val(s[4]);
}
//设置保单号
$("#polictNumber").click(function() {
	$(this).val(guid());
});
//检测手机号是否存在
$("#telephone").blur(function(){
	var telephone = $(this).val().trim();
	if (!telephone.match(/^((13|15|18)+\d{9})$/)) {
		$.tooltip('该手机号格式错误请重新填写！', 2000, false);
		$(this).focus();
		return false;
	}
	$.ajax({
		type : "post",
		data : {
			"telephone" : telephone
		},
		url : "checkExistTelephone",
		success : function(data) {
			if (data.trim() == "1") {
				$.tooltip('该手机号可用！', 2000, true);
				return true;
			} else {
				$.tooltip('该手机号已经存在，请重新填写！', 2000, false);
				$("#telephone").val("").focus();
				return false;
			}
		},
		error : function() {
			$.tooltip('请检查网络是否通畅！', 2000, false);
		}
	});
});
// 修改用户提交
$("#updateUser").click(
		function() {
			var $name = $("#name");
			var $telephone = $("#telephone");
			var $birthday = $("#birthday");
			var $insuranceCompany = $("#insuranceCompany");
			var $polictNumber = $("#polictNumber");
			if ($name.val() == "") {
				$.tooltip('名字还没填呢！', 2000, false);
				$name.focus();
				return false;
			}
			if ($telephone.val() == "") {
				$.tooltip('手机号码还没填呢！', 2000, false);
				$telephone.focus();
				return false;
			}
			if (!$telephone.val().match(/^((1[3,5,8][0-9]{1})+\d{8})$/)) {
				$.tooltip('手机号码格式错误！', 2000, false);
				$telephone.focus();
				return false;
			}
			if ($birthday.val() == "") {
				$.tooltip('日期还没填呢！', 2000, false);
				$birthday.focus();
				return false;
			}
			// id s[5]用户id
			var info = [ $name.val(), $birthday.val(), $telephone.val(),
					$("#insuranceCompany").val(), $("#polictNumber").val() ];
			$.ajax({
				type : "post",
				url : "updateUser",
				data : {
					"id" : s[5],
					"name" : info[0],
					"birthday" : info[1],
					"telephone" : info[2],
					"insuranceCompany" : info[3],
					"polictNumber" : info[4]
				},
				success : function(data) {
					if (data.trim()=="1") {
						$.tooltip('修改成功！', 2000, true);
						// 回写修改数据
						birthday = $birthday.val().trim().split('/');
						b = birthday[2] + "-" + birthday[0] + "-" + birthday[1];
						info[1] = b;
						$item.closest("tr").find("td").each(function(index) {
							if (index < 5) {
								$(this).text(info[index]);
							}
						});
					} else if (data.trim() == "2"){
						$.tooltip('您没有权限修改！', 2000, false);
					}else{
						$.tooltip('无法完成修改，请检查网络！', 2000, false);
					}
				},
				error : function() {
					$.tooltip('无法完成修改，请注意参数值的输入形式！', 2000, false);
				}
			});
		});

// 查找用户处方信息
function findPre(item) {
	var id = $(item).attr("lang");
	window.location.href = "findPre/" + id;
}
// 删除用户
function deleteUser(item) {
	var id = $(item).attr("lang");
	$("#deleteUser").click(function() {
			$.ajax({
				type : "post",
				data : {
					"id" : id
				},
				url : "deleteUser",
				success : function(data) {
					if (data.trim() == "1") {
						$.tooltip('操作成功！', 2000, true);
						$(item).parent().parent().parent().parent()
								.parent().remove();
					}else if (data.trim() == "2"){
						$.tooltip('您没有权限修改！', 2000, false);
					}else {
						$.tooltip('操作失败，请稍后再试！', 2000, false);
					}
				},
			});
		});
}
function S4() {
	return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
};
function guid() {
	return (S4() + S4() + S4() + S4() + S4() + S4() + S4() + S4());
};