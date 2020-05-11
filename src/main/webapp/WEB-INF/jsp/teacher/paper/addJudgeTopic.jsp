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
					</ul>
				</div>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="panel panel-default">

					<div class="panel-heading">
						<h3 class="panel-title">
							<a href="${APP_PATH}/paper/paperEdit/step2" style="color: red;">&lt;&lt;返回</a>
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
							</div>
						</form>
						<button type="button" class="btn btn-success" style="float: right; width: 100px;padding-right: 20px;" id="addTopicButton">
							<i class="glyphicon glyphicon-search"></i> 添加
						</button>
						<br>
						<hr style="clear: both;">
						<div class="table-responsive">
							<table class="table  table-bordered">
								<thead>
									<tr>
										<th width="30">#</th>
										<th width="30"><input type="checkbox" id="selAllBox"></th>
										<th width="85">题号</th>
										<th>题目</th>
										<th style="width: 45px;">操作</th>
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
			pageQuery("", "", "judge")
		});
	
		$("#addTopicButton").click(function() {
			var boxes = $("#dataBody :checked");
			$.each(boxes, function(i, box) {
				registerInfo2.judgeArray.push(box.value)
			});
			layer.msg("添加成功", {
				time : 2000,
				icon : 6,
			}, function() {
				$("#selAllBox").prop("checked", false);
				var that = this;
				var boxes = $("#dataBody :checkbox");
				$.each(boxes, function(i, box) {
					box.checked = that.checked;
				});
			});
			sessionStorage.setItem('paper_step2_info', JSON.stringify(registerInfo2));
		});
	
	
		$("#courseSelect").change(function() {
			var majorSelect = $("#majorSelect").val()
			var courseSelect = $("#courseSelect").val()
			var topicType = "judge"
			pageQuery(majorSelect, courseSelect, topicType)
		});
	
		$("#selAllBox").click(function() {
			var that = this;
			var boxes = $("#dataBody :checkbox");
			$.each(boxes, function(i, box) {
				box.checked = that.checked;
			});
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
						context += '	<td><input type="checkbox" name="topBox" value="' + data.topId + '"></td>';
						context += '	<td>J' + data.topId.toString(16) + '</td>';
						context += '	<td>' + data.topContent + '</td>';
						context += '	<td>';
						context += '		<button type="button" class="btn btn-success btn-xs" onclick="editTopic(\'' + data.topId + '\',\'' + topicType + '\')">';
						context += '			<i class=" glyphicon glyphicon-check"></i>';
						context += '		</button>';
						context += '	</td>';
						context += '</tr>';
					}
					$("#dataBody").html(context);
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
