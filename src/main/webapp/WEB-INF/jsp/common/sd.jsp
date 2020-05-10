<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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