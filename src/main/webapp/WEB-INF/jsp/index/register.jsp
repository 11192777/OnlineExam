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
				<i class="glyphicon glyphicon-log-in"></i> 用户注册
			</h2>
			<div class="form-group has-success has-feedback">
				<input type="text" id="userName" class="form-control" id="inputSuccess4" placeholder="请输入登录账号" autofocus> <span class="glyphicon glyphicon-yen form-control-feedback"></span>
			</div>
			<div class="form-group has-success has-feedback">
				<input type="password" id="userPasswd1" class="form-control" id="inputSuccess4" placeholder="请输入登录密码" style="margin-top:10px;"> <span class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			<div class="form-group has-success has-feedback">
				<input type="password" id="userPasswd2" class="form-control" id="inputSuccess4" placeholder="请再次输入登录密码" style="margin-top:10px;"> <span class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			
			<div class="form-group has-success has-feedback">
				<input type="text" id="email" class="form-control" id="inputSuccess4" placeholder="请输入邮箱地址" style="margin-top:10px;"> <span class="glyphicon glyphicon glyphicon-envelope form-control-feedback"></span>
			</div>
			<div class="form-group has-success has-feedback">
				<select class="form-control" id="userType">
					<option value="1">教师</option>
					<option value="0">管理员</option>
				</select>
			</div>
			<a class="btn btn-lg btn-success btn-block" onclick="doRegister()"> 点击注册</a>
		</form>
	</div>
	<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
	<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/layer/layer.js"></script>
	<script type="text/javascript">
		function doRegister() {
			if ($("#userName").val() == "") {
				layer.msg("登陆账号不能为空，请输入", {
					time : 1000,
					icon : 5,
					shift : 6
				}, function() {
					//消息关闭执行此逻辑
				})
				return
			}
			if ($("#userPasswd1").val() == "") {
				layer.msg("登陆密码不能为空，请输入", {
					time : 1000,
					icon : 5,
					shift : 6
				}, function() {
					//消息关闭执行此逻辑
				})
				return
			}
			if ($("#userPasswd1").val() != $("#userPasswd2").val()) {
				layer.msg("两次密码输入不一致！，请重新输入", {
					time : 1000,
					icon : 5,
					shift : 6
				}, function() {
					//消息关闭执行此逻辑
				})
				return
			}
			if ($("#emial").val() == "") {
				layer.msg("邮箱不能为空，请输入", {
					time : 1000,
					icon : 5,
					shift : 6
				}, function() {
					//消息关闭执行此逻辑
				})
				return
			}
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/index/doRegister",
				data : {
					"userId" : $("#userName").val(),
					"userPasswd" : $("#userPasswd1").val(),
					"email" : $("#email").val(),
					"userType" : $("#userType").val()
				},
				beforeSend : function() {
					index = layer.load(2, {
						time : 10 * 1000
					});
				},
				success : function(result) {
					layer.close(index);
					if (result.success) {
						layer.msg("注册成功，即将跳转到登陆界面", {
							time : 2000,
							icon : 6,
							shift : 5
						}, function() {
							window.location.href = "${APP_PATH}/index/login";
						});
					} else {
						layer.msg("用户名已经存在", {
							time : 2000,
							icon : 5,
							shift : 6
						}, function() {
							// 消息关闭后执行的逻辑
						});
					}
				}
			});
		}
	</script>
</body>
</html>