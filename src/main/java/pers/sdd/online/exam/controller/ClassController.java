package pers.sdd.online.exam.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pers.sdd.online.exam.ajax.bean.AjaxResult;
import pers.sdd.online.exam.bean.ClassBean;
import pers.sdd.online.exam.bean.StudentClass;
import pers.sdd.online.exam.service.ClassService;
import pers.sdd.online.exam.service.StudentClassService;
import pers.sdd.online.exam.util.MD5Util;

@Controller
@RequestMapping("class")
public class ClassController {

	@Autowired
	private ClassService classService;
	@Autowired
	private StudentClassService studentClassService;

	@RequestMapping("classList")
	public String classList() {
		return "class/classList";
	}
	
	@RequestMapping("studentClassList")
	public String studentClassList(){
		return "class/studentClassList";
	}
	
	@RequestMapping("managerClassList")
	public String managerClassList(){
		return "class/managerClassList";
	}

	@ResponseBody
	@RequestMapping("classList/doEditClass")
	public Object doEditClass(ClassBean newClass){
		AjaxResult result = new AjaxResult();
		
		try {
			classService.updateClass(newClass);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("classList/doDeleteClass")
	public Object doDeleteClass(String classId, String type){
		AjaxResult result = new AjaxResult();
		
		try {
			if (type != null){
				studentClassService.deleteClassRef(classId);
			}
			
			classService.deleteClassById(classId);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("classList/doAddClass")
	public Object doAddClass(String className, String teacherId) {
		AjaxResult result = new AjaxResult();

		try {
			ClassBean insertClass = new ClassBean(MD5Util.getSixLengStr(System.currentTimeMillis()), className,
					teacherId, new Date(System.currentTimeMillis()), null);
			classService.insertClass(insertClass);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
		}

		return result;
	}
	
	@ResponseBody
	@RequestMapping("studentClassList/doJoinList")
	public Object doJoinList(String studentId){
		AjaxResult result = new AjaxResult();
		
		try {
			List<StudentClass> queryList = studentClassService.queryStudentJionById(studentId);
			result.setData(queryList);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("studentClassList/doQuitClass")
	public Object doQuitClass(String studentId, String classId){
		AjaxResult result = new AjaxResult();
		
		try {
			studentClassService.deleteRef(studentId, classId);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("studentClassList/doJoinClass")
	public Object doJoinClass (String classId, String studentId){
		AjaxResult result = new AjaxResult();
		
		try {
			StudentClass refStudentClass = new StudentClass(studentId, classId, new Date(System.currentTimeMillis()), null);
			studentClassService.insertRefJoin(refStudentClass);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
		}
		
		return result;
	}
	

	@ResponseBody
	@RequestMapping("studentClassList/doPageQuery")
	public Object doStudentPageQuery(String queryText) {
		AjaxResult result = new AjaxResult();

		try {
			List<ClassBean> classList = classService.queryClassList();
			result.setData(classList);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}

		return result;
	}


	@ResponseBody
	@RequestMapping("managerClassList/doPageQuery")
	public Object doManagerPageQuery(String queryText) {
		AjaxResult result = new AjaxResult();

		try {
			List<ClassBean> classList = classService.queryClassList();
			result.setData(classList);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}

		return result;
	}
	
	@ResponseBody
	@RequestMapping("classList/doPageQuery")
	public Object doTeacherPageQuery(String queryText, String teacherId) {
		AjaxResult result = new AjaxResult();

		try {
			List<ClassBean> classList = classService.queryClassListByTeacherId(teacherId);
			result.setData(classList);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}

		return result;
	}

}
