<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html style="height: 100%"> 
<head> <meta charset="utf-8">
 <%@include file="/WEB-INF/views/include/head.jsp" %>
 <meta name="viewport" content="width=device-width, initial-scale=1" />
 <script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
 <script src="http://api.map.baidu.com/api?v=2.0&ak=ou0dk6IPYpdl2tlOUzNLxpRgZBBounra"></script>
 <script src="${ctxStatic}/echarts3/echarts.js"></script>
 <script src="${ctxStatic}/echarts3/extension/bmap.min.js"></script></head>
<body style="height: 100%; margin: 0">
<div id="content" style="height: 100%">
  <div id="right" style="height: 100%; width: 260px; float: right; ">
  <div class="container-fluid">
  	<div class="row-fluid">
  		<div class="span12">
  			<h5>
  				滇池环湖截污治污体系运行态势
  			</h5>
  			<p>
  				当前降水量:<br /> 当前运行方案:<br /> 当前错峰模式:<br /> 点源污水量截留率:<br /> 城市初期雨水量截留率:<br /> 农村农业污水量截留率:
  			</p>
  		</div>
  	</div>
  	<div class="row-fluid">
  		<div class="span12">
  			<hr class="table-bordered" />
  			<h5 class="table-bordered">
  				截污治污过程水质水量
  			</h5>
  			<table class="table table-bordered">
  				<thead>
  					<tr>
  						<th>
  						</th>
  						<th>
  							生成
  						</th>
  						<th>
  							截污
  						</th>
  						<th>
  							处理
  						</th>
  						<th>
  							入湖
  						</th>
  					</tr>
  				</thead>
  				<tbody>
  					<tr>
  						<td>
  							TP
  						</td>
  						<td>
  							20
  						</td>
  						<td>
  							18
  						</td>
  						<td>
  							10
  						</td>
  						<td>
  						</td>
  					</tr>
  					<tr class="success">
  						<td>
  							TN
  						</td>
  						<td>
  							21
  						</td>
  						<td>
  							17
  						</td>
  						<td>
  							9
  						</td>
  						<td>
  						</td>
  					</tr>
  					<tr class="error">
  						<td>
  							COD
  						</td>
  						<td>
  							18
  						</td>
  						<td>
  							14
  						</td>
  						<td>
  							7
  						</td>
  						<td>
  						</td>
  					</tr>
  					<tr class="warning">
  						<td>
  							BOD
  						</td>
  						<td>
  							22
  						</td>
  						<td>
  							15
  						</td>
  						<td>
  							6
  						</td>
  						<td>
  						</td>
  					</tr>
  					<tr class="info">
  						<td>
  							SS
  						</td>
  						<td>
  							19
  						</td>
  						<td>
  							10
  						</td>
  						<td>
  							4
  						</td>
  						<td>
  						</td>
  					</tr>
  					<tr>
  						<td>
  							TH3-N
  						</td>
  						<td>
  							16
  						</td>
  						<td>
  							12
  						</td>
  						<td>
  							5
  						</td>
  						<td>
  						</td>
  					</tr>
  					<tr>
  						<td>
  							PH
  						</td>
  						<td>
  							17
  						</td>
  						<td>
  							16
  						</td>
  						<td>
  							14
  						</td>
  						<td>
  						</td>
  					</tr>
  					<tr>
  						<td>
  							FLOW
  						</td>
  						<td>
  							42
  						</td>
  						<td>
  							39
  						</td>
  						<td>
  							38
  						</td>
  						<td>
  						</td>
  					</tr>
  				</tbody>
  			</table>
  		</div>
  	</div>
  	<div class="row-fluid">
  		<div class="span12">
  			<form>
  				<fieldset>
  					<div>
  						告警信息
  					</div>
  					<select multiple="multiple">
  					 <option>农业沟渠1 2016/12/11 08:30 TP : 40</option>
  					 <option>雨水井2 2016/12/12 12:30 TN : 47</option></select>
  				</fieldset>
  			</form>
  		</div>
  	</div>
  </div>
  </div>
  <div id="container" style="height: 100%; margin-right:260px"></div>
