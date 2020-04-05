package pers.sdd.online.exam.controller;

import java.util.List;

import org.apache.taglibs.standard.tag.common.core.SetSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pers.sdd.online.exam.ajax.bean.AjaxResult;
import pers.sdd.online.exam.ajax.bean.PageBean;
import pers.sdd.online.exam.bean.MajorBean;
import pers.sdd.online.exam.bean.TeacherBean;
import pers.sdd.online.exam.bean.UserBean;
import pers.sdd.online.exam.service.MajorService;
import pers.sdd.online.exam.service.TeacherService;
import pers.sdd.online.exam.service.UserService;
import pers.sdd.online.exam.util.MD5Util;
import pers.sdd.online.exam.util.StringUtil;

@Controller
@RequestMapping("teacher")
public class TeacherController {
	@Autowired
	private TeacherService teacherService;
	@Autowired
	private UserService userService;
	@Autowired
	private MajorService majorService;

	@RequestMapping("teacherList")
	public String teacherList() {
		return "teacher/teacherList";
	}

	@RequestMapping("teacherList/addTeacher")
	public String addTeacher() {
		return "teacher/addTeacher";
	}

	@ResponseBody
	@RequestMapping("teacherList/doGetMajor")
	public Object doGetMajor(){
		AjaxResult result = new AjaxResult();
		
		try {
			List<MajorBean> majorList = majorService.queryMajorList();
			result.setData(majorList);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
		}
		
		return result;
		
	}

	@ResponseBody
	@RequestMapping("teacherList/doAddTeacher")
	public Object doAddTeacher(TeacherBean teacher) {
		AjaxResult result = new AjaxResult();

		try {
			userService.insertUser(new UserBean(teacher.getUserId(), MD5Util.digest("123456"), 1, null));
			teacherService.insertTeacher(teacher);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}

		return result;
	}

	@ResponseBody
	@RequestMapping("teacherList/doDeleteTeacher")
	public Object doDeleteteacher(String userId) {

		AjaxResult result = new AjaxResult();

		try {
			userService.deleteUserById(userId);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
		}

		return result;
	}

	@ResponseBody
	@RequestMapping("teacherList/doPageQuery")
	public Object pageQuery(String queryText) {
		PageBean<TeacherBean> pageBean = new PageBean<TeacherBean>();

		if (queryText == null) {
			List<TeacherBean> teacherList = teacherService.queryTeacherList();
			pageBean.setDatas(teacherList);
		} else {
			List<TeacherBean> teacherList = teacherService
					.queryFuzzyTeacherList(StringUtil.fuzzyQueryStringDeal(queryText));
			pageBean.setDatas(teacherList);
		}

		return pageBean;

	}
}
