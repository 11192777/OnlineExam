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
<style>
.tree li {
	list-style-type: none;
	cursor: pointer;
}

table tbody tr:nth-child(odd) {
	background: #F4F4F4;
}

table tbody td:nth-child(even) {
	color: #C00;
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
								<li style="height:30px;"><a href="${APP_PATH}/manager/itemBank/itemList" style="color: red;"><i class="glyphicon glyphicon-check"></i> 试题列表</a></li>
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
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="glyphicon glyphicon-th"></i> 学生列表
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-inline" role="form" style="float: left;">
							<div class="form-group has-feedback">
								<div class="input-group">
									<div class="input-group-addon">选择专业</div>
									<select class="form-control" id="majorSelect" style="padding-right: 20px">
									</select>
								</div>
								<div class="input-group" style="padding-left: 100px;padding-right: 40px;">
									<div class="input-group-addon ">选择学科</div>
									<select class="form-control" id="courseSelect" style="padding-right: 20px">
									</select>
								</div>
								<div class="input-group" style="padding-left: 100px;padding-right: 40px;">
									<div class="input-group-addon">选择题型</div>
									<select class="form-control" id="topicType" style="padding-right: 20px">
										<option value="select">选择题</option>
										<option value="judge">判断题</option>
									</select>
								</div>
							</div>
						</form>
						<button type="button" class="btn btn-warning" style="float: right; width: 100px;padding-right: 20px;" id="queryButton">
							<i class="glyphicon glyphicon-search"></i> 查询
						</button>
						<br>
						<hr style="clear: both;">
						<div class="table-responsive">
							<table class="table  table-bordered">
								<thead>
									<tr>
										<th width="30">#</th>
										<th width="85">题号</th>
										<th>题目</th>
										<th style="width: 70px;">操作</th>
									</tr>
								</thead>
								<tbody id="dataBody"></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="createFileMModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="padding-top: 10%;">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="createFileTitle1">试题信息查看</h5>
				</div>
				<div id="topicView"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" id="backButton">返回</button>
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
			var majorContext = '<option value=""> - - - 请选择- - - </option>';
			var courseContext = '<option value=""> - - - 请选择- - - </option>';
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/manager/itemBank/doGetMajor",
				success : function(result) {
					if (result.success) {
						var majors = result.data;
						for (var i = 0; i < majors.length; i++) {
							var major = majors[i];
							majorContext += '<option value="' + major.majName + '">' + major.majName + '</option>';
						}
						$("#majorSelect").html(majorContext);
						$("#courseSelect").html(courseContext);
					}
				}
			});
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
			$("#queryButton").click();
		});
	
		$("#queryButton").click(function() {
			var majorSelect = $("#majorSelect").val()
			var courseSelect = $("#courseSelect").val()
			var topicType = $("#topicType").val()
			pageQuery(majorSelect, courseSelect, topicType)
		});
	
		function pageQuery(majorSelect, courseSelect, topicType) {
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/manager/itemBank/doPageQuery",
				data : {
					"majorName" : majorSelect,
					"courseId" : courseSelect,
					"topicType" : topicType
				},
				beforeSend : function() {
					index = layer.load(2, {
						time : 10 * 1000
					});
				},
				success : function(result) {
					layer.close(index);
					var datas = result.data;
					var context = ""
					for (var i = 0; i < datas.length; i++) {
						var data = datas[i];
						context += '<tr>';
						context += '	<td>' + (i + 1) + '</td>';
						if (topicType == 'select') {
							context += '	<td>S' + data.topId.toString(16) + '</td>';
						} else if (topicType == "judge") {
							context += '	<td>J' + data.topId.toString(16) + '</td>';
						}
						context += '	<td>' + data.topContent + '</td>';
						context += '	<td>';
						context += '		<button type="button" class="btn btn-success btn-xs" onclick="editTopic(\'' + data.topId + '\',\'' + topicType + '\')">';
						context += '			<i class=" glyphicon glyphicon-check"></i>';
						context += '		</button>';
						context += '		<button type="button" class="btn btn-danger btn-xs" onclick="deleteTopic(\''
							+ data.topId + '\',\'' + topicType + '\')">';
						context += '			<i class=" glyphicon glyphicon-remove"></i>';
						context += '		</button>';
						context += '	</td>';
						context += '</tr>';
					}
					$("#dataBody").html(context);
				}
			});
		}
	
		function deleteTopic(topicId, topicType) {
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/manager/itemBank/doDeleteTopic",
				data : {
					"topicId" : topicId,
					"topicType" : topicType
				},
				beforeSend : function() {
					index = layer.load(2, {
						time : 10 * 1000
					});
				},
				success : function(result) {
					layer.close(index);
					layer.msg("删除成功", {
						time : 2000,
						icon : 6,
						shift : 5
					}, function() {})
					$("#queryButton").click();
				}
			});
		}
	
		function editTopic(topicId, topicType) {
			var topicContext = "";
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/manager/itemBank/itemList/doItemShow",
				data : {
					"topicId" : topicId,
					"topicType" : topicType
				},
				beforeSend : function() {
					index = layer.load(2, {
						time : 10 * 1000
					});
				},
				success : function(result) {
					layer.close(index);
					var data = result.data
					if (topicType == "select") {
						topicContext += '<label style="font-size: 20px; font-family: \'楷体\'; padding-left : 5%" for="exampleInputEmail1" >' + data.topContent + '（　' + String.fromCharCode(parseInt(data.resTrue) + 64) + '　）</label><br>';
						topicContext += '<label style="font-size: 16px; font-family: \'楷体\'; padding-left : 10%" for="exampleInputEmail1" >' + String.fromCharCode(65) + '.' + data.res1 + '</label><br>';
						topicContext += '<label style="font-size: 16px; font-family: \'楷体\'; padding-left : 10%" for="exampleInputEmail1" >' + String.fromCharCode(66) + '.' + data.res2 + '</label><br>';
						topicContext += '<label style="font-size: 16px; font-family: \'楷体\'; padding-left : 10%" for="exampleInputEmail1" >' + String.fromCharCode(67) + '.' + data.res3 + '</label><br>';
						if (data.res4 != null) {
							topicContext += '<label style="font-size: 16px; font-family: \'楷体\'; padding-left: 10%" for="exampleInputEmail1" >' + String.fromCharCode(68) + '.' + data.res4 + '</label><br>';
						}
						$("#topicView").html(topicContext);
					} else if (topicType == "judge") {
	
					}
				}
			});
			$('#createFileMModal').modal('show');
		}
		$("#backButton").click(function() {
			$('#createFileMModal').modal('hide');
		})
	</script>
</body>
</html>
