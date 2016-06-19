var Login = function() {

	return {
		// main function to initiate the module
		init : function() {

			$('.login-form')
					.validate(
							{
								errorElement : 'label', // default input error
								// message container
								errorClass : 'help-inline', // default input
								// error message
								// class
								focusInvalid : false, // do not focus the last
								// invalid input
								rules : {
									name : {
										required : true
									},
									password : {
										required : true
									},
									remember : {
										required : false
									}
								},

								messages : {
									name : {
										required : "用户名不能为空."
									},
									password : {
										required : "密码不能为空."
									}
								},

								invalidHandler : function(event, validator) {
									$('.alert-error', $('.login-form')).show();
								},

								highlight : function(element) {
									$(element).closest('.control-group')
											.addClass('error');
								},
								success : function(label) {
									label.closest('.control-group')
											.removeClass('error');
									label.remove();
								},

								errorPlacement : function(error, element) {
									error
											.addClass(
													'help-small no-left-padding')
											.insertAfter(
													element
															.closest('.input-icon'));
								},

								submitHandler : function(form) {
									form.submit();
								}
							});

			$('.forget-form')
					.validate(
							{
								errorElement : 'label', // default input error
								// message container
								errorClass : 'help-inline', // default input
								// error message
								// class
								focusInvalid : false, // do not focus the last
								// invalid input
								ignore : "",
								rules : {
									email : {
										required : true,
										email : true
									}
								},

								messages : {
									email : {
										required : "Email is required."
									}
								},

								invalidHandler : function(event, validator) { // display
									// error
									// alert
									// on
									// form
									// submit

								},

								highlight : function(element) { // hightlight
									// error inputs
									$(element).closest('.control-group')
											.addClass('error'); // set error
									// class to the
									// control group
								},

								success : function(label) {
									label.closest('.control-group')
											.removeClass('error');
									label.remove();
								},

								errorPlacement : function(error, element) {
									error
											.addClass(
													'help-small no-left-padding')
											.insertAfter(
													element
															.closest('.input-icon'));
								},

								submitHandler : function(form) {
									window.location.href = "#";
								}
							});

			jQuery('#forget-password').click(function() {
				jQuery('.login-form').hide();
				jQuery('.forget-form').show();
			});

			jQuery('#back-btn').click(function() {
				jQuery('.login-form').show();
				jQuery('.forget-form').hide();
			});
		}
	};

}();
function GetQueryString(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if (r != null)
		return unescape(r[2]);
	return null;
}