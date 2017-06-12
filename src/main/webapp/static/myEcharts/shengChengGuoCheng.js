var shengChengModule = (function (myEcharts) {
    Date.prototype.Format = function (fmt) { //author: meizz 
        var o = {
            "M+": this.getMonth() + 1, //月份 
            "d+": this.getDate(), //日 
            "h+": this.getHours(), //小时 
            "m+": this.getMinutes(), //分 
            "s+": this.getSeconds(), //秒 
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
            "S": this.getMilliseconds() //毫秒 
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }

    var myChart1 = echarts.init(document.getElementById("top-left"));
    myEcharts.push(myChart1);

    var app = {};
    var option1 = null;
    var option2 = null;

    var base = +new Date(2016, 1, 3);
    var oneDay = 24 * 3600 * 1000;
    var date = [];

    var data = [Math.random() * 150];
    var now = new Date(base);



    option1 = {
        title: {
            text: '  生成过程'
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        legend: {
            data: ['TP', 'TN', 'COD', 'BOD', 'SS', 'NH3-N', 'PH', '流量']
        },
        toolbox: {
            show: true,
            feature: {
                dataView: { readOnly: false },
                saveAsImage: {},
                myTool1: {
                    show: true,
                    title: '最大化',
                    icon: 'path://M432.45,595.444c0,2.177-4.661,6.82-11.305,6.82c-6.475,0-11.306-4.567-11.306-6.82s4.852-6.812,11.306-6.812C427.841,588.632,432.452,593.191,432.45,595.444L432.45,595.444z M421.155,589.876c-3.009,0-5.448,2.495-5.448,5.572s2.439,5.572,5.448,5.572c3.01,0,5.449-2.495,5.449-5.572C426.604,592.371,424.165,589.876,421.155,589.876L421.155,589.876z M421.146,591.891c-1.916,0-3.47,1.589-3.47,3.549c0,1.959,1.554,3.548,3.47,3.548s3.469-1.589,3.469-3.548C424.614,593.479,423.062,591.891,421.146,591.891L421.146,591.891zM421.146,591.891',
                    onclick: function () {
                        // alert('myToolHandler1');
                        var items = document.querySelectorAll('#content .item');
                        for (let i = 0; i < items.length; i++) {
                            items[i].classList.remove("mycharts");
                            items[i].classList.add("deactive");
                            document.getElementById("top-left").classList.remove("deactive");
                            document.getElementById("top-left").classList.add("active");
                        }
                        myChart1.resize();

                    }
                },
                myTool2: {
                    show: true,
                    title: '还原',
                    icon: 'image://http://echarts.baidu.com/images/favicon.png',
                    onclick: function () {
                        // alert('myToolHandler2');
                        var items = document.querySelectorAll('#content .item');
                        for (let i = 0; i < items.length; i++) {
                            items[i].classList.remove("deactive");
                            items[i].classList.remove("active");
                            items[i].classList.add("mycharts");

                        }
                        myChart1.resize();
                    }
                }
            }
        },

        xAxis: [
            {
                type: 'category',
                boundaryGap: true,
                data: (function () {
                    var now = new Date();

                    var res = [];
                    var len = 12;
                    while (len--) {
                        res.unshift(now.toLocaleTimeString().replace(/^\D*/, ''));
                        now = new Date(now - 300000);
                    }
                    return res;
                })()
            }
        ],
        yAxis: [
            {
                type: 'value',
                scale: true,
                name: 'mg/L',
                max: 40,
                min: 0,
                boundaryGap: [0.2, 0.2]
            },
            {
                type: 'value',
                scale: true,
                name: 'm3',
                max: 50,
                min: 0,
                boundaryGap: [0.2, 0.2]
            }
        ],
        series: [

            {
                name: 'TP',
                type: 'line',
                xAxisIndex: 0,
                yAxisIndex: 0,
                itemStyle: {
                    normal: {
                        color: '#95c800',
                        label: {
                            show: false,
                            position: 'top',

                            textStyle: {
                                color: 'black',
                                fontSize: '16',
                                fontFamily: '微软雅黑',
                                fontWeight: 'bold'
                            }
                        },
                        labelLine: {
                            normal: {
                                smooth: .6
                            }
                        }
                    }
                },
                data: [25, 26, 25, 24, 24, 26, 25, 25, 24, 25, 26, 26]
            },
            {
                name: 'TN',
                type: 'line',
                xAxisIndex: 0,
                yAxisIndex: 0,
                itemStyle: {
                    normal: {
                        color: '#ff6501',
                        label: {
                            show: false,
                            position: 'top',

                            textStyle: {
                                color: 'black',
                                fontSize: '16',
                                fontFamily: '微软雅黑',
                                fontWeight: 'bold'
                            }
                        }
                    }
                },
                data: [22, 23, 22, 22, 20, 21, 23, 22, 23, 23, 22, 21]
            },
            {
                name: 'COD',
                type: 'line',
                xAxisIndex: 0,
                yAxisIndex: 0,
                itemStyle: {
                    normal: {
                        color: '#44c6f7',
                        label: {
                            show: false,
                            position: 'top',

                            textStyle: {
                                color: 'black',
                                fontSize: '16',
                                fontFamily: '微软雅黑',
                                fontWeight: 'bold'
                            }
                        }
                    }
                },
                data: [15, 14, 16, 15, 15, 18, 17, 16, 16, 17, 19, 17]
            },
            {
                name: 'BOD',
                type: 'line',
                xAxisIndex: 0,
                yAxisIndex: 0,
                itemStyle: {
                    normal: {
                        color: '#deae04',
                        label: {
                            show: false,
                            position: 'top',

                            textStyle: {
                                color: 'black',
                                fontSize: '16',
                                fontFamily: '微软雅黑',
                                fontWeight: 'bold'
                            }
                        }
                    }
                },
                data: [12, 13, 13, 12, 11, 13, 14, 12, 10, 11, 10, 12]
            },
            {
                name: 'SS',
                type: 'line',
                xAxisIndex: 0,
                yAxisIndex: 0,
                itemStyle: {
                    normal: {
                        color: '#736d9b',
                        label: {
                            show: false,
                            position: 'top',

                            textStyle: {
                                color: 'black',
                                fontSize: '16',
                                fontFamily: '微软雅黑',
                                fontWeight: 'bold'
                            }
                        }
                    }
                },
                data: [16, 17, 16, 16, 15, 16, 14, 15, 15, 17, 16, 15]
            },
            {
                name: 'TH3-N',
                type: 'line',
                xAxisIndex: 0,
                yAxisIndex: 0,
                itemStyle: {
                    normal: {
                        color: '#007876',
                        label: {
                            show: false,
                            position: 'top',

                            textStyle: {
                                color: 'black',
                                fontSize: '16',
                                fontFamily: '微软雅黑',
                                fontWeight: 'bold'
                            }
                        }
                    }
                },
                data: [21, 22, 20, 19, 21, 21, 20, 19, 20, 20, 21, 20]
            },
            {
                name: 'PH',
                type: 'line',
                xAxisIndex: 0,
                yAxisIndex: 0,
                itemStyle: {
                    normal: {
                        color: '#90aaa9',
                        label: {
                            show: false,
                            position: 'top',

                            textStyle: {
                                color: 'black',
                                fontSize: '16',
                                fontFamily: '微软雅黑',
                                fontWeight: 'bold'
                            }
                        }
                    }
                },
                data: [13, 15, 16, 15, 13, 16, 14, 14, 15, 17, 18, 15]
            },
            {
                name: '流量',
                type: 'line',
                xAxisIndex: 0,
                yAxisIndex: 1,
                itemStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(
                            0, 0, 0, 1,
                            [
                                { offset: 0, color: '#83bff6' },
                                { offset: 0.5, color: '#188df0' },
                                { offset: 1, color: '#188df0' }
                            ]
                        ),
                        label: {
                            show: true,
                            position: 'top',

                            textStyle: {
                                color: 'black',
                                fontSize: '16',
                                fontFamily: '微软雅黑',
                                fontWeight: 'bold'
                            }
                        }
                    },
                    emphasis: {
                        color: new echarts.graphic.LinearGradient(
                            0, 0, 0, 1,
                            [
                                { offset: 0, color: '#2378f7' },
                                { offset: 0.7, color: '#2378f7' },
                                { offset: 1, color: '#83bff6' }
                            ]
                        )
                    }
                },
                data: [44, 42, 46, 40, 42, 39, 45, 44, 46, 43, 42, 44]
            }
        ]
    };


    myChart1.setOption(option1);



    clearInterval(app.timeTicket);

    app.count = 11;
    app.timeTicket = setInterval(function () {
        axisData = (new Date()).toLocaleTimeString().replace(/^\D*/, '');


        var data0 = option1.series[0].data;
        var data1 = option1.series[1].data;
        var data2 = option1.series[2].data;
        var data3 = option1.series[3].data;


        data0.shift();
        data0.push(Math.round(Math.random() * 25));
        data1.shift();
        data1.push((Math.random() * 6 + 5).toFixed(1) - 0);
        data2.shift();
        data2.push((Math.random() * 5 + 5).toFixed(1) - 0);
        data3.shift();
        data3.push((Math.random() * 4 + 5).toFixed(1) - 0);






        option1.xAxis[0].data.shift();
        option1.xAxis[0].data.push(axisData);



        myChart1.setOption(option1);


    }, 5000);

})(myEcharts || []);
