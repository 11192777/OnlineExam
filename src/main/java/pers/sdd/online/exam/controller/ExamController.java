package pers.sdd.online.exam.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pers.sdd.online.exam.ajax.bean.AjaxResult;
import pers.sdd.online.exam.bean.PaperPostBean;
import pers.sdd.online.exam.bean.StudentClass;
import pers.sdd.online.exam.bean.TeacherPaper;
import pers.sdd.online.exam.service.GradeService;
import pers.sdd.online.exam.service.PaperPostService;
import pers.sdd.online.exam.service.PaperService;
import pers.sdd.online.exam.service.StudentClassService;
import pers.sdd.online.exam.service.TeacherPaperService;
import pers.sdd.online.exam.service.TeacherService;
import pers.sdd.online.exam.util.TimeUtil;

@Controller
@RequestMapping("exam")
public class ExamController {

	@Autowired
	private TeacherPaperService teacherPaperService;
	@Autowired
	private PaperService paperService;
	@Autowired
	private PaperPostService paperPostService;
	@Autowired
	private TeacherService teacherService;
	@Autowired
	private GradeService gradeService;

	@RequestMapping("startExam")
	public ModelAndView startExam(@RequestParam("paperId") String paperId){
		return new ModelAndView("student/exam/startExam", "paperId", paperId);
	}
	
	@RequestMapping("postExam")
	public String postExam() {
		return "teacher/exam/postExam";
	}

	@RequestMapping("student/getPost")
	public String getPost() {
		return "student/exam/examList";
	}

	@ResponseBody
	@RequestMapping("verifyExamTime")
	public Object verifyExamTime(long sTime, long eTime){
		AjaxResult result = new AjaxResult();
		
		long nowTime = System.currentTimeMillis();
		
		if (sTime > nowTime){
			result.setData("error1");
			result.setSuccess(false);
		}else if (nowTime > eTime){
			result.setData("error2");
			result.setSuccess(false);
		}else{
			result.setSuccess(true);
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("student/doGetExamList")
	public Object doGetExamList(String studentId) {
		AjaxResult result = new AjaxResult();

		try {
			ArrayList<PaperPostBean> posts = paperPostService.queryExamByStudentId(studentId);
			for (int i = 0; i < posts.size(); i++) {
				posts.get(i).setTeacher(teacherService.queryTeacherById(posts.get(i).getTeaId()));
			}
			result.setData(posts);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}

		return result;
	}

	@ResponseBody
	@RequestMapping("doPostExam")
	public Object doPostExam(PaperPostBean post, String sTime, String eTime) {
		AjaxResult result = new AjaxResult();

		long stime = 0l;
		long etime = 0l;
		try {
			stime = TimeUtil.timestampToLong(sTime, TimeUtil.DATE_FORMAT_MS);
			etime = TimeUtil.timestampToLong(eTime, TimeUtil.DATE_FORMAT_MS);

			if (stime < System.currentTimeMillis()) {
				result.setData("error1");
				result.setSuccess(false);
				return result;
			} else if (stime > etime) {
				result.setData("error2");
				result.setSuccess(false);
				return result;
			}

			post.setStartTime(new Timestamp(stime));
			post.setEndTime(new Timestamp(etime));
			paperPostService.insertPostPaper(post);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
			result.setData("error3");
		}

		return result;
	}

	@ResponseBody
	@RequestMapping("teacher/collectPaper")
	public Object teacherCollectPaper(TeacherPaper ref) {
		AjaxResult result = new AjaxResult();

		try {
			ref.setJoinTime(new Timestamp(System.currentTimeMillis()));
			teacherPaperService.insertRef(ref);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
		}

		return result;
	}

	@ResponseBody
	@RequestMapping("teacher/collectPaper/paperList")
	public Object collectPaperPaperList(String teacherId) {
		AjaxResult result = new AjaxResult();

		try {
			ArrayList<TeacherPaper> refList = teacherPaperService.queryPaperListByTeaId(teacherId);
			for (int i = 0; i < refList.size(); i++) {
				refList.get(i).setPaper(paperService.queryPaperById(refList.get(i).getPapId()));
			}
			result.setData(refList);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
		}

		return result;
	}

	@ResponseBody
	@RequestMapping("teacher/collectPaper/doQuitPaper")
	public Object doQuitPaper(TeacherPaper ref) {
		AjaxResult result = new AjaxResult();

		try {
			teacherPaperService.deleteRef(ref);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}

		return result;
	}
	
	@ResponseBody
	@RequestMapping("submitPaper")
	public Object submitPaper(String paperId, String userId){
	
		AjaxResult result = new AjaxResult();
		
		System.out.println(paperId + " " + userId);
		
		try {
			int grade = (int) (Math.random() * 40) + 60; 
			HashMap<String, Object> hash = new ModelMap();
			hash.put("paperId", paperId);
			hash.put("stuId", userId);
			hash.put("score", grade);
			gradeService.insertGrade(hash);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping("success")
	public String success(){
		return "student/exam/success";
	}
}
