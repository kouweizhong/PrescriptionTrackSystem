function ColumnChart() {
	$(arguments[0]).highcharts({
		chart : {
			type : 'column'
		},
		title : {
			text : '各个承保部门人数所占人数的百分比'
		},
		xAxis : {
			type : 'category'
		},
		yAxis : {
			title : {
				text : '百分比'
			}
		},
		credits:{
			enabled:false
		},
		plotOptions : {
			series : {
				borderWidth : 0,
				dataLabels : {
					enabled : true,
					format : '{point.y:.2f}%'
				}
			}
		},
		legend : {
			enabled : false
		},
		tooltip : {
			pointFormat : '所占比例: <b>{point.y:.1f} %</b>',
		},
		series : [ {
			name : "Brands",
			colorByPoint : true,
			data : arguments[1]
		} ]
	});
}

function showYear(){
	   $(arguments[0]).highcharts({
	        chart: {
	            type: 'spline',
	            cursor:'pointer'
	        },
	        title: {
	            text: '不同年龄段人数的分布'
	        },
	        xAxis: {
	            categories:arguments[1] 
	        },
	        yAxis: {
	            title: {
	                text: '数量'
	            },
	            labels: {
	                formatter: function () {
	                    return this.value + '人';
	                }
	            }
	        },
	        credits:{
				enabled:false
			},
	        tooltip: {
	            crosshairs: true,
	            shared: true
	        },
	        plotOptions: {
	            spline: {
	                marker: {
	                    radius: 4,
	                    lineColor: '#666666',
	                    lineWidth: 1
	                }
	            }
	        },
	        series: [{
	            name: '人数',
	            marker: {
	                symbol: 'square'
	            },
	            data: arguments[2]
	        }]
	    });
}
//用户的  3d年 月 日
function showYearMonthDay(){
	// Give the points a 3D feel by adding a radial gradient
    Highcharts.getOptions().colors = $.map(Highcharts.getOptions().colors, function (color) {
        return {
            radialGradient: {
                cx: 0.4,
                cy: 0.3,
                r: 0.5
            },
            stops: [
                [0, color],
                [1, Highcharts.Color(color).brighten(-0.2).get('rgb')]
            ]
        };
    });
 
    // Set up the chart
    var chart = new Highcharts.Chart({
        chart: {
            renderTo: 'showYMD',
            margin: 100,
            type: 'scatter',
            options3d: {
                enabled: true,
                alpha: 10,
                beta: 30,
                depth: 250,
                viewDistance: 5,

                frame: {
                    bottom: { size: 1, color: 'rgba(0,0,0,0.02)' },
                    back: { size: 1, color: 'rgba(0,0,0,0.04)' },
                    side: { size: 1, color: 'rgba(0,0,0,0.06)' }
                }
            }
        },
        title: {
            text: '用户的年出生日期，月份，日期分布'
        },
        credits:{
			enabled:false
		},
        plotOptions: {
            scatter: {
                width: 10,
                height: 10,
                depth: 10
            }
        },
        yAxis: {
            min: 1,
            max: 12,
            title: null
        },
        xAxis: {
            min: 1980,
            max: 2020,
            gridLineWidth: 1
        },
        zAxis: {
            min: 1,
            max: 40,
            showFirstLabel: false
        },
        legend: {
            enabled: false
        },
        series: [{
            name: "出生年月日",
            colorByPoint: true,
            data: arguments[0]
        }]
    });
    // Add mouse events for rotation
    $(chart.container).bind('mousedown.hc touchstart.hc', function (e) {
        e = chart.pointer.normalize(e);
        var posX = e.pageX,
            posY = e.pageY,
            alpha = chart.options.chart.options3d.alpha,
            beta = chart.options.chart.options3d.beta,
            newAlpha,
            newBeta,
            sensitivity = 5; 
        $(document).bind({
            'mousemove.hc touchdrag.hc': function (e) {
                newBeta = beta + (posX - e.pageX) / sensitivity;
                chart.options.chart.options3d.beta = newBeta;
                newAlpha = alpha + (e.pageY - posY) / sensitivity;
                chart.options.chart.options3d.alpha = newAlpha;
                chart.redraw(false);
            },
            'mouseup touchend': function () {
                $(document).unbind('.hc');
            }
        });
    });
}