</div>

<script type="text/javascript">
var dom = document.getElementById("container");
var myChart = echarts.init(dom);
var app = {};
option = null;
app.title = '热力图与百度地图扩展';
$.get('${ctxStatic}/data.json', function (data) {


	//var data = eval("("+data+")");
	var points = [].concat.apply([], data.map(function (track) {
		return track.map(function (seg) {
			return seg.coord.concat([1]);
			});
		}));
		myChart.setOption(option = {
			animation: false,
			bmap: {
				center: [102.70727722374, 24.929752034923],
				zoom: 14,
				roam: true
			},
			visualMap: {
				show: false,
				top: 'top',
				min: 0,
				max: 5,
				seriesIndex: 0,
				calculable: true,
				inRange: {
					color: ['blue', 'blue', 'green', 'yellow', 'red']
				}
			},
			series: [{
				type: 'heatmap',
				coordinateSystem: 'bmap',
				data: points,
				pointSize: 5,
				blurSize: 6
			}]
		});
		if (!app.inNode) {
			// 添加百度地图插件
			var bmap = myChart.getModel().getComponent('bmap').getBMap();
			bmap.addControl(new BMap.MapTypeControl());
			}
		});
		;

var uploadedDataURL = "/asset/get/s/data-1469613131944-r1NUN-Ud.json";

