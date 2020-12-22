//指定柱图的配置项和数据
option = {
	    tooltip: {
	        trigger: 'axis',
	        axisPointer: {
	            type: 'cross',
	            crossStyle: {
	                color: '#999'
	            }
	        }
	    },
	    toolbox: {
	        feature: {
	            dataView: {show: true, readOnly: false},
	            magicType: {show: true, type: ['line', 'bar']},
	            restore: {show: true},
	            saveAsImage: {show: true}
	        }
	    },
	    legend: {
	        data: ['总访问记录','南京区域访问记录']
	    },
	    xAxis: [
	        {
	            type: 'category',
	            data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日'],
	            axisPointer: {
	                type: 'shadow'
	            }
	        }
	    ],
	    yAxis: [
	        {
	            type: 'value',
	            name: '访问量',
	            min: 0,
	            axisLabel: {
	                formatter: '{value} 次'
	            }
	        }
	    ],
	    series: [
	        {
	            name: '总访问记录',
	            type: 'bar',
	            data: [2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]
	        },
	        {
	            name: '南京区域访问记录',
	            type: 'line',
	            data: [2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
	        }
	    ]
	};