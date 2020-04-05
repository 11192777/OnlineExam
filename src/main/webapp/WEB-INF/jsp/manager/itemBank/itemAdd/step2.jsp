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
								<li style="height:30px;"><a href="auth_cert.html"><i class="glyphicon glyphicon-check"></i> 学生成绩查看</a></li>
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
					<h1>试题添加 - 编辑</h1>
				</div>

				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation"><a href="#"><span class="badge">1</span> 配置试题参数 </a></li>
					<li role="presentation" class="active"><a href="#"><span class="badge">2</span> 编辑试题 </a></li>
					<li role="presentation"><a href="#"><span class="badge">3</span> 试题预览</a></li>
				</ul>

				<form role="form" style="margin-top:20px;" action="${APP_PATH}/manager/itemBank/itemAdd/step3" method="post" id="submitForm">
					<div class="form-group">
						<label for="exampleInputEmail1">题目</label> <input type="text" class="form-control" id="topicContent" placeholder="请输入题目内容">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">选项个数</label> <select class="form-control" id="selectSum">
							<option value="3">3</option>
							<option value="4">4</option>
						</select>
					</div>
					<div id="editForm"></div>
					<div class="form-group">
						<label for="exampleInputEmail1">正确选项</label> <select class="form-control" id=trueSelect>
						</select>
					</div>
					<hr>
					<button type="button" id="lastButton" class="btn btn-default">上一步</button>
					<button type="button" id="nextButton" class="btn btn-success">下一步</button>
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
		var registerInfo = JSON.parse(sessionStorage.getItem('step2_info'));
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
			if (registerInfo) {
				$("#topicContent").val(registerInfo.topicContent)
				$("#selectSum").val(registerInfo.selectSum)
			}
			$("#selectSum").change();
		});
		$("#selectSum").change(function() {
			var selectSumContext = "";
			var trueSelectContext = "";
			for (var i = 1; i <= $("#selectSum").val(); i++) {
				if (registerInfo) {
					if (registerInfo.trueSelect == i) {
						trueSelectContext += '<option value="' + i + '" selected="selected">' + i + '</option>';
					} else {
						trueSelectContext += '<option value="' + i + '">' + i + '</option>';
					}
					if ($("#selectSum").val() == 4 && registerInfo.resultArr.length == 3 && i == 4) {
						selectSumContext += '<div class="form-group"><label for="exampleInputEmail1">选项' + i + '</label> <input type="text" class="form-control" id="result' + i + '" placeholder="编辑选项' + i + '内容"></div>';
					} else {
						selectSumContext += '<div class="form-group"><label for="exampleInputEmail1">选项' + i + '</label> <input type="text" value="' + registerInfo.resultArr[i - 1] + '" class="form-control" id="result' + i + '" placeholder="编辑选项' + i + '内容"></div>';
					}
				} else {
					selectSumContext += '<div class="form-group"><label for="exampleInputEmail1">选项' + i + '</label> <input type="text" class="form-control" id="result' + i + '" placeholder="编辑选项' + i + '内容"></div>';
					trueSelectContext += '<option value="' + i + '">' + i + '</option>';
				}
			}
			$("#editForm").html(selectSumContext);
			$("#trueSelect").html(trueSelectContext)
		});
	
		$("#nextButton").click(function() {
			if ($("#topicContent").val() != "" && $("#selectSum").val() != "" && $("#trueSelect").val() != "") {
				var flag = true;
				for (var i = 0; i < $("#selectSum").val(); i++) {
					if ($("#result" + (i + 1)).val() == "") {
						flag = false;
					}
				}
				if (flag == true) {
					saveInfo();
					window.location.href = '${APP_PATH}/manager/itemBank/itemAdd/step3';
					return
				}
			}
			layer.msg("存在未选择的项", {
				time : 1000,
				icon : 5,
				shift : 6
			}, function() {})
		});
	
		$("#lastButton").click(function() {
			saveInfo();
			window.location.href = '${APP_PATH}/manager/itemBank/itemAdd';
		});
	
		function saveInfo() {
			var obj = {};
			obj.topicContent = $("#topicContent").val();
			obj.selectSum = $("#selectSum").val();
			obj.trueSelect = $("#trueSelect").val();
			var resultArr = new Array();
			for (var i = 0; i < $("#selectSum").val(); i++) {
				resultArr[i] = $("#result" + (i + 1)).val();
			}
			obj.resultArr = resultArr;
			sessionStorage.setItem('step2_info', JSON.stringify(obj));
		}
	</script>
</body>
</html>
