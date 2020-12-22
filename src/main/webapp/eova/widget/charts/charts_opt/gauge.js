//指定仪表盘的配置项和数据 option.series[0].data[0].value = xx;xxChart.setOption(option, true); 可以进行定时更新
option = {
    	    tooltip: {
    	        formatter: '{a} <br/>{b} : {c}%'
    	    },
    	    toolbox: {
    	        feature: {
    	            restore: {},
    	            saveAsImage: {}
    	        }
    	    },
    	    series: [
    	        {
    	            name: '业务指标',
    	            type: 'gauge',
    	            detail: {formatter: '{value}%'},
    	            data: [{value: 50, name: '完成率'}]
    	        }
    	    ]
    	};