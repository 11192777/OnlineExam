<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div id="displaySelect" style="display: none;">
			<h2>选择题</h2>
			<div id="selectTopicView"></div>
		</div>
		<div id="displayJudge" style="display: none;">
			<h2>判断题</h2>
			<div id="judgeTopicView"></div>
		</div>
	</div>
	<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
	<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/script/docs.min.js"></script>
	<script src="${APP_PATH}/layer/layer.js"></script>
	<script type="text/javascript">
		$(function() {
	
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/paper/paperList/doShowPaper",
				data : {
					"paperId" : "${paperId}"
				},
				beforeSend : function() {
					index = layer.load(2, {
						time : 10 * 1000
					});
				},
				success : function(result) {
					layer.close(index);
					var selectTopic = result.data.selectTopicList;
					var judgeTopic = result.data.judgeTopicList;
	
					if (selectTopic != null) {
						var context = "";
						for (var i = 1; i <= selectTopic.length; i++) {
							var data = selectTopic[i - 1];
							context += '<label style="font-size: 24px; font-family: \'楷体\'; padding-left: 5%;" for="exampleInputEmail1" >' + i + '.' + data.topContent + '</label><br>';
							context += '<label style="font-size: 22px; font-family: \'楷体\'; padding-left: 10%;" for="exampleInputEmail1" >A.' + data.res1 + '</label><br>';
							context += '<label style="font-size: 22px; font-family: \'楷体\'; padding-left: 10%;" for="exampleInputEmail1" >B.' + data.res2 + '</label><br>';
							context += '<label style="font-size: 22px; font-family: \'楷体\'; padding-left: 10%;" for="exampleInputEmail1" >C.' + data.res3 + '</label><br>';
							if (data.res4 != null) {
								context += '<label style="font-size: 22px; font-family: \'楷体\'; padding-left: 10%;" for="exampleInputEmail1" >D.' + data.res4 + '</label><br>';
							}
							context += '<label style="font-size: 22px; font-family: \'楷体\' color:red; padding-left: 85%;" for="exampleInputEmail1" >' + '正确答案:【' + String.fromCharCode(parseInt(data.resTrue) + 64) + '】' + '</label><br>';
						}
						$("#selectTopicView").html(context)
						$("#displaySelect").show()
					}
	
					if (judgeTopic != null) {
						var context = "";
						for (var i = 1; i <= judgeTopic.length; i++) {
							var data = judgeTopic[i - 1];
							if (data.result == 1) {
								context += '<label style="font-size: 24px; font-family: \'楷体\';padding-left: 5%;" for="exampleInputEmail1" >' + i + '.' + data.topContent + '   （' + '√' + '）</label><br>';
							} else {
								context += '<label style="font-size: 24px; font-family: \'楷体\'; padding-left: 5%;" for="exampleInputEmail1" >' + i + '.' + data.topContent + '   （' + '×' + '）</label><br>';
							}
						}
						$("#judgeTopicView").html(context)
						$("#displayJudge").show()
					}
				}
			});
		});
	</script>
</body>
</html>