$.getJSON(uploadedDataURL, function (rawData) {
    var lines = rawData.track.slice(0, rawData.track.length - 1).map(function (seg, idx) {
        return [{
            coord: seg.coord,
            value: seg.elevation
        }, {
            coord: rawData.track[idx + 1].coord
        }];
    });

    var waypointsData = rawData.waypoints.map(function (item) {
        return {
            name: item.name,
            value: item.coord.concat([item.elevation])
        };
    });

    myChart.setOption(option = {
        animation: false,
        bmap: {
            center: [120.14266322374, 30.235018034923],
            zoom: 14,
            roam: true
        },
        tooltip: {
            trigger: 'axis'
        },
        visualMap: {
            top: 'top',
            min: 0,
            max: 500,
            text: ['海拔 500 米', '海拔 0 米'],
            seriesIndex: [0, 4],
            inRange: {
                color: ['#42810f', '#c9c367', '#b07a17', '#a23a05']
            }
        },
        grid: [{
            right: 10,
            height: 140,
            width: '50%',
            bottom: 10,
        }, {
            show: true,
            right: 0,
            height: 170,
            width: '53%',
            bottom: 0,
            backgroundColor: 'rgba(0,0,0,0.7)'
        }],
        xAxis: {
            type: 'category',
            show: false,
            inverse: true,
            data: rawData.track.map(function (seg) {
                return seg.coord.join(',');
            })
        },
        yAxis: {
            position: 'right',
            splitLine: {
                show: false
            },
            axisLabel: {
                inside: true,
                formatter: '{value} m',
                textStyle: {
                    color: '#ddd'
                }
            },
            axisLine: {
                lineStyle: {
                    color: '#ddd'
                }
            },
            axisTick: {
                inside: true,
                lineStyle: {
                    color: '#ddd'
                }
            },
            max: 500,
            splitNumber: 2
        },
        series: [{
            type: 'lines',
            coordinateSystem: 'bmap',
            data: lines,
            tooltip: {
                show: false
            },
            lineStyle: {
                normal: {
                    width: 6,
                    opacity: 1,
                    shadowColor: 'rgba(0, 0, 0, 0.5)',
                    shadowBlur: 3
                },
                emphasis: {
                    color: '#f6fd40'
                }
            },
            animationDelay: function (idx) {
                return idx * 20;
            }
        }, {
            type: 'scatter',
            coordinateSystem: 'bmap',
            symbolSize: [10, 5],
            symbolOffset: [7, 0],
            silent: true,
            tooltip: {
                show: false
            },
            itemStyle: {
                normal: {
                    color: 'red',
                    borderWidth: 1,
                    borderColor: '#fff'
                }
            },
            data: waypointsData
        }, {
            type: 'scatter',
            coordinateSystem: 'bmap',
            symbol: 'path://M54.227,12.611c-0.338-0.336-0.736-0.505-1.196-0.505c-0.229,0-0.712,0.188-1.446,0.559  c-0.735,0.372-1.515,0.786-2.336,1.248c-0.823,0.459-1.797,0.875-2.921,1.247c-1.123,0.371-2.163,0.559-3.12,0.559  c-0.884,0-1.664-0.168-2.336-0.505c-2.229-1.044-4.168-1.823-5.814-2.337c-1.646-0.513-3.416-0.771-5.311-0.771  c-3.272,0-6.999,1.064-11.177,3.188c-0.862,0.43-1.48,0.763-1.88,1.007l-0.397-2.911c0.897-0.779,1.476-1.914,1.476-3.195  c0-2.347-1.902-4.249-4.249-4.249c-2.347,0-4.249,1.902-4.249,4.249c0,1.531,0.818,2.862,2.032,3.61l5.74,42.09  c0.171,1.253,1.243,2.162,2.474,2.162c0.112,0,0.226-0.007,0.341-0.022c1.368-0.188,2.326-1.447,2.139-2.815L19.69,38.303  c4.186-2.077,7.807-3.124,10.853-3.124c1.293,0,2.554,0.193,3.783,0.583c1.23,0.391,2.253,0.815,3.067,1.274  c0.814,0.46,1.775,0.886,2.88,1.274c1.107,0.39,2.2,0.585,3.279,0.585c2.726,0,5.991-1.027,9.796-3.08  c0.478-0.248,0.828-0.492,1.049-0.731c0.221-0.239,0.332-0.579,0.332-1.021V13.806C54.729,13.347,54.562,12.948,54.227,12.611z',
            symbolSize: 30,
            symbolOffset: [15, -15],
            tooltip: {
                show: false
            },
            itemStyle: {
                normal: {
                    color: 'red',
                    borderWidth: 1,
                    borderColor: '#fff'
                }
            },
            label: {
                normal: {
                    textStyle: {
                        fontWeight: 'bold',
                        color: '#111'
                    },
                    show: true,
                    position: 'right',
                    formatter: '{b}'
                }
            },
            data: waypointsData
        }, {
            type: 'scatter',
            name: 'marker',
            coordinateSystem: 'bmap',
            symbolSize: 100,
            symbolOffset: [0, -50],
            itemStyle: {
                normal: {
                    color: '#555',
                    borderColor: '#111',
                    borderWidth: 5
                }
            },
            tooltip: {
                show: false
            },
            symbol: 'path://M21.9,15c0,0-8.7,9.9-9.5,11c-0.9,1.1-2.3,0.3-2.3,0.3  s-8.8-9.7-9.8-11.4C-0.7,13.3,1.2,13,1.2,13H6V1c0-0.6,0.4-1,1-1h8c0.6,0,1,0.4,1,1v12h4.7C23.1,13,21.9,15,21.9,15z',
            data: []
        }, {
            type: 'line',
            showSymbol: false,
            hoverAnimation: false,
            areaStyle: {
                normal: {}
            },
            z: 9999,
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    animation: false
                },
                transitionDuration: 0,
                formatter: function (param) {
                    return param[0].value;
                },
                position: function (pt) {
                    return [pt[0], '10%'];
                }
            },
            areaStyle: {
                normal: {}
            },
            data: rawData.track.map(function (seg) {
                return seg.elevation;
            })
        }]
    });

    myChart.on('showtip', function (param) {
        if (param.seriesIndex === 4) {
            myChart.setOption({
                series: [{
                    name: 'marker',
                    animation: false,
                    data: [rawData.track[param.dataIndex].coord]
                }]
            });
        }
    });


});
		if (option && typeof option === "object") {
			myChart.setOption(option, true);
		}
		</script>
	</body>
</html> 
