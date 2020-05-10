<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="keys" content="">
<meta name="author" content="">
<link rel="stylesheet" href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/login.css">
<style>
</style>
</head>
<body>
	<%@include file="/WEB-INF/jsp/common/common-title.jsp"%>

	<div class="container">

		<form class="form-signin" role="form">
			<h2 class="form-signin-heading">
				<i class="glyphicon glyphicon-globe"></i> 用户登录
			</h2>
			<div class="form-group has-success has-feedback">
				<input type="text" id="userId" class="form-control" id="inputSuccess4" placeholder="请输入登录账号" autofocus> <span class="glyphicon glyphicon-yen form-control-feedback"></span>
			</div>
			<div class="form-group has-success has-feedback">
				<input type="password" id="userPasswd" class="form-control" id="inputSuccess4" placeholder="请输入登录密码" style="margin-top:10px;"> <span class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			<div class="form-group has-success has-feedback">
				<select class="form-control" id="userType">
					<option value="2">学生</option>
					<option value="1">教师</option>
					<option value="0">管理员</option>
				</select>
			</div>
			<div class="checkbox">
				<a href="${APP_PATH}/index/register" style="color: red">还没有账号？立即注册</a>
				<%
					for (int i = 0; i < 6; i++)
						out.print("&emsp;");
				%>
				<a href="${APP_PATH}/index/forgetPasswd" style="color: black">忘记密码</a>
			</div>
			<a class="btn btn-lg btn-success btn-block" onclick="doLogin()"> 登录</a>
		</form>
	</div>
	<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
	<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/layer/layer.js"></script>
	<script>
		function doLogin() {
			var userId = $("#userId").val();
			var passwd = $("#userPasswd").val();
			if (userId == "") {
				layer.msg("请输入用户名", {
					time : 1000,
					icon : 5,
					shift : 6
				}, function() {
					//消息关闭执行此逻辑
				})
				return;
			}
			if (userId.length < 5 || userId.length > 8) {
				layer.msg("用户名格式错误", {
					time : 1000,
					icon : 5,
					shift : 6
				}, function() {
					//消息关闭执行此逻辑
				})
				return;
			}
			if (passwd == "" || passwd == null) {
				layer.msg("请输入密码", {
					time : 1000,
					icon : 5,
					shift : 6
				}, function() {
					//消息关闭执行此逻辑
				})
				return;
			}
			if (passwd.length < 6 || userId.length > 16) {
				layer.msg("密码格式错误", {
					time : 1000,
					icon : 5,
					shift : 6
				}, function() {
					//消息关闭执行此逻辑
				})
				return;
			}
	
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/index/doLogin",
				data : {
					"userId" : $("#userId").val(),
					"userPasswd" : $("#userPasswd").val(),
					"userTypde" : $("#userType").val()
				},
				success : function(result) {
					if (result.success) {
						if (result.data != $("#userType").val()) {
							layer.msg("您不是该用户类型", {
								time : 1000,
								icon : 5,
								shift : 6
							}, function() {
								//消息关闭执行此逻辑
							})
						} else if (result.data == 1) {
							window.location.href = "${APP_PATH}/dispatcher/teacher"
						} else if (result.data == 0) {
							window.location.href = "${APP_PATH}/dispatcher/manager"
						} else {
							window.location.href = "${APP_PATH}/dispatcher/student"
						}
					} else {
						layer.msg("用户名或密码错误", {
							time : 1000,
							icon : 5,
							shift : 6
						}, function() {
							//消息关闭执行此逻辑
						})
					}
				}
			});
		}
	</script>
</body>
</html>