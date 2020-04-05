package pers.sdd.online.exam.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pers.sdd.online.exam.ajax.bean.AjaxResult;
import pers.sdd.online.exam.bean.MajorBean;
import pers.sdd.online.exam.dao.MajorDao;
import pers.sdd.online.exam.service.MajorService;

@Controller
@RequestMapping("major")
public class MajorController {
	
	@Autowired
	private MajorService majorService;
	
	@RequestMapping("classList")
	private String classList(){
		return "major/classList";
	}
	
	@RequestMapping("majorList")
	private String majorList(){
		return "major/majorList";
	}
	
	@ResponseBody
	@RequestMapping("majorList/doAddMajor")
	public Object doAddMajor(MajorBean major){
		AjaxResult result = new AjaxResult();
		
		try {
			majorService.insertMajor(major);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("majorList/doEditMajor")
	public Object doEditMajor(String oldMajorName, MajorBean major){
		AjaxResult result = new AjaxResult();
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("oldMajorName", oldMajorName);
		paramMap.put("major", major);
		
		try {
//			majorService.updateMajorByName(paramMap);
			majorService.updateMajorByName(paramMap);
			result.setSuccess(true);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("majorList/doDeleteMajor")
	public Object doDeleteMajor(String majorName){
		AjaxResult result = new AjaxResult();
		
		try {
			majorService.deleteMajorByName(majorName);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
		}
		
		return result;
	}
	
	
	@ResponseBody
	@RequestMapping("majorList/doGetMajor")
	public Object doGetMajorList(){
		AjaxResult result = new AjaxResult();
		
		try {
			List<MajorBean> queryMajorList = majorService.queryMajorList();
			result.setData(queryMajorList);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
		}
		
		return result;
	}
}
