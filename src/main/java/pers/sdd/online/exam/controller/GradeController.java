package pers.sdd.online.exam.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pers.sdd.online.exam.ajax.bean.AjaxResult;
import pers.sdd.online.exam.bean.GradeBean;
import pers.sdd.online.exam.bean.PaperBean;
import pers.sdd.online.exam.service.CourseService;
import pers.sdd.online.exam.service.GradeService;
import pers.sdd.online.exam.service.PaperService;
import pers.sdd.online.exam.service.StudentService;

@Controller
@RequestMapping("grade")
public class GradeController {

	@Autowired
	private GradeService gradeService;

	@Autowired
	private PaperService paperService;

	@Autowired
	private CourseService courseService;
	
	@RequestMapping("myGrade")
	public String myGrade() {
		return "student/grade/myGrade";
	}

	@RequestMapping("allGrade")
	public String allGrade() {
		return "student/grade/allGrade";
	}

	@ResponseBody
	@RequestMapping("ajax/myGrade")
	public Object myGrade(String studentId) {
		AjaxResult result = new AjaxResult();

		try {
			ArrayList<GradeBean> grades = gradeService.queryGrade(studentId);

			for (GradeBean grade : grades) {
				PaperBean paperBean = paperService.queryPaperById(grade.getPapId());
				grade.setCourseName(courseService.queryCourseById(paperBean.getCouId()).getCouName());
				grade.setPaperName(paperBean.getPaperName());
			}
			result.setData(grades);
			System.out.println(grades);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
			e.printStackTrace();
		}

		return result;
	}

	@ResponseBody
	@RequestMapping("ajax/allGrade")
	public Object allGrade(String studentId) {
		AjaxResult result = new AjaxResult();

		try {
			ArrayList<GradeBean> grades = gradeService.queryAllGrade();

			for (GradeBean grade : grades) {
				PaperBean paperBean = paperService.queryPaperById(grade.getPapId());
				grade.setCourseName(courseService.queryCourseById(paperBean.getCouId()).getCouName());
				grade.setPaperName(paperBean.getPaperName());
			}
			result.setData(grades);
			System.out.println(grades);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
			e.printStackTrace();
		}

		return result;
	}
}
