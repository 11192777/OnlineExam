<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="GB18030">
<head>
<meta charset="GB18030">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/main.css">
<style>
.tree li {
	list-style-type: none;
	cursor: pointer;
}

.tree-closed {
	height: 40px;
}

.tree-expanded {
	height: auto;
}
</style>
</head>

<body>
	<%@include file="/WEB-INF/jsp/common/common-index-title.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<div class="tree">
					<ul style="padding-left:0px;" class="list-group">
						<li class="list-group-item tree-closed"><a href="main.html"><i class="glyphicon glyphicon-dashboard"></i> 控制面板</a></li>
						<li class="list-group-item tree-closed"><span><i class="glyphicon glyphicon glyphicon-tasks"></i> 学生管理<span class="badge" style="float:right">3</span></span>
							<ul style="margin-top:10px;display:none;">
								<li style="height:30px;"><a href="${APP_PATH}/class/classList"><i class="glyphicon glyphicon-king"></i> 班级管理 </a></li>
								<li style="height:30px;"><a href="${APP_PATH}/exam/postExam"><i class="glyphicon glyphicon-lock"></i> 发布考试</a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><span><i class="glyphicon glyphicon-ok"></i> 试卷管理 <span class="badge" style="float:right">3</span></span>
							<ul style="margin-top:10px;display:none;">
								<li style="height:30px;"><a href="${APP_PATH}/paper/teacher/paperList"><i class="glyphicon glyphicon-lock"></i> 查看试卷</a></li>
								<li style="height:30px;"><a href="${APP_PATH}/paper/paperEdit"><i class="glyphicon glyphicon-lock"></i> 试卷编辑</a></li>
								<li style="height:30px;"><a href="${APP_PATH}/paper/teacher/importPaper"><i class="glyphicon glyphicon-lock"></i> 导入试卷</a></li>
								<li style="height:30px;"><a href="${APP_PATH}/paper/teacher/paperFavorites"><i class="glyphicon glyphicon-lock"></i> 我的试卷</a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><a href="param.html"><i class="glyphicon glyphicon-list-alt"></i> 参数管理</a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="page-header">
					<h1>试卷添加 - 预览</h1>
				</div>

				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation"><a href="#"><span class="badge">1</span> 配置试卷参数 </a></li>
					<li role="presentation"><a href="#"><span class="badge">2</span> 试卷编辑 </a></li>
					<li role="presentation" class="active"><a href="#"><span class="badge">3</span> 试卷预览</a></li>
				</ul>
				<hr>


				<div class="panel-body" id="selectTopic" style="display: none;">
					<form class="form-inline" role="form" style="float: left;">
						<div class="form-group has-feedback">
							<div class="input-group">
								<div class="input-group-addon" style="font-size: 24px;">选择题</div>
							</div>
						</div>
					</form>
					<hr style="clear: both;">
					<form role="form" style="margin-top:20px;">
						<div style="background-color: rgb(239, 228, 176);" id="selectTopicView"></div>
					</form>
				</div>

				<div class="panel-body" id="judgeTopic" style="display: none;">
					<form class="form-inline" role="form" style="float: left;">
						<div class="form-group has-feedback">
							<div class="input-group">
								<div class="input-group-addon" style="font-size: 24px;">判断题</div>
							</div>
						</div>
					</form>
					<br>
					<hr style="clear: both;">
					<form role="form" style="margin-top:20px;">
						<div style="background-color: rgb(239, 228, 176);" id="judgeTopicView"></div>
						<hr>
					</form>
				</div>


				<hr>
				<form role="form" style="margin-top:20px; padding-left: 2%;">
					<div style="background-color: rgb(239, 228, 176);" id="topicView"></div>
					<button type="button" onclick="window.location.href='${APP_PATH}/paper/paperEdit/step2'" class="btn btn-default">上一步</button>
					<button type="button" id="completeButton" class="btn btn-success">添加完成</button>
				</form>
				<hr>
			</div>
		</div>
	</div>
	<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
	<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/script/docs.min.js"></script>
	<script src="${APP_PATH}/layer/layer.js"></script>
	<script type="text/javascript">
		var registerInfo1 = JSON.parse(sessionStorage.getItem('paper_step1_info'));
		var registerInfo2 = JSON.parse(sessionStorage.getItem('paper_step2_info'));
		$(function() {
			$(".list-group-item").click(function() {
				if ($(this).find("ul")) {
					$(this).toggleClass("tree-closed");
					if ($(this).hasClass("tree-closed")) {
						$("ul", this).hide("fast");
					} else {
						$("ul", this).show("fast");
					}
				}
	
			});
			if (registerInfo1) {
				if (registerInfo1.haveSelect == '1') {
					if (registerInfo2) {
						loadSelectView()
					}
					$("#selectTopic").show()
				}
				if (registerInfo1.haveJudge == '1') {
					if (registerInfo2) {
						loadJudgeView()
					}
					$("#judgeTopic").show()
	
				}
			}
		});
	
		function loadSelectView() {
			var topicViewContext = "";
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/paper/doLoadSelectTopic",
				traditional : true,
				data : {
					"topicIdList" : registerInfo2.selectArray
				},
				beforeSend : function() {
					index = layer.load(2, {
						time : 10 * 1000
					});
				},
				success : function(result) {
					layer.close(index);
					var context = "";
					var datas = result.data;
					for (var i = 1; i <= datas.length; i++) {
						var data = datas[i - 1];
						context += '<label style="font-size: 24px; font-family: \'楷体\';" for="exampleInputEmail1" >' + i + '.' + data.topContent + '</label><br>';
						context += '<label style="font-size: 22px; font-family: \'楷体\'; padding-left: 5%" for="exampleInputEmail1" >A.' + data.res1 + '</label><br>';
						context += '<label style="font-size: 22px; font-family: \'楷体\'; padding-left: 5%" for="exampleInputEmail1" >B.' + data.res2 + '</label><br>';
						context += '<label style="font-size: 22px; font-family: \'楷体\'; padding-left: 5%" for="exampleInputEmail1" >C.' + data.res3 + '</label><br>';
						if (data.res4 != null) {
							context += '<label style="font-size: 22px; font-family: \'楷体\'; padding-left: 5%" for="exampleInputEmail1" >D.' + data.res4 + '</label><br>';
						}
						context += '<label style="font-size: 22px; font-family: \'楷体\' color:red; padding-left: 85%;" for="exampleInputEmail1" >' + '正确答案:【' + String.fromCharCode(parseInt(data.resTrue) + 64) + '】' + '</label><br>';
					}
					$("#selectTopicView").html(context)
				}
			});
		}
	
	
		function loadJudgeView() {
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/paper/doLoadJudgeTopic",
				traditional : true,
				data : {
					"topicIdList" : registerInfo2.judgeArray
				},
				beforeSend : function() {
					index = layer.load(2, {
						time : 10 * 1000
					});
				},
				success : function(result) {
					layer.close(index);
					var context = "";
					var datas = result.data;
					for (var i = 1; i <= datas.length; i++) {
						var data = datas[i - 1];
						if (data.result == 1) {
							context += '<label style="font-size: 24px; font-family: \'楷体\';" for="exampleInputEmail1" >' + i + '.' + data.topContent + '   （' + '√' + '）</label><br>';
						} else {
							context += '<label style="font-size: 24px; font-family: \'楷体\';" for="exampleInputEmail1" >' + i + '.' + data.topContent + '   （' + '×' + '）</label><br>';
						}
					}
					$("#judgeTopicView").html(context)
				}
			});
		}
	
		$("#completeButton").click(function() {
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/paper/doAddPaper",
				traditional : true,
				data : {
					"teacherId" : "${loginUser.userId}",
					"courseId" : registerInfo1.courseSelect,
					"majorName" : registerInfo1.majorSelect,
					"selectTopic" : registerInfo2.selectArray,
					"judgeTopic" : registerInfo2.judgeArray,
					"paperName" : registerInfo1.paperName
				},
				beforeSend : function() {
					index = layer.load(2, {
						time : 10 * 1000
					});
				},
				success : function(result) {
					layer.close(index);
					if (result.success) {
						layer.msg("添加成功", {
							time : 2000,
							icon : 6,
						}, function() {
							window.sessionStorage.removeItem('paper_step1_info');
							window.sessionStorage.removeItem('paper_step2_info');
							window.location.href = "${APP_PATH}/paper/paperEdit";
						});
					} else {
						layer.msg("添加失败", {
							time : 2000,
							icon : 5,
							shift : 6
						}, function() {});
					}
				}
			});
		});
	</script>
</body>
</html>
