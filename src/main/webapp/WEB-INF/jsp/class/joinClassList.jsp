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
						<li class="list-group-item "><span><i class="glyphicon glyphicon glyphicon-tasks"></i> 班级管理<span class="badge" style="float:right">3</span></span>
							<ul style="margin-top:10px;">
								<li style="height:30px;"><a href="${APP_PATH}/class/studentClassList"><i class="glyphicon glyphicon-king">加入班级</i> </a></li>
								<li style="height:30px;"><a href="${APP_PATH}/student/studentJoinList" style="color: red;"><i class="glyphicon glyphicon-lock"></i> 退出班级</a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><span><i class="glyphicon glyphicon-ok"></i> 考试管理<span class="badge" style="float:right">3</span></span>
							<ul style="margin-top:10px;display:none;">
								<li style="height:30px;"><a href="${APP_PATH}/exam/student/getPost"><i class="glyphicon glyphicon-check"></i>个人考试信息</a></li>
								<li style="height:30px;"><a href="${APP_PATH}/grade/myGrade"><i class="glyphicon glyphicon-check"></i> 查看个人成绩</a></li>
							</ul></li>
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
									<div class="input-group-addon">查询学生</div>
									<input class="form-control has-success" id="queryText" type="text" placeholder="输入学生账号">
								</div>
							</div>
							<button type="button" class="btn btn-warning" id="queryButton">
								<i class="glyphicon glyphicon-search"></i> 查询
							</button>
						</form>
						<button type="button" class="btn btn-primary" style="float: right;" onclick="ShowCreateModal()">
							<i class="glyphicon glyphicon-plus"></i> 新增
						</button>
						<br>
						<hr style="clear: both;">
						<div class="table-responsive">
							<table class="table  table-bordered">
								<thead>
									<tr>
										<th width="30">#</th>
										<th>班级编号</th>
										<th>班级名称</th>
										<th>所属教师</th>
										<th>加入时间</th>
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
			pageQuery();
		})
	
	
		var index = 0;
		function joinClass(classId) {
			layer.confirm("您确认要退出编号为[" + classId + "] 的班级吗？", {
				icon : 3,
				title : '提示'
			}, function(cindex) {
				$.ajax({
					type : "POST",
					url : "${APP_PATH}/class/studentClassList/doQuitClass",
					data : {
						"classId" : classId,
						"studentId" : "${loginUser.userId}"
					},
					beforeSend : function() {
						index = layer.load(2, {
							time : 10 * 1000
						});
					},
					success : function(result) {
						layer.close(index);
						if (result.success) {
							layer.msg("退出班级成功", {
								time : 2000,
								icon : 6,
							}, function() {
								pageQuery();
							});
						} else {
							layer.msg("退出班级失败", {
								time : 2000,
								icon : 5,
								shift : 6
							}, function() {});
						}
					}
				});
				layer.close(cindex);
			}, function(cindex) {
				layer.close(cindex);
			});
		}
	
		function pageQuery(queryText) {
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/class/studentClassList/doJoinList",
				data : {
					"studentId" : "${loginUser.userId}",
					"queryText" : queryText
				},
				beforeSend : function() {
					index = layer.load(2, {
						time : 10 * 1000
					});
				},
				success : function(result) {
					layer.close(index);
					if (result.success) {
						var datas = result.data;
						var context = ""
						for (var i = 0; i < datas.length; i++) {
							var data = datas[i];
							context += '<tr>';
							context += '	<td>' + (i + 1) + '</td>';
							context += '	<td>' + data.claId + '</td>';
							context += '	<td>' + data.classBean.claName + '</td>';
							context += '	<td>' + data.classBean.teaId + '</td>';
							context += '	<td>' + data.joinTime + '</td>';
							context += '	<td>';
							context += '		<button type="button" class="btn btn-primary btn-xs" onclick="joinClass(\''
								+ data.claId + '\')">';
							context += '			<i class=" glyphicon glyphicon-pencil"></i>';
							context += '		</button>';
							context += '	</td>';
							context += '</tr>';
						}
						$("#dataBody").html(context);
					} else {
						layer.msg("页面加载失败", {
							time : 2000,
							icon : 5,
							shift : 6
						}, function() {});
					}
				}
			});
		}
	
		$("#queryButton").click(function() {
			pageQuery($("#queryText").val())
		});
	</script>
</body>
</html>
