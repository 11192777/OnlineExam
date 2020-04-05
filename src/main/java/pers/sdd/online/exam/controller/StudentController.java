package pers.sdd.online.exam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pers.sdd.online.exam.ajax.bean.AjaxResult;
import pers.sdd.online.exam.ajax.bean.PageBean;
import pers.sdd.online.exam.bean.ClassBean;
import pers.sdd.online.exam.bean.MajorBean;
import pers.sdd.online.exam.bean.StudentBean;
import pers.sdd.online.exam.bean.UserBean;
import pers.sdd.online.exam.service.ClassService;
import pers.sdd.online.exam.service.MajorService;
import pers.sdd.online.exam.service.StudentService;
import pers.sdd.online.exam.service.UserService;
import pers.sdd.online.exam.util.MD5Util;
import pers.sdd.online.exam.util.StringUtil;

@Controller
@RequestMapping("student")
public class StudentController {

	@Autowired
	private StudentService studentService;
	@Autowired 
	private UserService userService;
	@Autowired 
	private MajorService majorService;
	@Autowired
	private ClassService classService;
	

	
	@RequestMapping("studentList")
	public String studentList() {
		return "student/studentList";
	}
	
	@RequestMapping("studentList/addStudent")
	public String addStudent(){
		return "student/addStudent";
	}
	
	@RequestMapping("studentJoinList")
	public String studentJoinList(){
		return "class/joinClassList";
	}
	
	@ResponseBody
	@RequestMapping("studentList/doGetMajor")
	public Object doGetMajor() {
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
	@RequestMapping("studentList/doGetClass")
	public Object doGetClass() {
		AjaxResult result = new AjaxResult();

		try {
			List<ClassBean> classList = classService.queryClassList();
			result.setData(classList);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
		}
		return result;
	}

	
	
	@ResponseBody
	@RequestMapping("studentList/doAddStudent")
	public Object doAddStudent(StudentBean student){
		AjaxResult result = new AjaxResult();
		
		try {
			userService.insertUser(new UserBean(student.getUserId(), MD5Util.digest("123123"), 2, null));
			studentService.insertStudent(student);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
		}
		
		return result;
	}

	@ResponseBody
	@RequestMapping("studentList/doDeleteStudent")
	public Object doDeleteStudent(String userId) {

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
	@RequestMapping("studentList/doPageQuery")
	public Object pageQuery(String queryText) {
		PageBean<StudentBean> pageBean = new PageBean<StudentBean>();

		if (queryText == null){
			List<StudentBean> studentList = studentService.queryStudentList();
			pageBean.setDatas(studentList);
		}else{
			List<StudentBean> studentList = studentService.queryFuzzyStudentList(StringUtil.fuzzyQueryStringDeal(queryText));
			pageBean.setDatas(studentList);
		}
		
		return pageBean;

	}

}
