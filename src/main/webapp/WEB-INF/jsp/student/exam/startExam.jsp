<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="google" content="notranslate">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">


<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta name="renderer" content="webkit">
<meta name="referrer" content="no-referrer">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" type="text/css" href="${APP_PATH}/exammodel/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${APP_PATH}/exam/bootstrap-3.3.4.css">
<link href="${APP_PATH}/exam/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${APP_PATH}/exammodel/styles.min.css">
<link rel="stylesheet" type="text/css" href="${APP_PATH}/exammodel/style.css">
<link rel="stylesheet" type="text/css" href="${APP_PATH}/exammodel/base.css">

<link rel="stylesheet" type="text/css" href="${APP_PATH}/exammodel/exam_style.css">
<style>
.title_font {
	font-family: '华文楷体';
	font-size: 22px;
}

html {
	padding: 0;
}

body {
	padding-top: 70px;
}

.main.exam-mode {
	padding-top: 0;
}

.body-wrapper .paper {
	margin-top: 20px;
}

.submit-notice {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, .6);
	z-index: 2001;
}

.submit-notice .notice-text {
	display: inline-block;
	width: 450px;
	height: 50px;
	line-height: 50px;
	text-align: center;
	color: #fff;
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
	background: rgba(0, 0, 0, .5);
	border-radius: 6px;
}
/*提示*/
.set_success {
	margin-right: 10px;
}
/*ksx-success*/
.ksx-success {
	width: 300px;
	height: 40px;
	margin-top: 20px;
	display: none;
	position: absolute;
	left: calc(50% - 150px);
	z-index: 2000;
	top: 0; /*非逐题模式页面加上*/
}

.ksx-success .text {
	font-family: PingFangSC-Medium;
	font-size: 14px;
	color: #1DC88C;
	background: rgba(29, 200, 140, 0.10);
	border: 1px solid rgba(29, 200, 140, 0.20);
	border-radius: 4px;
	width: 100%;
	height: 100%;
	line-height: 38px;
	text-align: center;
}
/*ksx-error*/
.ksx-error {
	width: 300px;
	height: 40px;
	margin-top: 20px;
	display: none;
	position: absolute;
	left: calc(50% - 150px);
	z-index: 2000;
	top: 0; /*非逐题模式页面加上*/
}

.ksx-error .text {
	font-family: PingFangSC-Medium;
	font-size: 14px;
	color: #FF4B50;
	background: rgba(255, 75, 80, 0.10);
	border: 1px solid rgba(255, 75, 80, 0.20);
	border-radius: 4px;
	width: 100%;
	height: 100%;
	line-height: 38px;
	text-align: center;
}
/*ksx-warn*/
.ksx-warn {
	width: 300px;
	height: 40px;
	margin-top: 20px;
	display: none;
	position: absolute;
	left: calc(50% - 150px);
	z-index: 2000;
	top: 0; /*非逐题模式页面加上*/
}

.ksx-warn .text {
	font-family: PingFangSC-Medium;
	font-size: 14px;
	color: #FE8545;
	background: rgba(254, 133, 69, 0.10);
	border: 1px solid rgba(254, 133, 69, 0.20);
	border-radius: 4px;
	width: 100%;
	height: 100%;
	line-height: 38px;
	text-align: center;
}
/*加粗下划、加粗删除线等没有加粗效果的修复*/
u, i, strike, font {
	font-weight: inherit; /*加粗样式被覆盖，将这些标签的字粗改成继承，如果有父元素有b则继承加粗样式*/
}

/*答题卡优化*/
#answercardFoldBtn {
	display: none;
}

.numberCardModal {
	left: 90px;
}

.nav-wrapper {
	right: 90px;
	bottom: 20px;
}

.nav-wrapper .btn.btn-primary.btn-nav {
	bottom: -10px;
	position: absolute;
}

.main {
	padding: 90px 230px 80px 350px;
}

.modal-number-card .modal-body .card-content .box-list .box.s1 .iconBox {
	border: 1px solid #DCDFE6;
	color: #DCDFE6;
}

.insert-box .iconBox {
	font-size: 1px;
}

.modal-number-card .modal-header {
	padding: 10px;
}

.numberCardModal .modal-number-card .modal-content .title {
	margin-bottom: 0;
}

.numberCardModal .modal-number-card .modal-content .title .title_content {
	margin-left: 14px;
	font-weight: 600;
	color: #27274A;
}

.modal-number-card .modal-body .card-content .card-content-title {
	font-size: 12px;
	color: #27274A;
	font-weight: 600;
}

.modal-number-card .modal-body .card-content .box-list {
	padding-bottom: 0;
}

.modal-number-card .iconBox {
	font-weight: 600;
}
</style>

