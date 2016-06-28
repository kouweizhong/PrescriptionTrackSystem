package com.silence.prescription.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.silence.prescription.entities.Doctor;
import com.silence.prescription.entities.Medicine;
import com.silence.prescription.entities.Prescription;
import com.silence.prescription.entities.PrescriptionDetail;
import com.silence.prescription.entities.User;
import com.silence.prescription.services.BaseService;
import com.silence.prescription.utils.PrescriptionDetailOperator;
import com.silence.prescription.utils.PrescriptionOperator;

@Controller
public class PrescriptionHandler {

	private static Logger logger = LoggerFactory.getLogger(PrescriptionHandler.class);
	@Autowired
	private BaseService<User> userService;
	@Autowired
	private BaseService<Medicine> medicineService;
	@Autowired
	private BaseService<Prescription> prescriptionService;

	/*
	 *  更新处方可取次数
	 */
	@RequestMapping(value="/decreasePrescription",method=RequestMethod.GET)
	public void decreasePrescription(@RequestParam("id") Integer id,PrintWriter writer){
		prescriptionService.update(id);
		writer.print(1);
	}
	
	/*
	 * 查询一个处方信息
	 */
	@RequestMapping(value="/preDetails",method=RequestMethod.GET)
	public String findPrescriptionDetail(@RequestParam("pid") Integer id,
			Map<String, Object> map){
		Prescription prescription = prescriptionService.find(id);
		map.put("prescription", prescription);
		return "medicinedrawdetail";
	}
	
	/*
	 * 获取最新的一个处方信息
	 */
	@RequestMapping(value="/findLastPrescription",method=RequestMethod.POST)
	public void findLastPrescription(HttpServletResponse response) throws IOException{		
		Prescription prescription = prescriptionService.search();
		StringBuffer result = new StringBuffer();
		result.append(prescription.getBegindate()).append(",");
		result.append(prescription.getId()).append(",");
		result.append(prescription.getEnddate()).append(",");
		result.append(prescription.getCrawlagainst()).append(",");
		result.append(prescription.getUser().getName()).append(",");
		result.append(prescription.getDoctor().getName()).append(",");
		result.append(prescription.getId()).append(",");
		response.setCharacterEncoding("utf-8");
		response.getWriter().print(result.toString());
	}
	
	/*
	 * 取药  查询所有处方信息
	 */
	@RequestMapping(value="/medicinefindpres",method=RequestMethod.GET)
	public String mFindPrescriptions(Map<String, Object> map){
		List<Prescription> prescriptions = prescriptionService.find();
		map.put("prescriptions", prescriptions);
		return "medicinedraw";
	}
	/*
	 * 查询每个用户的处方信息以及数量
	 */
	@RequestMapping(value="/findPrescriptionsByUserCount",method=RequestMethod.GET)
	public String findPrescriptionsByUserCount(Map<String, Object> map){
		List<Object[]> lists = prescriptionService.get();
		map.put("infos", lists);
		return "showprecount";
	}
	/*
	 * 查询所所的处方
	 */
	@RequestMapping(value="/findpres",method=RequestMethod.GET)
	public String findPrescriptions(Map<String, Object> map){
		List<Prescription> prescriptions = prescriptionService.find();
		map.put("prescriptions", prescriptions);
		return "showprescriptions";
	}
	/*
	 * 更新处方信息
	 */
	@RequestMapping(value="updatePrescription",method=RequestMethod.POST)
	public void updatePrescription(@RequestParam("crawlagainst") Integer crawlagainst,
			@RequestParam("enddate") Date enddate,@RequestParam("id") Integer id,
			PrintWriter writer){
		Prescription pre = new Prescription(id, enddate, crawlagainst); 
		System.out.println(enddate.toString());
		prescriptionService.update(pre);
		writer.print(1);
	}
	/*
	 *  根据处方的id编号查询处方信息
	 *  pid 处方id
	 */
	@RequestMapping(value="/updatePre/{pid}",method=RequestMethod.GET)
	public String findPrescription(@PathVariable("pid") Integer pid,
			Map<String,Object> map){
		Prescription prescription = prescriptionService.find(pid);
		List<Medicine> medicines = medicineService.find();
		map.put("medicines", medicines);
		map.put("prescription", prescription);
		return "updatepre";
	}
	
