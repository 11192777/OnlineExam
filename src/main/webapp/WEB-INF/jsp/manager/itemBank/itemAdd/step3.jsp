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
						<li class="list-group-item tree-closed"><span><i class="glyphicon glyphicon glyphicon-user"></i> 用户管理 <span class="badge" style="float:right">3</span></span>
							<ul style="margin-top:10px;display:none;">
								<li style="height:30px;"><a href="${APP_PATH}/student/studentList"><i class="glyphicon glyphicon-user"></i> 学生管理</a></li>
								<li style="height:30px;"><a href="${APP_PATH}/teacher/teacherList"><i class="glyphicon glyphicon-king"></i> 教师管理</a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><span><i class="glyphicon glyphicon-ok"></i> 试卷管理 <span class="badge" style="float:right">3</span></span>
							<ul style="margin-top:10px;display:none;">
								<li style="height:30px;"><a href="${APP_PATH}/paper/paperList"><i class="glyphicon glyphicon-check"></i> 试卷列表</a></li>
								<li style="height:30px;"><a href="${APP_PATH}/paper/importPaper"><i class="glyphicon glyphicon-check"></i> 导入试卷</a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><span><i class="glyphicon glyphicon-ok"></i> 题库管理 <span class="badge" style="float:right">3</span></span>
							<ul style="margin-top:10px;display:none;">
								<li style="height:30px;"><a href="${APP_PATH}/manager/itemBank/itemList"><i class="glyphicon glyphicon-check"></i> 试题列表</a></li>
								<li style="height:30px;"><a href="${APP_PATH}/manager/itemBank/itemAdd"><i class="glyphicon glyphicon-check"></i> 添加试题</a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><span><i class="glyphicon glyphicon-ok"></i> 成绩管理 <span class="badge" style="float:right">3</span></span>
							<ul style="margin-top:10px;display:none;">
								<li style="height:30px;"><a href="${APP_PATH}/grade/allGrade"><i class="glyphicon glyphicon-check"></i> 学生成绩查看</a></li>
								<li style="height:30px;"><a href="auth_adv.html"><i class="glyphicon glyphicon-check"></i> 成绩单打印</a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><span><i class="glyphicon glyphicon-ok"></i> 学年管理 <span class="badge" style="float:right">3</span></span>
							<ul style="margin-top:10px;display:none;">
								<li style="height:30px;"><a href="${APP_PATH}/major/majorList"><i class="glyphicon glyphicon-check"></i> 专业管理</a></li>
								<li style="height:30px;"><a href="${APP_PATH}/class/managerClassList"><i class="glyphicon glyphicon-check"></i> 班级管理</a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><span><i class="glyphicon glyphicon-th-large"></i> 学科管理 <span class="badge" style="float:right">7</span></span>
							<ul style="margin-top:10px;display:none;">
								<li style="height:30px;"><a href="${APP_PATH}/course/courseList"><i class="glyphicon glyphicon-picture"></i> 科目管理</a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><a href="param.html"><i class="glyphicon glyphicon-list-alt"></i> 参数管理</a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="page-header">
					<h1>试题添加 - 预览</h1>
				</div>

				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation"><a href="#"><span class="badge">1</span> 配置试题参数 </a></li>
					<li role="presentation"><a href="#"><span class="badge">2</span> 编辑试题 </a></li>
					<li role="presentation" class="active"><a href="#"><span class="badge">3</span> 试题预览</a></li>
				</ul>

				<form role="form" style="margin-top:20px;">
					<div style="background-color: rgb(239, 228, 176);" id="topicView"></div>
					<hr>
					<button type="button" onclick="window.location.href='${APP_PATH}/manager/itemBank/itemAdd/step2'" class="btn btn-default">上一步</button>
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
		var registerInfo1 = JSON.parse(sessionStorage.getItem('step1_info'));
		var registerInfo2 = JSON.parse(sessionStorage.getItem('step2_info'));
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
			var topicViewContext = "";
			topicViewContext += '<label style="font-size: 24px; font-family: \'楷体\';" for="exampleInputEmail1" >#.' + registerInfo2.topicContent + '（　' + String.fromCharCode(parseInt(registerInfo2.trueSelect) + 64) + '　）</label><br>';
			for (var i = 0; i < registerInfo2.resultArr.length; i++) {
				topicViewContext += '<label style="font-size: 22px; font-family: \'楷体\'; padding-left: 5%" for="exampleInputEmail1" >' + String.fromCharCode(i + 65) + '.' + registerInfo2.resultArr[i] + '</label><br>';
			}
			$("#topicView").html(topicViewContext);
		});
		$("#completeButton").click(function() {
			var jsonData = {};
			jsonData.topContent = registerInfo2.topicContent;
			jsonData.couId = registerInfo1.courseSelect;
			jsonData.majName = registerInfo1.majorSelect;
			jsonData.resTrue = registerInfo2.trueSelect;
			jsonData.res1 = registerInfo2.resultArr[0];
			jsonData.res2 = registerInfo2.resultArr[1];
			jsonData.res3 = registerInfo2.resultArr[2];
			jsonData.res4 = registerInfo2.resultArr[3];
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/manager/itemBank/itemAdd/doAddSelectItem",
				data : jsonData,
				beforeSend : function() {
					index = layer.load(2, {
						time : 10 * 1000
					});
				},
				success : function(result) {
					layer.close(index);
					if (result.success) {
						layer.msg("添加成功", {
							time : 1000,
							icon : 6,
							shift : 5
						}, function() {
							window.sessionStorage.removeItem('step2_info');
							window.location.href = "${APP_PATH}/manager/itemBank/itemAdd";
						})
					} else {
						layer.msg("添加失败", {
							time : 1000,
							icon : 5,
							shift : 6
						}, function() {})
					}
				}
			});
		});
	</script>
</body>
</html>