</head>
<body>
	<div class="main exam-mode" style="padding-left: 10%;">
		<div class="header-wrapper">
			<div class="exam-name ellipsis">答题界面</div>
			<div class="user ellipsis">
				<i class="icon icon-a_nav_my"></i>
			</div>


		</div>
		<div class="body-wrapper">
			<div class="body paper">
				<div class="questions">
					<div class="questions-title" id="">单选题</div>
					<div class="questions-content" id="selectShow"></div>
				</div>
			</div>
		</div>
		<div class="body-wrapper">
			<div class="body paper">
				<div class="questions">
					<div class="questions-title" id="">判断题</div>
					<div class="questions-content" id="judgeShow"></div>
				</div>
			</div>
		</div>

		<div class="nav-wrapper">
			<div class="nav nav-status nav-operation">
				<ul class="menu-items">
					<li class="menu-item menu-item-time ">
						<div class="item-label">剩余时间</div>
						<div class="item-data" id="timeDown">00:59:35</div>
					</li>
				</ul>
			</div>
			<button class="btn btn-primary btn-nav" id="endExamBtn" onclick="submit()">提交</button>
		</div>
	</div>
	<script src="${APP_PATH}/exam/jquery-1.9.1.min.js"></script>
	<script src="${APP_PATH}/exam/bootstrap.js"></script>
	<script type="text/javascript" src="${APP_PATH}/exam/Questions.js"></script>
	<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/script/docs.min.js"></script>
	<script src="${APP_PATH}/layer/layer.js"></script>
	<script>
		var selectTopic = null;
		var judgeTopic = null;
		$(function() {
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/paper/paperList/doShowPaper",
				data : {
					"paperId" : "${paperId}"
				},
				success : function(result) {
					selectTopic = result.data.selectTopicList;
					judgeTopic = result.data.judgeTopicList;
	
					if (selectTopic != null) {
						var context = "";
						for (var i = 0; i < selectTopic.length; i++) {
							var data = selectTopic[i];
							context += '<div class="question-content"><ul style="list-style-type: none;">';
							context += '<li style="line-height: 25px;"><strong class="title_font">' + (i + 1) + '.' + data.topContent + '</strong></li>';
							context += '<li class="question_info" onclick="clickTrim(this)" style="border: 10px; padding-left: 40px;" id="' + (i * 4 + 1) + '"><input type="radio">&nbsp;&nbsp;A.' + data.res1 + '</li>';
							context += '<li class="question_info" onclick="clickTrim(this)" style="border: 10px; padding-left: 40px;" id="' + (i * 4 + 2) + '"><input type="radio">&nbsp;&nbsp;B.' + data.res2 + '</li>';
							context += '<li class="question_info" onclick="clickTrim(this)" style="border: 10px; padding-left: 40px;" id="' + (i * 4 + 3) + '"><input type="radio">&nbsp;&nbsp;C.' + data.res3 + '</li>';
							if (data.res4 != null) {
								context += '<li class="question_info" onclick="clickTrim(this)" style="border: 10px; padding-left: 40px;" id="' + (i * 4 + 4) + '"><input type="radio">&nbsp;&nbsp;D.' + data.res4 + '</li>';
							}
							context += '</ul></div>';
						}
						$("#selectShow").html(context)
					}
	
					if (judgeTopic != null) {
						var context = "";
						var index = selectTopic == null ? 0 : selectTopic.length;
						for (var i = 0; i < judgeTopic.length; i++) {
							var data = judgeTopic[i];
							context += '<div class="question-content"><ul style="list-style-type: none;">';
							context += '<li style="line-height: 25px;"><strong class="title_font">' + (i + 1) + '.' + data.topContent + '</strong></li>';
							context += '<li class="question_info" onclick="clickTrim(this)" style="border: 10px; padding-left: 40px;" id="' + ((index + i) * 4 + 1) + '"><input type="radio">&nbsp;&nbsp;正确</li>';
							context += '<li class="question_info" onclick="clickTrim(this)" style="border: 10px; padding-left: 40px;" id="' + ((index + i) * 4 + 2) + '"><input type="radio">&nbsp;&nbsp;错误</li>';
						}
						$("#judgeShow").html(context)
					}
				}
			});
		});
	
		function clickTrim(source) {
			var id = source.id;
			$("#" + id).find("input").prop("checked", "checked");
			var selectSum = selectTopic == null ? 0 : selectTopic.length;
			if (id <= selectSum * 4) {
				backTrim(id)
			} else {
				backTrim2(id)
			}
	
		}
	
		function submit() {
			layer.confirm("确认提交试卷吗？", {
				icon : 3,
				title : '提示'
			}, function(cindex) {
				submitPaper();
				layer.close(cindex);
			}, function(cindex) {
				layer.close(cindex);
			});
		}
	
		function submitPaper() {
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/exam/submitPaper",
				data : {
					"paperId" : "${paperId}",
					"userId" : "${loginUser.userId}"
				},
				success : function(result) {
					window.location.href="${APP_PATH}/exam/success";			
				}
			});
		}
	
		function backTrim(id) {
			var start = Math.floor((id - 1) / 4) * 4 + 1;
			for (var i = start; i < start + 4; i++) {
				if (i != id) {
					$("#" + i).find("input").prop("checked", false);
				}
			}
		}
		function backTrim2(id) {
			var prop = id % 2 == 0 ? (parseInt(id) - 1) : (parseInt(id) + 1);
			$("#" + prop).find("input").prop("checked", false);
		}
	</script>
</body>
</html>