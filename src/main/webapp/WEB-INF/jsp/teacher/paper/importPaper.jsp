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
						<li class="list-group-item tree-closed"><a href="main.html"><i class="glyphicon glyphicon-dashboard"></i> 控制面板</a></li>
						<li class="list-group-item tree-closed"><span><i class="glyphicon glyphicon glyphicon-tasks"></i> 学生管理<span class="badge" style="float:right">3</span></span>
							<ul style="margin-top:10px;display:none;">
								<li style="height:30px;"><a href="${APP_PATH}/class/classList"><i class="glyphicon glyphicon-king"></i> 班级管理 </a></li>
								<li style="height:30px;"><a href="${APP_PATH}/exam/postExam"><i class="glyphicon glyphicon-lock"></i> 发布考试</a></li>
							</ul></li>
						<li class="list-group-item "><span><i class="glyphicon glyphicon-ok"></i> 试卷管理 <span class="badge" style="float:right">3</span></span>
							<ul style="margin-top:10px;">
								<li style="height:30px;"><a href="${APP_PATH}/paper/teacher/paperList"><i class="glyphicon glyphicon-lock"></i> 查看试卷</a></li>
								<li style="height:30px;"><a href="${APP_PATH}/paper/paperEdit"><i class="glyphicon glyphicon-lock"></i> 试卷编辑</a></li>
								<li style="height:30px;"><a href="${APP_PATH}/paper/teacher/importPaper" style="color: red;"><i class="glyphicon glyphicon-lock"></i> 导入试卷</a></li>
								<li style="height:30px;"><a href="${APP_PATH}/paper/teacher/paperFavorites"><i class="glyphicon glyphicon-lock"></i> 我的试卷</a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><a href="param.html"><i class="glyphicon glyphicon-list-alt"></i> 参数管理</a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="page-header">
					<h1>导入试卷</h1>
				</div>

				<form id="paperUpForm" method="post" action="${APP_PATH}/paper/teacher/doImportPaper" enctype="multipart/form-data">
					<div class="form-group">
						<label for="exampleInputEmail1">选择专业</label> <select class="form-control" id="majorSelect" name="majorSelect">
						</select>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">选择科目</label> <select class="form-control" id="courseSelect" name="courseSelect">
						</select>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">试卷名称</label> <input type="text" class="form-control" id="paperName" name="paperName" placeholder="请输入试卷名称">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">选择文件</label> <input type="text" class="form-control" id="paperUpButton" placeholder="点击选择文件"> <input type="file" name="paperUpFile" id="paperUpFile" style="display: none;">
					</div>

					<hr>
					<button type="button" class="btn btn-success" id="nextButton">完成</button>
					<hr>
				</form>
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
			
			loadView()
			
			if ("${paperId}" == "error"){
				layer.msg("导入失败，请检查文件是否合法", {
					time : 2000,
					icon : 5,
					shift : 6
				}, function() {
					loadView();
				})
				return;
				<%session.setAttribute("paperId", "");%>
			}else if ("${paperId}" != ""){
				layer.confirm("导入成功，是否选择预览？ ", {
				icon : 3,
				title : '提示'
			}, function(cindex) {
				window.open("${APP_PATH}/paper/paperList/showPaper?paperId=" + "${paperId}");
				layer.close(cindex);
			}, function(cindex) {
				layer.close(cindex);
			});
				<%session.setAttribute("paperId", "");%>
			}
	
		});
		
		function loadView(){
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
			}
		$("#paperUpButton").click(function() {
			var fileObj = $(this).next();
			fileObj.click();
		});
	
		$("#paperUpFile").change(function() {
			$("#paperUpButton").val($("#paperUpFile").val())
		});
	
		$("#nextButton").click(function() {
			var majorSelect = $("#majorSelect").val();
			var courseSelect = $("#courseSelect").val();
			var paperName = $("#paperName").val();
			var fileSelect = $("#paperUpButton").val()
	
			if (majorSelect == "" || courseSelect == "") {
				layer.msg("存在未选择的项", {
					time : 1000,
					icon : 5,
					shift : 6
				}, function() {})
				return;
			}
			if (paperName == "") {
				layer.msg("请输入试卷名称", {
					time : 1000,
					icon : 5,
					shift : 6
				}, function() {})
				return;
			}
	
			if (fileSelect == "") {
				layer.msg("文件路径为空", {
					time : 1000,
					icon : 5,
					shift : 6
				}, function() {})
				return;
			}
	
			$("#paperUpForm").submit();
			$("#paperUpForm").blur();
		});
	</script>
</body>
</html>
