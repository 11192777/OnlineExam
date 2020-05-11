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
				<div class="page-header">
					<h1>试卷添加 - 编辑试题</h1>
				</div>
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation"><a href="#"><span class="badge">1</span> 配置试题参数 </a></li>
					<li role="presentation" class="active"><a href="#"><span class="badge">2</span> 试卷编辑</a></li>
					<li role="presentation"><a href="#"><span class="badge">3</span> 试卷预览</a></li>
				</ul>




				<div class="panel-body" id="selectTopicEdit" style="display: none;">
					<form class="form-inline" role="form" style="float: left;">
						<div class="form-group has-feedback">
							<div class="input-group">
								<div class="input-group-addon" style="font-size: 24px;">选择题编辑</div>
							</div>
						</div>
					</form>
					<br>
					<hr style="clear: both;">
					<div class="table-responsive">
						<table class="table  table-bordered">
							<thead>
								<tr>
									<th width="30">#</th>
									<th width="85">试题编号</th>
									<th>题目</th>
									<th style="width: 70px; text-align: center;">移动</th>
									<th style="width: 45px;">移除</th>
								</tr>
							</thead>
							<tbody id="selectDataBody"></tbody>
						</table>
					</div>
					<hr style="clear: both;">
					<button type="button" class="btn btn-success" style="float: right;" onclick="window.location.href='${APP_PATH}/paper/addSelectTopic'">
						<i class="glyphicon glyphicon-plus"></i> 添加选择题
					</button>
				</div>

				<div class="panel-body" id="judegTopicEdit" style="display: none;">
					<form class="form-inline" role="form" style="float: left;">
						<div class="form-group has-feedback">
							<div class="input-group">
								<div class="input-group-addon" style="font-size: 24px;">判断题编辑</div>
							</div>
						</div>
					</form>
					<br>
					<hr style="clear: both;">
					<div class="table-responsive">
						<table class="table  table-bordered">
							<thead>
								<tr>
									<th width="30">#</th>
									<th width="85">试题编号</th>
									<th>题目</th>
									<th style="width: 70px; text-align: center;">移动</th>
									<th style="width: 45px;">移除</th>
								</tr>
							</thead>
							<tbody id="judgeDataBody"></tbody>
						</table>
					</div>
					<hr style="clear: both;">
					<button type="button" class="btn btn-primary" style="float: right;" onclick="window.location.href='${APP_PATH}/paper/addJudgeTopic'">
						<i class="glyphicon glyphicon-plus"></i> 添加判断题
					</button>
				</div>
				<hr>
				<button type="button" id="lastButton" class="btn btn-default">上一步</button>
				<button type="button" id="nextButton" class="btn btn-success">下一步</button>
			</div>
		</div>
	</div>
	<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
	<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/script/docs.min.js"></script>
	<script src="${APP_PATH}/layer/layer.js"></script>
	<script type="text/javascript">
		var registerInfo = JSON.parse(sessionStorage.getItem('paper_step1_info'));
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
			if (registerInfo2 == null) {
				var obj = {};
				var selectArray = new Array()
				var judgeArray = new Array()
				obj.selectArray = selectArray;
				obj.judgeArray = judgeArray;
				sessionStorage.setItem('paper_step2_info', JSON.stringify(obj));
			}
	
			if (registerInfo) {
				if (registerInfo.haveSelect == '1') {
					if (registerInfo2) {
						loadSelectEdit()
					}
					$("#selectTopicEdit").show()
				}
				if (registerInfo.haveJudge == '1') {
					if (registerInfo2) {
						loadJudgeEdit()
					}
					$("#judegTopicEdit").show()
	
				}
			}
		});
	
	
		function loadSelectEdit() {
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/paper/doLoadSelectTopic",
				traditional : true,
				data : {
					"topicIdList" : registerInfo2.selectArray
				},
				beforeSend : function() {
					index = layer.load(2, {
						time : 10 * 1000
					});
				},
				success : function(result) {
					layer.close(index);
					var context = "";
					var datas = result.data;
					for (var i = 0; i < datas.length; i++) {
						var data = datas[i];
						context += '<tr>';
						context += '	<td>' + (i + 1) + '</td>';
						context += '	<td>S' + data.topId.toString(16) + '</td>';
						context += '	<td>' + data.topContent + '</td>';
						context += '	<td>';
						context += '		<button type="button" class="btn btn-success btn-xs" onclick="moveUpTopic(' + i + ',' + 0 + ')">';
						context += '			<i class=" glyphicon glyphicon-arrow-up"></i>';
						context += '		</button>';
						context += '		<button type="button" class="btn btn-success btn-xs" onclick="moveDownTopic(' + i + ',' + 0 + ')">';
						context += '			<i class=" glyphicon glyphicon-arrow-down"></i>';
						context += '		</button>';
						context += '	</td>';
						context += '	<td>';
						context += '		<button type="button" class="btn btn-danger btn-xs" onclick="deleteTopic(' + i + ', 0)">';
						context += '			<i class=" glyphicon glyphicon-remove"></i>';
						context += '		</button>';
						context += '	</td>';
						context += '</tr>';
					}
					$("#selectDataBody").html(context)
				}
			});
		}
	
		function deleteTopic(index, topicType) {
			if (topicType == 0) {
				registerInfo2.selectArray.splice(index, 1)
				loadSelectEdit()
			} else if (topicType == 1) {
				registerInfo2.judgeArray.splice(index, 1)
				loadJudgeEdit()
			}
			sessionStorage.setItem('paper_step2_info', JSON.stringify(registerInfo2));
		}
		function loadJudgeEdit() {
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/paper/doLoadJudgeTopic",
				traditional : true,
				data : {
					"topicIdList" : registerInfo2.judgeArray
				},
				beforeSend : function() {
					index = layer.load(2, {
						time : 10 * 1000
					});
				},
				success : function(result) {
					layer.close(index);
					var context = "";
					var datas = result.data;
					for (var i = 0; i < datas.length; i++) {
						var data = datas[i];
						context += '<tr>';
						context += '	<td>' + (i + 1) + '</td>';
						context += '	<td>J' + data.topId.toString(16) + '</td>';
						context += '	<td>' + data.topContent + '</td>';
						context += '	<td>';
						context += '		<button type="button" class="btn btn-success btn-xs" onclick="moveUpTopic(' + i + ',' + 1 + ')">';
						context += '			<i class=" glyphicon glyphicon-arrow-up"></i>';
						context += '		</button>';
						context += '		<button type="button" class="btn btn-success btn-xs" onclick="moveDownTopic(' + i + ',' + 1 + ')">';
						context += '			<i class=" glyphicon glyphicon-arrow-down"></i>';
						context += '		</button>';
						context += '	</td>';
						context += '	<td>';
						context += '		<button type="button" class="btn btn-danger btn-xs" onclick="deleteTopic(' + i + ', 1)">';
						context += '			<i class=" glyphicon glyphicon-remove"></i>';
						context += '		</button>';
						context += '	</td>';
						context += '</tr>';
					}
					$("#judgeDataBody").html(context)
				}
			});
		}
	
		function moveUpTopic(index, topicType) {
			if (index == 0) return;
			if (topicType == 0) {
				registerInfo2.selectArray.splice(index - 1, 0, registerInfo2.selectArray[index]);
				registerInfo2.selectArray.splice(index + 1, 1);
				sessionStorage.setItem('paper_step2_info', JSON.stringify(registerInfo2));
				loadSelectEdit()
			} else if (topicType == 1) {
				registerInfo2.judgeArray.splice(index - 1, 0, registerInfo2.judgeArray[index]);
				registerInfo2.judgeArray.splice(index + 1, 1);
				sessionStorage.setItem('paper_step2_info', JSON.stringify(registerInfo2));
				loadJudgeEdit()
			}
		}
	
		function moveDownTopic(index, topicType) {
			if (topicType == 0 && index != registerInfo2.selectArray.length - 1) {
				registerInfo2.selectArray.splice(index + 2, 0, registerInfo2.selectArray[index]);
				registerInfo2.selectArray.splice(index, 1);
				sessionStorage.setItem('paper_step2_info', JSON.stringify(registerInfo2));
				loadSelectEdit()
			} else if (topicType == 1 && index != registerInfo2.judgeArray.length - 1) {
				registerInfo2.judgeArray.splice(index + 2, 0, registerInfo2.judgeArray[index]);
				registerInfo2.judgeArray.splice(index, 1);
				sessionStorage.setItem('paper_step2_info', JSON.stringify(registerInfo2));
				loadJudgeEdit()
			}
	
		}
	
		$("#nextButton").click(function() {
			if (registerInfo2.selectArray.length == 0 || registerInfo2.judgeArray == 0) {
				layer.msg("存在未添加试题的题型", {
					time : 2000,
					icon : 5,
					shift : 6
				}, function() {});
				return;
			}
			window.location.href = '${APP_PATH}/paper/paperEdit/step3';
		});
	
		$("#lastButton").click(function() {
			window.location.href = '${APP_PATH}/paper/paperEdit';
		});
	</script>
</body>
</html>
