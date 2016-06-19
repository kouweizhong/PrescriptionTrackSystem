package com.silence.prescription.controller;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.silence.prescription.entities.User;
import com.silence.prescription.services.BaseService;

@Scope("prototype")
@Controller
public class UserHandler {

	@Autowired
	private BaseService<User> userService;

	/*
	 * 全表扫面病人的信息
	 */
	@RequestMapping(value="/findPreByAll",method=RequestMethod.POST)
	public String findPreByAll(@RequestParam("search") String search,
			Map<String,Object> map){
		List<User> users = userService.find(new String[]{search});
		map.put("users", users);
		return "findusers";
	}
	
	/*
	 * 更新病人
	 */
	@RequestMapping(value="/updateUser",method=RequestMethod.POST)
	public void updateUser(@RequestParam("id") Integer id,@RequestParam("name") String name,
			@RequestParam("birthday") Date birthday,@RequestParam("telephone") String telephone,
			@RequestParam("insuranceCompany") String insuranceCompany,
			@RequestParam("polictNumber") String polictNumber,PrintWriter writer){
		User user = new User(id, name, telephone, birthday, insuranceCompany, polictNumber);
		userService.update(user);
		writer.print(1);
	}
	/*
	 * 分页查询病人
	 */
	@RequestMapping(value="/findUsersByPage",method=RequestMethod.GET)
	public String findUsersByPage(@RequestParam("page") Integer page,
			Map<String,Object> map){
		//总共有多少记录
		Long count = userService.count();
		count = (count % 8 == 0 ? count / 8 : count / 8 + 1);
		if (page > count){
			page = count.intValue();
		}
		List<User> users = userService.findPage(page, 8);
		map.put("users", users);
		map.put("count", count);
		map.put("page", page);
		return "showusers";
	}
	/*
	 * 删除病人
	 */
	@RequestMapping(value="/deleteUser",method=RequestMethod.POST)
	public void deleteUser(@RequestParam("id") Integer id,PrintWriter writer){
		userService.delete(id);
		writer.print(1);
	}
	
	/*
	 * 保存用户
	 */
	@RequestMapping(value="/saveUser",method=RequestMethod.POST)
	public String saveUser(@ModelAttribute @Valid User user,BindingResult result){
		userService.add(user);
		return "redirect:findUsersByPage?page=1";
	}
	/*
	 * 查找所有的用户
	 */
	@RequestMapping(value = "/findUsers", method = RequestMethod.GET)
	public String findUser(Map<String,Object> map) {
		List<User> users = userService.find();
		map.put("users", users);
		return "users";
	}
	/*
	 * 跳转到添加用户的界面
	 */
	@RequestMapping(value="addUser")
	public String addUser(){
		return "adduser";
	}
}
