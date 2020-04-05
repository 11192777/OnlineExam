package pers.sdd.online.exam.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileUpload;
import org.apache.log4j.jmx.LoggerDynamicMBean;
import org.apache.taglibs.standard.lang.jstl.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import pers.sdd.online.exam.ajax.bean.AjaxResult;
import pers.sdd.online.exam.bean.JudeTopicBean;
import pers.sdd.online.exam.bean.PaperBean;
import pers.sdd.online.exam.bean.SelectTopicBean;
import pers.sdd.online.exam.bean.UserBean;
import pers.sdd.online.exam.java.bean.LocalPaperBean;
import pers.sdd.online.exam.service.CourseService;
import pers.sdd.online.exam.service.JudeTopicService;
import pers.sdd.online.exam.service.PaperService;
import pers.sdd.online.exam.service.SelectTopicService;
import pers.sdd.online.exam.util.DomParserUtil;
import pers.sdd.online.exam.util.FileUtil;

@Controller
@RequestMapping("paper")
public class PaperController {

	@Autowired
	private SelectTopicService selectTopicService;
	@Autowired
	private JudeTopicService judeTopicService;
	@Autowired
	private PaperService paperService;
	@Autowired
	private CourseService courseService;

	@RequestMapping("paperEdit")
	public String paperEdit() {
		return "teacher/paper/paperEdit";
	}

	@RequestMapping("paperEdit/step2")
	public String paperEditStep2() {
		return "teacher/paper/paperStep2";
	}

	@RequestMapping("paperEdit/step3")
	public String paperEditStep3() {
		return "teacher/paper/paperStep3";
	}

	@RequestMapping("addSelectTopic")
	public String addSelectTopic() {
		return "teacher/paper/addSelectTopic";
	}

	@RequestMapping("addJudgeTopic")
	public String addJudgeTopic() {
		return "teacher/paper/addJudgeTopic";
	}

	@RequestMapping("paperList")
	public String paperList() {
		return "manager/paper/paperList";
	}

	@RequestMapping("paperList/showPaper")
	public ModelAndView showPaper(@RequestParam("paperId") String paperId) {
		return new ModelAndView("manager/paper/showPaper", "paperId", paperId);
	}

	@RequestMapping("importPaper")
	public String importPaper() {
		return "manager/paper/importPaper";
	}
	
	@RequestMapping("teacher/importPaper")
	public String teacherImportPaper(){
		return "teacher/paper/importPaper";
	}

	@RequestMapping("teacher/paperList")
	public String teacherPaperList() {
		return "teacher/paper/paperList";
	}
	
	@RequestMapping("teacher/paperFavorites")
	public String paperFavorites(){
		return "teacher/paperFavorites/paperList";
	}
	
