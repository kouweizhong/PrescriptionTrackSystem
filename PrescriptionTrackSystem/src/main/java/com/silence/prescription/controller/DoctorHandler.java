package com.silence.prescription.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.silence.prescription.entities.Doctor;
import com.silence.prescription.services.BaseService;

@Scope("prototype")
@Controller
public class DoctorHandler {

	@Autowired
	private BaseService<Doctor> doctorService;

	/*
	 * 跳转到主页面
	 */
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String index(){
		return "index";
	}
	
	/*
	 * 医生登录
	 */
	@RequestMapping(value = "/doctorLogin", method = RequestMethod.POST)
	public String login(@RequestParam("name") String name,@RequestParam("password") String password,
			HttpSession session,Map<String,Object> map) {
		Doctor doctor = new Doctor(name, password);
		if (session.getAttribute("doctor") == null){			
			doctor = doctorService.find(doctor);
		}
		if (doctor != null){
			session.setAttribute("doctor", doctor);
			return "index";
		}else{
			return "forward:/login.html?loginError=true";
		}
	}
	/*
	 *退出 
	 */
	@RequestMapping(value="/doctorLogout",method=RequestMethod.GET)
	public String logout(){
		return "forword:login.html";
	}
}
