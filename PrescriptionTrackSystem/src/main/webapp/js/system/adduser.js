$("#polictNumber").click(function() {
	$(this).val(guid());
});
$("#addUser").click(function() {
	var $name = $("#name");
	var $telephone = $("#telephone");
	var $birthday = $("#birthday");
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
	if (!$telephone.val().match(/^(((13[0-9]{1})|159|153)+\d{8})$/)) {
		$.tooltip('手机号码格式错误！', 2000, false);
		$telephone.focus();
		return false;
	}
	if ($birthday.val() == "") {
		$.tooltip('日期还没填呢！', 2000, false);
		$birthday.focus();
		return false;
	}
});

function S4() {
	return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
};
function guid() {
	return (S4() + S4() + S4() + S4() + S4() + S4() + S4() + S4());
};
function checkTelephone(item) {
	var telephone = $(item).val().trim();
	if (!telephone.match(/^(((13[0-9]{1})|159|153)+\d{8})$/)) {
		$.tooltip('该手机号格式错误请重新填写！', 2000, false);
		$(item).focus();
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
				$(item).val("").focus();
				return false;
			}
		},
		error : function() {
			$.tooltip('请检查网络是否通畅！', 2000, false);
		}
	});
}
