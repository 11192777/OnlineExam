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
						<li class="list-group-item tree-closed"><span><i class="glyphicon glyphicon glyphicon-tasks"></i> 学生管理<span class="badge" style="float:right">3</span></span>
							<ul style="margin-top:10px; display: none;">
								<li style="height:30px;"><a href="${APP_PATH}/class/classList"><i class="glyphicon glyphicon-king"></i> 班级管理 </a></li>
								<li style="height:30px;"><a href="${APP_PATH}/exam/postExam"><i class="glyphicon glyphicon-lock"></i> 发布考试</a></li>
							</ul></li>
						<li class="list-group-item "><span><i class="glyphicon glyphicon-ok"></i> 试卷管理 <span class="badge" style="float:right">3</span></span>
							<ul style="margin-top:10px;">
								<li style="height:30px;"><a href="${APP_PATH}/paper/teacher/paperList"><i class="glyphicon glyphicon-lock"></i> 查看试卷</a></li>
								<li style="height:30px;"><a href="${APP_PATH}/paper/paperEdit"><i class="glyphicon glyphicon-lock"></i> 试卷编辑</a></li>
								<li style="height:30px;"><a href="${APP_PATH}/paper/teacher/importPaper"><i class="glyphicon glyphicon-lock"></i> 导入试卷</a></li>
								<li style="height:30px;"><a href="${APP_PATH}/paper/teacher/paperFavorites" style="color: red;"><i class="glyphicon glyphicon-lock"></i> 我的试卷</a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><a href="param.html"><i class="glyphicon glyphicon-list-alt"></i> 参数管理</a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="glyphicon glyphicon-th"></i> 试卷收藏列表
						</h3>
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table  table-bordered">
								<thead>
									<tr>
										<th width="30">#</th>
										<th width="85">试卷编号</th>
										<th>试卷名称</th>
										<th>创建者</th>
										<th>专业</th>
										<th width="200px;">创建时间</th>
										<th width="200px;">收藏时间</th>
										<th style="width: 70px;text-align: center;">操作</th>
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
			pageQuery()
		});
	
		function pageQuery() {
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/exam/teacher/collectPaper/paperList",
				data : {
					"teacherId" : "${loginUser.userId}"
				},
				beforeSend : function() {
					index = layer.load(2, {
						time : 10 * 1000
					});
				},
				success : function(result) {
					layer.close(index);
					var datas = result.data
					var context = "";
					for (var i = 0; i < datas.length; i++) {
						var data = datas[i].paper;
						context += '<tr>';
						context += '	<td>' + (i + 1) + '</td>';
						context += '	<td>' + data.papId.toString(16) + '</td>';
						context += '	<td>' + data.paperName + '</td>';
						context += '	<td>' + data.teaId + '</td>';
						context += '	<td>' + data.majName + '</td>';
						context += '	<td>' + showTime(data.createTime) + '</td>';
						context += '	<td>' + showTime(datas[i].joinTime) + '</td>';
						context += '	<td>';
						context += '		<button type="button" class="btn btn-success btn-xs" onclick="showPaper(\'' + data.papId + '\')">';
						context += '			<i class=" glyphicon glyphicon-check"></i>';
						context += '		</button>';
						context += '		<button type="button" class="btn btn-danger btn-xs" onclick="deletePaper(\'' + data.papId + '\')">';
						context += '			<i class=" glyphicon glyphicon-remove"></i>';
						context += '		</button>';
						context += '	</td>';
						context += '</tr>';
					}
					$("#dataBody").html(context);
				}
			});
		}
	
		function deletePaper(topicId) {
			layer.confirm("您确认要取消收藏吗？", {
				icon : 3,
				title : '提示'
			}, function(cindex) {
				$.ajax({
					type : "POST",
					url : "${APP_PATH}/exam/teacher/collectPaper/doQuitPaper",
					data : {
						"papId" : topicId,
						"teaId" : "${loginUser.userId}"
					},
					beforeSend : function() {
						index = layer.load(2, {
							time : 10 * 1000
						});
					},
					success : function(result) {
						layer.close(index);
						layer.msg("已取消", {
							time : 2000,
							icon : 6,
							shift : 5
						}, function() {
							pageQuery()
						})
					}
				});
				layer.close(cindex);
			}, function(cindex) {
				layer.close(cindex);
			});
		}
	
		function showPaper(paperId) {
			window.open("${APP_PATH}/paper/paperList/showPaper?paperId=" + paperId);
		}
		function showTime(value) {
			nowtime = new Date(value);
			year = nowtime.getFullYear();
			month = nowtime.getMonth() + 1;
			date = nowtime.getDate();
			return year + "-" + month + "-" + date + " " + nowtime.toLocaleTimeString();
		}
		$("#backButton").click(function() {
			$('#createFileMModal').modal('hide');
		})
	</script>
</body>
</html>
