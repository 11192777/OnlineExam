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
						<li class="list-group-item "><span><i class="glyphicon glyphicon glyphicon-tasks"></i> 学生管理<span class="badge" style="float:right">3</span></span>
							<ul style="margin-top:10px;">
								<li style="height:30px;"><a href="${APP_PATH}/class/classList" style="color: red;"><i class="glyphicon glyphicon-king"></i> 班级管理 </a></li>
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
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="glyphicon glyphicon-th"></i> 班级列表
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-inline" role="form" style="float: left;">
							<div class="form-group has-feedback">
								<div class="input-group">
									<div class="input-group-addon">查询班级</div>
									<input class="form-control has-success" id="queryText" type="text" placeholder="输入班级名称">
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
										<th>创建时间</th>
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
	<div class="modal fade" id="createFileMModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="createFileTitle">添加班级</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="fileName" class="col-form-label">班级名称</label> <input type="text" autofocus class="form-control" id="className">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="createFileSureBut">确定</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="createFileMModal2" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="createFileTitle">班级名称修改</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="fileName" class="col-form-label">新的班级名称</label> <input type="text" autofocus class="form-control" id="fileName2">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" id="createFileSureBut2">修改</button>
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
				url : "${APP_PATH}/course/courseList/doGetMajor",
				success : function(result) {
					if (result.success) {
						var majors = result.data;
						for (var i = 0; i < majors.length; i++) {
							var major = majors[i];
							majorContext += '<option value="' + major.majName + '">' + major.majName + '</option>';
						}
						$("#majorSelect").html(majorContext);
						$("#majorSelect2").html(majorContext);
					} else {
						layer.msg("页面加载失败", {
							time : 2000,
							icon : 5,
							shift : 6
						}, function() {});
					}
	
				}
			});
			pageQuery();
		})
	
		function ShowCreateModal(title) {
			$("#createFileTitle").text(title);
			$('#createFileMModal').modal('show');
		}
	
		function ShowCreateModal2(title) {
			$("#createFileTitle2").text(title);
			$('#createFileMModal2').modal('show');
		}
	
		$("#createFileSureBut").click(function() {
			var courseName = $("#className").val();
			if (courseName == "") {
				layer.msg("请输入班级名称", {
					time : 2000,
					icon : 5,
					shift : 6
				}, function() {});
				return;
			}
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/class/classList/doAddClass",
				data : {
					"className" : courseName,
					"teacherId" : "${loginUser.userId}"
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
							pageQuery();
							$("#createFileMModal").modal("hide");
						});
					} else {
						layer.msg("添加失败,请尝试重新添加", {
							time : 2000,
							icon : 5,
							shift : 6
						}, function() {});
					}
				}
			});
		});
	
		function deleteClass(classId) {
			layer.confirm("您确认要解散该班级吗？ ", {
				icon : 3,
				title : '提示'
			}, function(cindex) {
				$.ajax({
					type : "POST",
					url : "${APP_PATH}/class/classList/doDeleteClass",
					data : {
						"classId" : classId,
						"type" : "force"
					},
					beforeSend : function() {
						index = layer.load(2, {
							time : 10 * 1000
						});
					},
					success : function(result) {
						layer.close(index);
						if (result.success) {
							layer.msg("已成功解散该班级", {
								time : 2000,
								icon : 6,
							}, function() {
								pageQuery();
							});
						} else {
							layer.msg("解散失败，请重新尝试", {
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
				url : "${APP_PATH}/class/classList/doPageQuery",
				data : {
					"queryText" : queryText,
					"teacherId" : "${loginUser.userId}"
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
							context += '	<td>' + data.claName + '</td>';
							context += '	<td>' + data.createTime + '</td>';
							context += '	<td>';
							context += '		<button type="button" class="btn btn-primary btn-xs" onclick="editClass(\''
								+ data.claId + '\')">';
							context += '			<i class=" glyphicon glyphicon-pencil"></i>';
							context += '		</button>';
							context += '		<button type="button" class="btn btn-danger btn-xs" onclick="deleteClass(\''
								+ data.claId + '\')">';
							context += '			<i class=" glyphicon glyphicon-remove"></i>';
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
	
		var editCourseId = "";
	
		function editClass(classId) {
			ShowCreateModal2()
			editCourseId = classId;
		}
		$("#createFileSureBut2").click(function() {
			var courseName = $("#fileName2").val();
			if (courseName == "") {
				layer.msg("请输入新的班级名称", {
					time : 2000,
					icon : 5,
					shift : 6
				}, function() {});
				return;
			}
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/class/classList/doEditClass",
				data : {
					"claId" : editCourseId,
					"claName" : $("#fileName2").val()
				},
				beforeSend : function() {
					index = layer.load(2, {
						time : 10 * 1000
					});
				},
				success : function(result) {
					layer.close(index);
					if (result.success) {
						layer.msg("修改成功", {
							time : 2000,
							icon : 6,
						}, function() {
							pageQuery();
							$("#createFileMModal2").modal("hide");
						});
					} else {
						layer.msg("修改失败", {
							time : 2000,
							icon : 5,
							shift : 6
						}, function() {});
					}
				}
			});
		});
	
		$("#queryButton").click(function() {
			pageQuery($("#queryText").val())
		});
	</script>
</body>
</html>
