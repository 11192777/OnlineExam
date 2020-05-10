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
						<li class="list-group-item "><span><i class="glyphicon glyphicon-ok"></i> 学年管理 <span class="badge" style="float:right">3</span></span>
							<ul style="margin-top:10px;">
								<li style="height:30px;"><a href="${APP_PATH}/major/majorList" style="color: red;"><i class="glyphicon glyphicon-check"></i> 专业管理</a></li>
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
										<th>专业名称</th>
										<th>联系方式</th>
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
					<h5 class="modal-title" id="createFileTitle">添加专业</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="fileName" class="col-form-label">专业名称</label> <input type="text" autofocus class="form-control" id="majorName">
						</div>
						<div class="form-group">
							<label for="fileName" class="col-form-label">联系方式</label> <input type="text" autofocus class="form-control" id="majorPhone">
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
					<h5 class="modal-title" id="createFileTitle">学科信息修改</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="fileName" class="col-form-label">学科名</label> <input type="text" autofocus class="form-control" id="majorName2">
						</div>
						<div class="form-group">
							<label for="fileName" class="col-form-label">联系方式</label> <input type="text" autofocus class="form-control" id="majorPhone2">
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
		var oldMajorName = "";
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
		});
	
		function ShowCreateModal(title) {
			$("#createFileTitle").text(title);
			$('#createFileMModal').modal('show');
		}
		function ShowCreateModal2(title) {
			$("#createFileTitle2").text(title);
			$('#createFileMModal2').modal('show');
		}
	
		$("#createFileSureBut").click(function() {
			var majorPhone = $("#majorPhone").val();
			var majorName = $("#majorName").val();
			if (majorName == "") {
				layer.msg("请输入专业名称", {
					time : 2000,
					icon : 5,
					shift : 6
				}, function() {});
				return;
			}
			if (!phoneNumberVerify(majorPhone)) {
				layer.msg("请输入正确的手机号码", {
					time : 2000,
					icon : 5,
					shift : 6
				}, function() {});
				return;
			}
	
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/major/majorList/doAddMajor",
				data : {
					"majName" : majorName,
					"majPhone" : majorPhone
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
						layer.msg("添加失败，该专业可能已经存在", {
							time : 2000,
							icon : 5,
							shift : 6
						}, function() {});
					}
				}
			});
		});
	
		$("#createFileSureBut2").click(function() {
			var majorName = $("#majorName2").val();
			var majorPhone = $("#majorPhone2").val();
			if (majorName == "") {
				layer.msg("请输入学科名称", {
					time : 2000,
					icon : 5,
					shift : 6
				}, function() {});
				return;
			}
			if (!phoneNumberVerify(majorPhone)) {
				layer.msg("请输入正确的手机号码", {
					time : 2000,
					icon : 5,
					shift : 6
				}, function() {});
				return;
			}
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/major/majorList/doEditMajor",
				data : {
					"oldMajorName" : oldMajorName,
					"majName" : majorName,
					"majPhone" : majorPhone
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
						layer.msg("修改失败，该学科可能已经存在", {
							time : 2000,
							icon : 5,
							shift : 6
						}, function() {});
					}
				}
			});
		});
	
	
		var index = 0;
		function deleteUser(userId) {
			layer.confirm("您确认要删除专业[" + userId + "]吗？", {
				icon : 3,
				title : '提示'
			}, function(cindex) {
				$.ajax({
					type : "POST",
					url : "${APP_PATH}/major/majorList/doDeleteMajor",
					data : {
						"majorName" : userId
					},
					beforeSend : function() {
						index = layer.load(2, {
							time : 10 * 1000
						});
					},
					success : function(result) {
						layer.close(index);
						if (result.success) {
							layer.msg("删除成功", {
								time : 2000,
								icon : 6,
							}, function() {
								pageQuery();
							});
						} else {
							layer.msg("删除失败,请确认该专业没有学生", {
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
				url : "${APP_PATH}/major/majorList/doGetMajor",
				data : {
					"queryText" : queryText
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
						context += '	<td>' + data.majName + '</td>';
						context += '	<td>' + data.majPhone + '</td>';
						context += '	<td>';
						context += '		<button type="button" class="btn btn-primary btn-xs" onclick="editMajor(\''
							+ data.majName + '\')">';
						context += '			<i class=" glyphicon glyphicon-pencil"></i>';
						context += '		</button>';
						context += '		<button type="button" class="btn btn-danger btn-xs" onclick="deleteUser(\''
							+ data.majName + '\')">';
						context += '			<i class=" glyphicon glyphicon-remove"></i>';
						context += '		</button>';
						context += '	</td>';
						context += '</tr>';
					}
					$("#dataBody").html(context);
				}
			});
		}
	
		function editMajor(majorName) {
			oldMajorName = majorName;
			ShowCreateModal2();
		}
	
		$("#queryButton").click(function() {
			pageQuery($("#queryText").val())
		});
		function phoneNumberVerify(phone) {
			let reg = /^1(3[0-9]|4[5,7]|5[0,1,2,3,5,6,7,8,9]|6[2,5,6,7]|7[0,1,7,8]|8[0-9]|9[1,8,9])\d{8}$/;
			return reg.test(phone);
		}
	</script>
</body>
</html>
