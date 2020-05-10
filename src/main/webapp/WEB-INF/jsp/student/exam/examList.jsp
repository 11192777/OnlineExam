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
						<li class="list-group-item tree-closed"><span><i class="glyphicon glyphicon glyphicon-tasks"></i> 班级管理<span class="badge" style="float:right">3</span></span>
							<ul style="margin-top:10px;display:none;">
								<li style="height:30px;"><a href="${APP_PATH}/class/studentClassList"><i class="glyphicon glyphicon-king">加入班级</i> </a></li>
								<li style="height:30px;"><a href="${APP_PATH}/student/studentJoinList"><i class="glyphicon glyphicon-lock"></i> 退出班级</a></li>
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
							<i class="glyphicon glyphicon-th"></i> 考试列表
						</h3>
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table  table-bordered">
								<thead>
									<tr>
										<th width="30">#</th>
										<th>标题</th>
										<th>发布教师</th>
										<th>考试时长(分钟)</th>
										<th>考试开始时间</th>
										<th>考试截止时间</th>
										<th style="width: 80px;">开始考试</th>
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
	
	
		function startExam(paperId, sTime, eTime) {
			layer.confirm("您确认要开始考试吗？请注意网络环境，中途不可退出。", {
				icon : 3,
				title : '提示'
			}, function(cindex) {
				$.ajax({
					type : "POST",
					url : "${APP_PATH}/exam/verifyExamTime",
					data : {
						"sTime" : sTime,
						"eTime" : eTime
					},
					success : function(result) {
						window.open("${APP_PATH}/exam/startExam?paperId=" + paperId);
						return
						if (result.success) {
						//	window.open("${APP_PATH}/exam/startExam?paperId=" + paperId);
						} else {
							if (result.data = "error1") {
								layer.msg("还没有到考试开始时间", {
									time : 2000,
									icon : 5,
									shift : 6
								}, function() {});
							} else if (result.data == "error2") {
								layer.msg("考试已经截止", {
									time : 2000,
									icon : 5,
									shift : 6
								}, function() {});
							}
						}
					}
				});
				layer.close(cindex);
			}, function(cindex) {
				layer.close(cindex);
			});
		}
	
		function pageQuery() {
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/exam/student/doGetExamList",
				data : {
					"studentId" : "${loginUser.userId}",
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
							context += '	<td>' + data.papTitle + '</td>';
							context += '	<td>' + data.teacher.teaName + '</td>';
							context += '	<td>' + data.examTime + '</td>';
							context += '	<td>' + showTime(data.startTime) + '</td>';
							context += '	<td>' + showTime(data.endTime) + '</td>';
							context += '	<td>';
							context += '		<button type="button" class="btn btn-primary btn-xs" onclick="startExam(\'' + data.papId + '\',' + data.startTime + ',' + data.endTime + ')">';
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
	
		function showTime(value) {
			nowtime = new Date(value);
			year = nowtime.getFullYear();
			month = nowtime.getMonth() + 1;
			date = nowtime.getDate();
			return year + "-" + month + "-" + date + " " + nowtime.toLocaleTimeString();
		}
	
		$("#queryButton").click(function() {
			pageQuery($("#queryText").val())
		});
	</script>
</body>
</html>