	/*
	 * 删除处方信息
	 * pid 处方id编号
	 * uid 用户id编号
	 */
	@RequestMapping(value="/deletePre/{pid}/{uid}",method=RequestMethod.GET)
	public String deletePrescription(@PathVariable("pid") Integer pid,
			@PathVariable("uid") Integer uid){ 
		prescriptionService.delete(pid);
		return "redirect:/findPre/"+uid;
	}
	
	/*
	 * 根据用户的id查找处方记录
	 */
	@RequestMapping("/findPre/{id}")
	public String findPre(@PathVariable("id") Integer id,Map<String,Object> map){
		List<Prescription> prescriptions = prescriptionService.get(id);
		Collections.reverse(prescriptions);
		map.put("prescriptions", prescriptions);
		return "findpre";
	}
	
	/*
	 * 保存处方详细信息
	 */
	@RequestMapping(value="/addPrescription",method=RequestMethod.POST)
	public String addPrescription(@ModelAttribute("prescription") Prescription prescription,
			BindingResult result,HttpSession session,@RequestParam("id") Integer id){
		//获取doctor对象，该处方隶属的医师
		Doctor doctor = (Doctor)session.getAttribute("doctor");
		//获取用户的对象，该处方隶属的用户
		User user = userService.find(id);
		//设置处方基本信息
		prescription.setBegindate(new Date());
		prescription.setDoctor(doctor);
		prescription.setUser(user);
		//获取保存在session中的处方信息
		PrescriptionOperator pre = (PrescriptionOperator) session.getAttribute("pre");
		Set<PrescriptionDetail> sets = new HashSet<PrescriptionDetail>();
		for (PrescriptionDetailOperator detail : pre.getPreDetail()){
			PrescriptionDetail p = new PrescriptionDetail();
			p.setCount(detail.getCount());
			p.setTakemethod(detail.getTakeMethod());
			p.setUnit(detail.getUnit());
			p.setMedicine(detail.getMedicine());
			p.setPrescription(prescription);
			p.setCanuse(detail.getCanuse());
			sets.add(p);
		}
		prescription.setPrescriptionDetails(sets);
		prescriptionService.add(prescription);
		session.removeAttribute("pre");
		return "redirect:findPre/"+user.getId();
	}
	
	/*
	 *  移除暂时保存在session中的处方详细信息
	 */
	@RequestMapping(value="/deletePrescriptionDetail",method=RequestMethod.POST)
	public void deletePrescriptionDetail(@RequestParam("id") Integer id,
			HttpSession session,PrintWriter writer){
		PrescriptionOperator pre = (PrescriptionOperator) session.getAttribute("pre");
		if (pre != null){
			pre.removePreDetail(id);
			logger.info("移除了处方详细中的数据，该药物的id为 " + id);
			writer.print(1);
		}
	}
	
	/*
	 * 暂时保存处方详细
	 */
	@RequestMapping(value="/addPrescriptionDetail",method=RequestMethod.POST)
	public void addPrescriptionDetail(@RequestParam("id") Integer id,@RequestParam("count") Integer count,
			@RequestParam("unit") String unit,@RequestParam("take_method") String takemethod,
			@RequestParam("canuse") String canuse,HttpSession session,PrintWriter writer){
		//该处方详细所添加的药物
		Medicine medicine = medicineService.find(id);
		//创建处方详细对象
		PrescriptionDetailOperator preDetailOperator = 
				new PrescriptionDetailOperator(count, unit, medicine, takemethod, canuse);
		PrescriptionOperator pre = (PrescriptionOperator) session.getAttribute("pre");
		if (pre == null){
			pre = new PrescriptionOperator();
		}
		pre.addPrescriptionDetail(preDetailOperator);
		session.setAttribute("pre", pre);
		logger.info("添加了处方详细信息！");
		writer.print(1);
	}
	/*
	 * 跳转到添加处方的页面
	 */
	@RequestMapping(value="/addPre",method=RequestMethod.GET)
	public String addPre(Map<String, Object> map,HttpSession session){
		List<User> users = userService.find();
		List<Medicine> medicines = medicineService.find();
		map.put("users", users);
		map.put("medicines", medicines);
		session.removeAttribute("pre");
		return "addpre";
	}
}
