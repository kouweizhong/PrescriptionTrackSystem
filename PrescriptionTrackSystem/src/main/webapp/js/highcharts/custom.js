function PieChart() {
		$(arguments[0]).highcharts({
			chart : {
				plotBackgroundColor : null,
				plotBorderWidth : null,
				plotShadow : false,
				type : 'pie',
			},
			title : {
				text : 'this is the title'
			},
			tooltip : {
				pointFormat : '{series.name}: <b>{point.percentage:.1f}</b>'
			},
			plotOptions : {
				pie: {
	                allowPointSelect: true,
	                cursor: 'pointer',
	                depth: 35,
	                dataLabels: {
	                    enabled: true,
	                    format: '{point.name}'
	                }
	            }
			},
			series : [ {
				name : "percent",
				colorByPoint : true,				
				data : arguments[1]
			}]
		});
	}
	
	
	function ColumnChart(){
	    $(arguments[0]).highcharts({
	        chart: {
	            type: 'column',
	        },
	        title: {
	            text: 'this is the title'
	        },
	        xAxis: {
	            type: 'category'
	        },
	        yAxis: {
	            title: {
	                text: 'percent'
	            }
	        },
	        plotOptions: {
	            series: {
	                borderWidth: 0,
	                dataLabels: {
	                    enabled: true,
	                    format: '{point.y:.2f}%'
	                }
	            }
	        },
	        legend: {
	            enabled: false
	        },
	        tooltip: {
	            pointFormat: '2016所占比例: <b>{point.y:.1f} millions</b>',
	        },
	        series: [{
	            name: "Brands",
	            colorByPoint: true,
	            data: arguments[1]
	        }]
		});
	}
	
	
	function Pie3d(){
	    $(arguments[0]).highcharts({
	    	chart: {
	            type: 'pie',
	            options3d: {
	                enabled: true,
	                alpha: 45,
	                beta: 0
	            }
	        },
	        title: {
	            text: 'this is the title'
	        },
	        tooltip: {
	            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	        },
	        plotOptions: {
	            pie: {
	                allowPointSelect: true,
	                cursor: 'pointer',
	                depth: 35,
	                dataLabels: {
	                    enabled: true,
	                    format: '{point.name}'
	                }
	            }
	        },
	        series: [{
	            type: 'pie',
	            name: 'Browser share',
	            data: arguments[1]
	        }]
	    });
	}
	
	function Donut3d(){
	    $(arguments[0]).highcharts({
	    	 chart: {
	             type: 'pie',
	             options3d: {
	                 enabled: true,
	                 alpha: 45
	             }
	         },
	         title: {
	             text: 'this is the title'
	         },
	         subtitle: {
	             text: '3D donut in Highcharts'
	         },
	         plotOptions: {
	             pie: {
	                 innerSize: 100,
	                 depth: 45
	             }
	         },
	         series: [{
	             name: 'Delivered amount',
	             data:arguments[1]
	         }]
	    });
	}