package pers.sdd.online.exam.controller;

import java.sql.Date;
import java.time.LocalTime;
import java.util.List;

import org.apache.ibatis.executor.ReuseExecutor;
import org.apache.tomcat.jni.Time;
import org.joda.time.Instant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pers.sdd.online.exam.ajax.bean.AjaxResult;
import pers.sdd.online.exam.bean.CourseBean;
import pers.sdd.online.exam.bean.MajorBean;
import pers.sdd.online.exam.service.CourseService;
import pers.sdd.online.exam.service.MajorService;

@Controller
@RequestMapping("course")
public class CourseController {

	@Autowired
	private CourseService courseService;
	@Autowired
	private MajorService majorService;

	@RequestMapping("courseList")
	public String courseList() {
		return "course/courseList";
	}

	@RequestMapping("courseList/addCourse")
	public String addCourse() {
		return "course/addCourse";
	}

	@ResponseBody
	@RequestMapping("courseList/doEditCourse")
	public Object doEditCourse(CourseBean course) {
		AjaxResult result = new AjaxResult();

		try {
			CourseBean queryCourse = courseService.queryCourseByNameAndMajor(course);
			if (queryCourse == null) {
				course.setCouUpdate(new Date(System.currentTimeMillis()));
				courseService.updateCourse(course);
				result.setSuccess(true);
			} else {
				result.setSuccess(false);
			}
		} catch (Exception e) {
			result.setSuccess(false);
		}

		return result;
	}

	@ResponseBody
	@RequestMapping("courseList/doAddCourse")
	public Object doAddCourse(CourseBean course) {

		AjaxResult result = new AjaxResult();

		try {
			CourseBean insertCouse = new CourseBean(null, course.getCouName(), course.getCouMajor(),
					new Date(System.currentTimeMillis()));

			CourseBean queryCourse = courseService.queryCourseByNameAndMajor(course);
			if (queryCourse == null) {
				courseService.insertCourse(insertCouse);
				result.setSuccess(true);
			} else {
				result.setSuccess(false);
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}

		return result;
	}

	@ResponseBody
	@RequestMapping("courseList/doDeleteCourse")
	public Object doDeleteCourse(String courseId) {
		AjaxResult result = new AjaxResult();

		try {
			courseService.deleteCourseById(courseId);
			courseService.updateIncrementId();
			courseService.alterAutoIncrementId(courseService.queryCourseTotal() + 1);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(true);
		}
		return result;
	}

	@ResponseBody
	@RequestMapping("courseList/doGetMajor")
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
	@RequestMapping("courseList/doPageQuery")
	public Object doPageQuery() {
		AjaxResult result = new AjaxResult();

		try {
			List<CourseBean> queryCourse = courseService.queryCourseList();
			result.setData(queryCourse);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
		}

		return result;
	}
}
