<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="GB18030">
<head>
<meta charset="GB18030">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" href="${APP_PATH}/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
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
						<li class="list-group-item tree-closed"><a href="main.html"><i class="glyphicon glyphicon-dashboard"></i> 控制面板</a></li>
						<li class="list-group-item "><span><i class="glyphicon glyphicon glyphicon-tasks"></i> 学生管理<span class="badge" style="float:right">3</span></span>
							<ul style="margin-top:10px;">
								<li style="height:30px;"><a href="${APP_PATH}/class/classList"><i class="glyphicon glyphicon-king"></i> 班级管理 </a></li>
								<li style="height:30px;"><a href="${APP_PATH}/exam/postExam" style="color: red;"><i class="glyphicon glyphicon-lock"></i> 发布考试</a></li>
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
				<div class="page-header">
					<h1>发布考试</h1>
				</div>
				<form role="form" style="margin-top:20px;" action="${APP_PATH}/manager/itemBank/itemAdd/step2" method="POST" id="submitForm">
					<div class="form-group">
						<label for="exampleInputEmail1">选择班级</label> <select class="form-control" id="classSelect">
						</select>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">选择试卷</label> <select class="form-control" id="paperSelect">
						</select>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">输入试卷标题</label> <input type="text" class="form-control" id="paperTitle" placeholder="请输入试卷标题">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">考试时长（分钟）</label> <input type="text" class="form-control" id="examTime" placeholder="请输入考试时长">
					</div>
					<div class="form-group" id="timeDiv">
						<label for="exampleInputEmail1">允许进入考试时间</label> <input type="hidden" id="dtp_input1" value="" /><br />
						<div class="input-group date form_datetime col-md-5" data-date="1979-09-16T05:25:07Z" data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1">
							<input class="form-control" size="16" type="text" value="" readonly> <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span> <span class="input-group-addon"><span
								class="glyphicon glyphicon-th"></span></span>
						</div>
						<input type="hidden" id="dtp_input1" /><br />
					</div>
					<div class="form-group" id="timeDiv">
						<label for="exampleInputEmail1">考试截止时间</label> <input type="hidden" id="dtp_input2" value="" /><br />
						<div class="input-group date form_datetime col-md-5" data-date="1979-09-16T05:25:07Z" data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input2">
							<input class="form-control" size="16" type="text" value="" readonly> <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span> <span class="input-group-addon"><span
								class="glyphicon glyphicon-th"></span></span>
						</div>
						<input type="hidden" id="dtp_input2" /><br />
					</div>
					<hr>
					<button type="button" class="btn btn-success" id="nextButton">发布考试</button>
				</form>
				<hr>
			</div>
		</div>

	</div>
	<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
	<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/script/docs.min.js"></script>
	<script src="${APP_PATH}/layer/layer.js"></script>
	<script type="text/javascript" src="${APP_PATH}/jquery/jquery-1.8.3.min.js" charset="UTF-8"></script>
	<script type="text/javascript" src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${APP_PATH}/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="${APP_PATH}/js/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
	<script type="text/javascript">
		$('.form_datetime').datetimepicker({
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			forceParse : 0,
			showMeridian : 1
		});
		$('.form_date').datetimepicker({
			language : 'fr',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			forceParse : 0
		});
		$('.form_time').datetimepicker({
			language : 'fr',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 1,
			minView : 0,
			maxView : 1,
			forceParse : 0
		});
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
			loadClass()
			loadPaper()
		});
	
		function loadClass() {
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/class/classList/doPageQuery",
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
					var clas = result.data;
					var context = "";
					for (var i = 0; i < clas.length; i++) {
						var cla = clas[i];
						context += '<option value="' + cla.claId + '">' + cla.claId + ' ： ' + cla.claName + '</option>';
					}
					$("#classSelect").html(context);
				}
			});
		}
	
		function loadPaper() {
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
						context += '<option value="' + data.papId + '">' + data.papId + ' ： ' + data.paperName + '</option>';
					}
					$("#paperSelect").html(context);
				}
			});
		}
	
		$("#nextButton").click(function() {
			if ($("#classSelect").val() == "" || $("#paperSelect").val() == "") {
				layer.msg("存在未选择的项", {
					time : 1000,
					icon : 5,
					shift : 6
				}, function() {
					$("#userId").focus();
				})
				return;
			}
	
			if ($("#paperTitle").val() == "") {
				layer.msg("请输入试卷标题", {
					time : 1000,
					icon : 5,
					shift : 6
				}, function() {
					$("#userId").focus();
				})
				return;
			}
	
			if ($("#examTime").val() == "") {
				layer.msg("请输入考试时长", {
					time : 1000,
					icon : 5,
					shift : 6
				}, function() {
					$("#userId").focus();
				})
				return;
			}
	
			if (!ageVertify($("#examTime").val())) {
				layer.msg("考试时长格式错误", {
					time : 1000,
					icon : 5,
					shift : 6
				}, function() {
					$("#userId").focus();
				})
				return;
			} else if ($("#examTime").val() < 30 || $("#examTime").val() > 300) {
				layer.msg("请输入正确的时长（30 - 300）", {
					time : 1000,
					icon : 5,
					shift : 6
				}, function() {
					$("#userId").focus();
				})
				return
			}
	
			if ($("#dtp_input1").val() == "") {
				layer.msg("请选择考试开始日期", {
					time : 1000,
					icon : 5,
					shift : 6
				}, function() {
					$("#userId").focus();
				})
				return
			}
	
			if ($("#dtp_input2").val() == "") {
				layer.msg("请选择考试截止日期", {
					time : 1000,
					icon : 5,
					shift : 6
				}, function() {
					$("#userId").focus();
				})
				return
			}
	
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/exam/doPostExam",
				data : {
					"papId" : $("#paperSelect").val(),
					"claId" : $("#classSelect").val(),
					"papTitle" : $("#paperTitle").val(),
					"examTime" : $("#examTime").val(),
					"teaId" : "${loginUser.userId}",
					"sTime" : $("#dtp_input1").val(),
					"eTime" : $("#dtp_input2").val()
				},
				beforeSend : function() {
					index = layer.load(2, {
						time : 10 * 1000
					});
				},
				success : function(result) {
					layer.close(index);
					if (result.success) {
						layer.msg("成功发布试卷", {
							time : 2000,
							icon : 6,
							shift : 5
						}, function() {})
					} else {
						if (result.data != null) {
							if (result.data == "error3") {
								layer.msg("发布重复", {
									time : 2000,
									icon : 5,
									shift : 6
								}, function() {})
								return;
							} else if (result.data == "error2") {
								layer.msg("请确认考试开始时间大于考考试截止时间", {
									time : 2000,
									icon : 5,
									shift : 6
								}, function() {})
								return;
							} else if (result.data == "error1") {
								layer.msg("发布失败，请确认考试时间是否正确", {
									time : 2000,
									icon : 5,
									shift : 6
								}, function() {})
	
							}
						}
					}
				}
			});
		});
	
		function ageVertify(age) {
			let reg = /^\d+$/;
			return reg.test(age);
		}
	</script>
</body>
</html>
