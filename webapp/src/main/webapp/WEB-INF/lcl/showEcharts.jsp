<%--
  Created by IntelliJ IDEA.
  User: 杜家乐
  Date: 2018-05-17
  Time: 8:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%String path = request.getContextPath();%>
    <script type="text/javascript" src="<%=path%>/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="<%=path%>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" href="<%=path%>/js/jquery-easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" href="<%=path%>/js/jquery-easyui/themes/icon.css"/>
    <script src="<%=path%>/js/echarts/exporting.js"></script>
    <script src="<%=path%>/js/echarts/highcharts.js"></script>
</head>
<body>
<script src="<%=path%>/js/echarts/echarts.min.js"></script>
<div id="dd" class="easyui-layout" style="width:400px;height:400px;" data-options="fit:true">
    <div class="easyui-layout" data-options="region:'west',title:'数据展示'," style="width:600px;height:300px;">
        <center><h1>近一个月销量(折线图)</h1><br>
            <div id="main" style="width: 600px;height:400px;"></div>
        </center>
    </div>
    <div data-options="region:'center',title:'其他展示'," class="easyui-layout" data-options="fit:true" style="width:500px;height:200px;">
        <center><h1>近一个月销量(柱状图)</h1><br>
            <div id="main2" style="width: 600px;height:400px;"></div>
        </center>
    </div>
</div>
<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('main'));
    var myChart2 = echarts.init(document.getElementById('main2'));
    $(function(){
        $.ajax({
            url:"<%=request.getContextPath()%>/echartsController/quertEcharts.do",
            type:"post",
            dataType:"json",
            async:false,
            success:function (succ) {
                var names=[];
                var nums=[];
                $.each(succ,function(){
                    names.push(this.createtime)
                    nums.push(this.stauts)
                })
                myChart.setOption({
                    xAxis: {
                        type: 'category',
                        data: names
                    },
                    yAxis: {
                        type: 'value'

                    },
                    series: [{
                        data: nums,
                        type: 'line'
                    }]
                });
                var dataAxis = names;
                var data = nums;
                var yMax = 0;
                var dataShadow = [];

                for (var i = 0; i < data.length; i++) {
                    dataShadow.push(yMax);
                }

                myChart2.setOption({

                    xAxis: {
                        data: dataAxis,
                        axisLabel: {
                            inside: true,
                            textStyle: {
                                color: '#fff'
                            }
                        },
                        axisTick: {
                            show: false
                        },
                        axisLine: {
                            show: false
                        },
                        z: 10
                    },
                    yAxis: {
                        axisLine: {
                            show: false
                        },
                        axisTick: {
                            show: false
                        },
                        axisLabel: {
                            textStyle: {
                                color: '#999'
                            }
                        }
                    },
                    dataZoom: [
                        {
                            type: 'inside'
                        }
                    ],
                    series: [
                        { // For shadow
                            type: 'bar',
                            itemStyle: {
                                normal: {color: 'rgba(0,0,0,0.05)'}
                            },
                            barGap:'-100%',
                            barCategoryGap:'40%',
                            data: dataShadow,
                            animation: false
                        },
                        {
                            type: 'bar',
                            itemStyle: {
                                normal: {
                                    color: new echarts.graphic.LinearGradient(
                                        0, 0, 0, 1,
                                        [
                                            {offset: 0, color: '#83bff6'},
                                            {offset: 0.5, color: '#188df0'},
                                            {offset: 1, color: '#188df0'}
                                        ]
                                    )
                                },
                                emphasis: {
                                    color: new echarts.graphic.LinearGradient(
                                        0, 0, 0, 1,
                                        [
                                            {offset: 0, color: '#2378f7'},
                                            {offset: 0.7, color: '#2378f7'},
                                            {offset: 1, color: 'red'}
                                        ]
                                    )
                                }
                            },
                            data: data
                        }
                    ]
                });
            },
            error:function () {
                alert("GG")
            }
        })
    })
</script>
</body>
</html>
