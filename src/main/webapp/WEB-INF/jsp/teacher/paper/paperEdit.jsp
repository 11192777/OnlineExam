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
						<li class="list-group-item "><span><i class="glyphicon glyphicon-ok"></i> 试卷管理 <span class="badge" style="float:right">3</span></span>
							<ul style="margin-top:10px;">
								<li style="height:30px;"><a href="${APP_PATH}/paper/teacher/paperList"><i class="glyphicon glyphicon-lock"></i> 查看试卷</a></li>
								<li style="height:30px;"><a href="${APP_PATH}/paper/paperEdit" style="color: red;"><i class="glyphicon glyphicon-lock"></i> 试卷编辑</a></li>
								<li style="height:30px;"><a href="${APP_PATH}/paper/teacher/importPaper"><i class="glyphicon glyphicon-lock"></i> 导入试卷</a></li>
								<li style="height:30px;"><a href="${APP_PATH}/paper/teacher/paperFavorites"><i class="glyphicon glyphicon-lock"></i> 我的试卷</a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><a href="param.html"><i class="glyphicon glyphicon-list-alt"></i> 参数管理</a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="page-header">
					<h1>试卷添加 - 参数</h1>
				</div>

				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#"><span class="badge">1</span> 配置试卷参数 </a></li>
					<li role="presentation"><a href="#"><span class="badge">2</span> 试卷编辑 </a></li>
					<li role="presentation"><a href="#"><span class="badge">3</span> 试卷预览</a></li>
				</ul>

				<form role="form" style="margin-top:20px;" action="${APP_PATH}/manager/itemBank/itemAdd/step2" method="POST" id="submitForm">
					<div class="form-group">
						<label for="exampleInputEmail1">选择专业</label> <select class="form-control" id="majorSelect">
						</select>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">选择科目</label> <select class="form-control" id="courseSelect">
						</select>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">试卷名称</label> <input type="text" class="form-control" id="paperName" placeholder="请输入试卷名称">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">添加选择题型</label> <select class="form-control" id="haveSelect">
							<option value="1">是</option>
							<option value="0">否</option>
						</select>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">添加判断题型</label> <select class="form-control" id="haveJudge">
							<option value="1">是</option>
							<option value="0">否</option>
						</select>
					</div>
					<hr>
					<button type="button" class="btn btn-success" id="nextButton">下一步</button>
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
		var registerInfo = JSON.parse(sessionStorage.getItem('paper_step1_info'));
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
			var majorContext = '<option value=""> - - - 请选择- - - </option>';
			var courseContext = '<option value=""> - - - 请选择- - - </option>';
			if (registerInfo) {
				$("#haveSelect").val(registerInfo.haveSelect)
				$("#haveJudge").val(registerInfo.haveJudge)
				$("#paperName").val(registerInfo.paperName)
			}
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/manager/itemBank/doGetMajor",
				success : function(result) {
					if (result.success) {
						var majors = result.data;
						for (var i = 0; i < majors.length; i++) {
							var major = majors[i];
							if (registerInfo) {
								if (major.majName == registerInfo.majorSelect) {
									majorContext += '<option value="' + major.majName + '" selected="selected">' + major.majName + '</option>';
									setCourseDefault(major.majName);
								} else {
									majorContext += '<option value="' + major.majName + '">' + major.majName + '</option>';
								}
							} else {
								majorContext += '<option value="' + major.majName + '">' + major.majName + '</option>';
							}
						}
						$("#majorSelect").html(majorContext);
						$("#courseSelect").html(courseContext);
					}
				}
			});
			function setCourseDefault(majorName) {
				courseContext = '<option value=""> - - - 请选择- - - </option>';
				$.ajax({
					type : "POST",
					url : "${APP_PATH}/manager/itemBank/doGetCourse",
					data : {
						"majorName" : majorName
					},
					success : function(result) {
						if (result.success) {
							var courses = result.data;
							for (var i = 0; i < courses.length; i++) {
								var course = courses[i];
								if (course.couId == registerInfo.courseSelect) {
									courseContext += '<option value="' + course.couId + '" selected="selected">' + course.couName + '</option>';
								} else {
									courseContext += '<option value="' + course.couId + '">' + course.couName + '</option>';
								}
							}
							$("#courseSelect").html(courseContext);
						}
					}
				});
			}
			$("#majorSelect").change(function() {
				courseContext = '<option value=""> - - - 请选择- - - </option>';
				$.ajax({
					type : "POST",
					url : "${APP_PATH}/manager/itemBank/doGetCourse",
					data : {
						"majorName" : $("#majorSelect").val()
					},
					success : function(result) {
						if (result.success) {
							var courses = result.data;
							for (var i = 0; i < courses.length; i++) {
								var course = courses[i];
								courseContext += '<option value="' + course.couId + '">' + course.couName + '</option>';
							}
							$("#courseSelect").html(courseContext);
						}
					}
				});
			});
		});
		$("#nextButton").click(function() {
			var obj = {};
			obj.majorSelect = $("#majorSelect").val();
			obj.courseSelect = $("#courseSelect").val();
			obj.haveSelect = $("#haveSelect").val();
			obj.haveJudge = $("#haveJudge").val();
			obj.paperName = $("#paperName").val();
			if (obj.majorSelect == "" || obj.courseSelect == "") {
				layer.msg("存在未选择的项", {
					time : 1000,
					icon : 5,
					shift : 6
				}, function() {})
				return;
			}
			if (obj.paperName == "") {
				layer.msg("请输入试卷名称", {
					time : 1000,
					icon : 5,
					shift : 6
				}, function() {})
				return;
			}
			if (obj.haveSelect == '0' && obj.haveJudge == '0') {
				layer.msg("试卷至少要拥有一种题型", {
					time : 1000,
					icon : 5,
					shift : 6
				}, function() {})
				return;
			}
			sessionStorage.setItem('paper_step1_info', JSON.stringify(obj));
			window.location.href = '${APP_PATH}/paper/paperEdit/step2';
		});
	</script>
</body>
</html>
