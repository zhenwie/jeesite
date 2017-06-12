<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html style="height: 100%"> 
<head> <meta charset="utf-8">
 <%@include file="/WEB-INF/views/include/head.jsp" %>
 <meta name="viewport" content="width=device-width, initial-scale=1" />
 <style>
   .mycharts {
     height: 49%; width: 49%; float: left;
   }
   .deactive {
     display: none;
   }
   .active {
     height: 100%; width: 100%;
   }
   input[type=radio] {
     vertical-align:middle;margin-top:2px;
   }
   input[type=checkbox] {
     vertical-align:middle;margin-top:2px;
   }
   .item {
   }
   .toolbar-item {
     vertical-align:middle;
   }
 </style>
 <script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
 <script src="http://api.map.baidu.com/api?v=2.0&ak=ou0dk6IPYpdl2tlOUzNLxpRgZBBounra"></script>
 <script src="${ctxStatic}/echarts3/echarts.js"></script>
 <script src="${ctxStatic}/echarts3/extension/bmap.min.js"></script></head>
<body style="height: 100%; margin: 0">
<div id="filter-bar" style=" width: 100%; background-color: #e0e0e0;">
<div class="container-fluid" style="padding-right: 1px;">
	<div class="row-fluid">
		<div class="span10">
			<div class="row-fluid">
				<div class="toolbar-item" style="float: left">
					<div>
						 <label class="radio inline"><input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" /> 年</label> <label class="radio inline"><input type="radio" name="optionsRadios" id="optionsRadios3" value="option3" /> 月</label>
					</div>
				</div>
				<div class="toolbar-item" style="float: left">
				  <input id="beginDate" name="beginDate" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate" style="margin-bottom:0px"
                				value="<fmt:formatDate value="${log.beginDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
                  <label>--</label>
                  <input id="endDate" name="endDate" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate" style="margin-bottom:0px"
                				value="<fmt:formatDate value="${log.endDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				</div>
				<div class="toolbar-item" style="float: left; margin-left: 2px; background-color:#00ffff;">
					<label class="checkbox inline"><input type="checkbox" id="inlineCheckbox1" value="option1" />生成过程</label> <label class="checkbox inline"><input type="checkbox" id="inlineCheckbox2" value="option2" />截污过程</label> <label class="checkbox inline"><input type="checkbox" id="inlineCheckbox3" value="option3" />处理过程</label> <label class="checkbox inline"><input type="checkbox" id="inlineCheckbox4" value="option4" />入湖过程</label>
				</div>
				<div class="toolbar-item" style="float: left; margin-left: 2px; background-color:#FFD700;">
					<label class="checkbox inline"><input type="checkbox" id="inlineCheckbox1" value="option1" />TP</label> <label class="checkbox inline"><input type="checkbox" id="inlineCheckbox2" value="option2" />TN</label> <label class="checkbox inline"><input type="checkbox" id="inlineCheckbox3" value="option3" />BOD</label> <label class="checkbox inline"><input type="checkbox" id="inlineCheckbox4" value="option4" /> COD</label> <label class="checkbox inline"><input type="checkbox" id="inlineCheckbox5" value="option5" />SS</label>
				</div>
				<div class="toolbar-item" style="float: left; margin-left: 2px">
                	<button class="btn btn-warning" type="button">查询</button>
                </div>
			</div>
		</div>
		<div class="span2">
			<div class="row-fluid">
					<div class="btn-group pull-right">
						 <button class="btn" type="button">同比分析</button> <button class="btn" type="button">环比分析</button> <button class="btn" type="button">雨量水量分析</button>
					</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>
<div id="content" style="position:relative; clear: left; height: 100%;">
  <div id="top-left" class="item mycharts" style="border-right: 1px solid; border-bottom: 1px solid;">
  </div>

  <div id="top-right" class="item mycharts" style="border-bottom: 1px solid;">
  </div>

  <div id="bottom-left" class="item mycharts"  style="border-right: 1px solid;">
  </div>

  <div id="bottom-right" class="item mycharts">
  </div>
</div>
 <script>
   var myEcharts = [];
 </script>
 <script src="${ctxStatic}/myEcharts/shengChengGuoCheng.js" type="text/javascript"></script>
 <script src="${ctxStatic}/myEcharts/jieWuGuoCheng.js" type="text/javascript"></script>
 <script src="${ctxStatic}/myEcharts/chuLiGuoCheng.js" type="text/javascript"></script>
 <script src="${ctxStatic}/myEcharts/ruHuGuoCheng.js" type="text/javascript"></script>
 <script>
 window.addEventListener("resize", function() {
   for (let i = 0; i < myEcharts.length; i++) {
     myEcharts[i].resize();
   }
 });
 </script>

</body>
</html> 
