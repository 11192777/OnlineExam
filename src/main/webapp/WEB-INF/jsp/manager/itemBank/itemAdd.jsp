<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/main.css">
<link rel="stylesheet" href="${APP_PATH}/css/doc.min.css">
<style>
.tree li {
	list-style-type: none;
	cursor: pointer;
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
						<li class="list-group-item "><span><i class="glyphicon glyphicon-ok"></i> 题库管理 <span class="badge" style="float:right">3</span></span>
							<ul style="margin-top:10px;">
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
				<ol class="breadcrumb">
					<li><a href="#">权限管理</a></li>
					<li><a href="#">用户维护</a></li>
					<li class="active">新增</li>
				</ol>
				<div class="panel panel-default">
					<div class="panel-heading">
						表单数据
						<div style="float: right; cursor: pointer;" data-toggle="modal" data-target="#myModal">
							<i class="glyphicon glyphicon-question-sign"></i>
						</div>
					</div>
					<div class="panel-body">
						<form role="form">
							<div class="form-group">
								<label for="exampleInputPassword1">题目</label> <input type="text" class="form-control" autofocus="autofocus" id="userId" placeholder="请输入登陆账号">
								<p class="help-block label label-warning">用户名有4-10位字母和数字组成，请输入正确的用户名</p>
							</div>
							<div class="form-group">
								<p class="help-block label label-warning">默认密码为：123456，请提示学生修密码</p>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">姓名</label> <input type="text" class="form-control" autofocus="autofocus" id="username" placeholder="请输入学生姓名">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">性别</label> <select class="form-control" id="sex">
									<option value="男">男</option>
									<option value="女">女</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">专业</label> <select class="form-control" id="majorSelect">
								</select>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">年级</label> <select class="form-control" id="grade">
									<option value="2015">2015</option>
									<option value="2016">2016</option>
									<option value="2017">2017</option>
									<option value="2018">2018</option>
									<option value="2019">2019</option>
								</select>
							</div>
							<button type="button" class="btn btn-success" id="insertButton">
								<i class="glyphicon glyphicon-plus"></i> 新增
							</button>
							<button type="button" class="btn btn-danger">
								<i class="glyphicon glyphicon-refresh" id="resetButton"></i> 重置
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">帮助</h4>
				</div>
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
			
			var majorContext = "";
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/student/studentList/doGetMajor",
				success : function(result) {
					if (result.success) {
						var majors = result.data;
						for (var i = 0; i < majors.length; i++) {
							var major = majors[i];
							majorContext += '<option value="' + major.majName + '">' + major.majName + '</option>';
						}
						$("#majorSelect").html(majorContext);
					} 
				}
			});
			
			var classContext = "";
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/student/studentList/doGetClass",
				success : function(result) {
					if (result.success) {
						var majors = result.data;
						for (var i = 0; i < majors.length; i++) {
							var major = majors[i];
							majorContext += '<option value="' + major.claName + '">' + major.claName + '</option>';
						}
						$("#classSelect").html(classContext);
					} 
				}
			});
	
			$("#resetButton").click(function() {
				$("#username")[0].reset();
				$("#password")[0].reset();
			});
	
			$("#insertButton").click(function() {
				var userId = $("#userId").val()
				var username = $("#username").val()
				var sex = $("#sex").val()
				var major = $("#majorSelect").val()
				var grade = $("#grade").val()
				
				if (userId == "") {
					layer.msg("账号不为空", {time : 1000,icon : 5,shift : 6
					}, function() {
						$("#userId").focus();
					}) 
					return;
				}else if (!userIdVerify(userId)){
					layer.msg("账号格式错误", {time : 1000,icon : 5,shift : 6
						}, function() {
							$("#userId").focus();
					}) 
					return;
				}
				
				var index = 0;
				$.ajax({
					type : "POST",
					url : "${APP_PATH}/student/studentList/doAddStudent",
					data : {
						"userId" : userId,
						"stuName" : username,
						"stuSex" : sex,
						"stuMajor" : major,
						"stuGrade" : grade,
					},
					beforeSend : function() {
						index = layer.load(2, { time : 10 * 1000});
					},
					success : function(result) {
						layer.close(index);
						if (result.success) {
							layer.msg("添加成功", {time : 1000,icon : 6,shift : 5
							}, function() {
								window.location.href = "${APP_PATH}/student/studentList"
							})
						} else {
							layer.msg("添加失败", {time : 1000,icon : 5,shift : 6
							}, function() {})
						}
					}
				});
			});
		});
		
		function userIdVerify(userid) {
			let reg = /^[0-9a-zA-Z]{4,10}$/;
			return reg.test(userid);
		}
	</script>
</body>
</html>