	@RequestMapping("doImportPaper")
	public ModelAndView importPaper(HttpServletRequest httpRequest) throws Exception {

		MultipartHttpServletRequest request = (MultipartHttpServletRequest) httpRequest;

		MultipartFile paperFile = request.getFile("paperUpFile");

		long time = System.currentTimeMillis();
		UserBean loginUser = (UserBean) httpRequest.getSession().getAttribute("loginUser");
		String savePath = PaperController.class.getClassLoader().getResource("").toString().substring(6) + "paper/"
				+ loginUser.getUserId() + time + ".xml";
		File file = new File(savePath);
		paperFile.transferTo(file);

		if (!DomParserUtil.vertifyParseLocalPaper(savePath)) {
			file.delete();
			return new ModelAndView("manager/paper/importPaper", "paperId", "error");
		}

		String paperName = httpRequest.getParameter("paperName");
		String majorName = httpRequest.getParameter("majorSelect");
		String courseId = httpRequest.getParameter("courseSelect");
		PaperBean paper = new PaperBean(null, loginUser.getUserId(), majorName, Integer.parseInt(courseId), savePath,
				new Timestamp(time), paperName, null);
		try {
			paperService.insertPaper(paper);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ModelAndView("manager/paper/importPaper", "paperId", paper.getPapId());
	}
	
	@RequestMapping("teacher/doImportPaper")
	public ModelAndView teacherImportPaper(HttpServletRequest httpRequest) throws Exception {

		MultipartHttpServletRequest request = (MultipartHttpServletRequest) httpRequest;

		MultipartFile paperFile = request.getFile("paperUpFile");

		long time = System.currentTimeMillis();
		UserBean loginUser = (UserBean) httpRequest.getSession().getAttribute("loginUser");
		String savePath = PaperController.class.getClassLoader().getResource("").toString().substring(6) + "paper/"
				+ loginUser.getUserId() + time + ".xml";
		File file = new File(savePath);
		paperFile.transferTo(file);

		if (!DomParserUtil.vertifyParseLocalPaper(savePath)) {
			file.delete();
			return new ModelAndView("teacher/paper/importPaper", "paperId", "error");
		}

		String paperName = httpRequest.getParameter("paperName");
		String majorName = httpRequest.getParameter("majorSelect");
		String courseId = httpRequest.getParameter("courseSelect");
		PaperBean paper = new PaperBean(null, loginUser.getUserId(), majorName, Integer.parseInt(courseId), savePath,
				new Timestamp(time), paperName, null);
		try {
			paperService.insertPaper(paper);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ModelAndView("teacher/paper/importPaper", "paperId", paper.getPapId());
	}

	@ResponseBody
	@RequestMapping("paperList/doShowPaper")
	public Object doShowPaper(Integer paperId) {
		AjaxResult result = new AjaxResult();

		try {
			PaperBean paper = paperService.queryPaperById(paperId);
			LocalPaperBean localPaper = DomParserUtil.parseLocalPaper(paper.getUrl());
			result.setData(localPaper);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return result;
	}

	@ResponseBody
	@RequestMapping("paperList/doShowLocalPaper")
	public Object doShowLocalPaper(String filePath) {

		AjaxResult result = new AjaxResult();

		LocalPaperBean localPaper = null;
		try {
			localPaper = DomParserUtil.parseLocalPaper(filePath);
			result.setSuccess(true);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result.setSuccess(false);
		}
		result.setData(localPaper);

		return result;

	}

	@ResponseBody
	@RequestMapping("paperList/doDeletePaper")
	public Object doDeletePaper(Integer paperId) {
		AjaxResult result = new AjaxResult();

		try {
			PaperBean paper = paperService.queryPaperById(paperId);
			paperService.deletePaperById(paperId);
			FileUtil.deleteFile(paper.getUrl());
			paperService.updateIncrementId();
			paperService.alterAutoIncrementId(paperService.queryCourseTotal() + 1);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}

		return result;
	}

	@ResponseBody
	@RequestMapping("paperList/doPageQuery")
	public Object doPageQuery(String majorName, Integer courseId) {
		AjaxResult result = new AjaxResult();

		List<PaperBean> paperList = paperService.queryPaperListByParamer(majorName, courseId);
		for (int i = 0; i < paperList.size(); i++) {
			paperList.get(i).setCourse(courseService.queryCourseById(paperList.get(i).getCouId()));
		}
		result.setData(paperList);

		return result;
	}

	@ResponseBody
	@RequestMapping("doLoadSelectTopic")
	public Object doLoadSelectTopic(String[] topicIdList) {
		AjaxResult result = new AjaxResult();

		List<SelectTopicBean> topicList = new ArrayList<SelectTopicBean>();
		if (topicIdList != null) {
			for (String s : topicIdList) {
				topicList.add(selectTopicService.queryTopicById(Integer.parseInt(s)));
			}
		}
		result.setData(topicList);
		return result;
	}

	@ResponseBody
	@RequestMapping("doLoadJudgeTopic")
	public Object doLoadJudgeTopic(String[] topicIdList) {
		AjaxResult result = new AjaxResult();

		List<JudeTopicBean> topicList = new ArrayList<JudeTopicBean>();
		if (topicIdList != null) {
			for (String s : topicIdList) {
				topicList.add(judeTopicService.queryTopicById(Integer.parseInt(s)));
			}
		}
		result.setData(topicList);
		return result;
	}

	@ResponseBody
	@RequestMapping("doAddPaper")
	public Object doAddPaper(Integer courseId, String majorName, String paperName, String teacherId,
			String[] selectTopic, String[] judgeTopic) {

		AjaxResult result = new AjaxResult();

		LocalPaperBean localPaper = new LocalPaperBean();
		if (selectTopic != null) {
			localPaper.setSelectTopicList(new ArrayList<SelectTopicBean>());
			for (String str : selectTopic) {
				localPaper.getSelectTopicList().add(selectTopicService.queryTopicById(Integer.parseInt(str)));
			}
		}
		if (judgeTopic != null) {
			localPaper.setJudgeTopicList(new ArrayList<JudeTopicBean>());
			for (String str : judgeTopic) {
				localPaper.getJudgeTopicList().add(judeTopicService.queryTopicById(Integer.parseInt(str)));
			}
		}

		long time = System.currentTimeMillis();
		PaperBean paper = new PaperBean(null, teacherId, majorName, courseId,
				PaperController.class.getClassLoader().getResource("").toString().substring(6) + "paper/" + teacherId
						+ time + ".xml",
				new Timestamp(time), paperName, null);
		paperService.insertPaper(paper);

		try {
			DomParserUtil.saveXMLFile(DomParserUtil.generatePaperXML(localPaper), paper.getUrl());
		} catch (IOException e) {
			e.printStackTrace();
		}

		result.setSuccess(true);

		return result;
	}

}
