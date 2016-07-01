function getAjaxDate(){
	//显示不同承保部门人数所占的百分比
	   $.ajax({
			url : "getData",
			type : "GET",
			dataType : 'json',
			success : function(data) {
				ColumnChart("#columnchart",data);
			}
		});
		//显示不同年龄段人数的分布
		$.ajax({
			type:"get",
			url:"getCountByAge",
			success:function(data){
				data = eval('('+ data + ')');
				var year = [];
				var count = [];
				for (var i = 0; i < data.length; i++){
					year.push(data[i][1]);
					count.push(data[i][0]);
				}
				showYear("#container",year,count);
			}
		});
		$.ajax({
			type:"get",
			url:"findByYeayMontheDay",
			success:function(d){
				var s = d.trim();
				var t = eval('(' + s + ')');
				showYearMonthDay(t);
			}
		});
}
