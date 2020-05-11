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
						<li class="list-group-item tree-closed"><span><i class="glyphicon glyphicon glyphicon-user"></i> 用户管理 <span class="badge" style="float:right">2</span></span>
							<ul style="margin-top:10px;display:none;">
								<li style="height:30px;"><a href="${APP_PATH}/student/studentList"><i class="glyphicon glyphicon-user"></i> 学生管理</a></li>
								<li style="height:30px;"><a href="${APP_PATH}/teacher/teacherList"><i class="glyphicon glyphicon-king"></i> 教师管理</a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><span><i class="glyphicon glyphicon-ok"></i> 试卷管理 <span class="badge" style="float:right">2</span></span>
							<ul style="margin-top:10px;display:none;">
								<li style="height:30px;"><a href="${APP_PATH}/paper/paperList"><i class="glyphicon glyphicon-check"></i> 试卷列表</a></li>
								<li style="height:30px;"><a href="${APP_PATH}/paper/importPaper"><i class="glyphicon glyphicon-check"></i> 导入试卷</a></li>
							</ul></li>
						<li class="list-group-item "><span><i class="glyphicon glyphicon-ok"></i> 题库管理 <span class="badge" style="float:right">2</span></span>
							<ul style="margin-top:10px;">
								<li style="height:30px;"><a href="${APP_PATH}/manager/itemBank/itemList"><i class="glyphicon glyphicon-check"></i> 试题列表</a></li>
								<li style="height:30px;"><a href="${APP_PATH}/manager/itemBank/itemAdd" style="color: red;"><i class="glyphicon glyphicon-check"></i> 添加试题</a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><span><i class="glyphicon glyphicon-ok"></i> 成绩管理 <span class="badge" style="float:right">2</span></span>
							<ul style="margin-top:10px;display:none;">
								<li style="height:30px;"><a href="${APP_PATH}/grade/allGrade"><i class="glyphicon glyphicon-check"></i> 学生成绩查看</a></li>
								<li style="height:30px;"><a href="auth_adv.html"><i class="glyphicon glyphicon-check"></i> 成绩单打印</a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><span><i class="glyphicon glyphicon-ok"></i> 学年管理 <span class="badge" style="float:right">2</span></span>
							<ul style="margin-top:10px;display:none;">
								<li style="height:30px;"><a href="${APP_PATH}/major/majorList"><i class="glyphicon glyphicon-check"></i> 专业管理</a></li>
								<li style="height:30px;"><a href="${APP_PATH}/class/managerClassList"><i class="glyphicon glyphicon-check"></i> 班级管理</a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><span><i class="glyphicon glyphicon-th-large"></i> 学科管理 <span class="badge" style="float:right">1</span></span>
							<ul style="margin-top:10px;display:none;">
								<li style="height:30px;"><a href="${APP_PATH}/course/courseList"><i class="glyphicon glyphicon-picture"></i> 科目管理</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="page-header">
					<h1>试题添加 - 参数</h1>
				</div>

				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#"><span class="badge">1</span> 配置试题参数 </a></li>
					<li role="presentation"><a href="#"><span class="badge">2</span> 编辑试题 </a></li>
					<li role="presentation"><a href="#"><span class="badge">3</span> 试题预览</a></li>
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
						<label for="exampleInputEmail1">选择试题类型</label> <select class="form-control" id="topicType">
							<option value="">- - - 请选择- - -</option>
							<option value="select">选择题</option>
							<option value="judge">判断题</option>
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
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/manager/itemBank/doGetMajor",
				success : function(result) {
					var registerInfo = JSON.parse(sessionStorage.getItem('step1_info'));
					if (result.success) {
						var majors = result.data;
						for (var i = 0; i < majors.length; i++) {
							var major = majors[i];
							if (registerInfo) {
								if (major.majName == registerInfo.majorSelect) {
									majorContext += '<option value="' + major.majName + '" selected="selected">' + major.majName + '</option>';
									$("#topicType").val(registerInfo.topicType)
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
							var registerInfo = JSON.parse(sessionStorage.getItem('step1_info'));
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
			obj.topicType = $("#topicType").val();
			obj.courseSelect = $("#courseSelect").val();
			if (obj.majorSelect == "" || obj.topicType == "" || obj.courseSelect == "") {
				layer.msg("存在未选择的项", {
					time : 1000,
					icon : 5,
					shift : 6
				}, function() {})
				return;
			}
			sessionStorage.setItem('step1_info', JSON.stringify(obj));
			if ($("#topicType").val() == "select") {
				window.location.href = '${APP_PATH}/manager/itemBank/itemAdd/step2';
			} else {
				window.location.href = '${APP_PATH}/manager/itemBank/itemAdd/judeStep2';
			}
		});
	</script>
</body>
</html>
