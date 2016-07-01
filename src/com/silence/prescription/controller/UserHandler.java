package com.silence.prescription.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.silence.prescription.entities.User;
import com.silence.prescription.services.UserService;
import com.silence.prescription.utils.InsuranceCompany;

@Scope("prototype")
@Controller
public class UserHandler {

	@Autowired
	private UserService userService;
	private static Gson gson = new Gson();

	/*
	 * 获取不同年龄的人数
	 */
	@RequestMapping(value="/getCountByAge",method=RequestMethod.GET)
	public void getCountByAge(HttpServletResponse response) throws IOException{
		List<Object[]> data = userService.findByAgeCount();
		System.out.println(gson.toJson(data));
		response.getWriter().print(gson.toJson(data));
	}
	/*
	 * 获取所有病人的年 月 日
	 */
	@RequestMapping(value="/findByYeayMontheDay",method=RequestMethod.GET)
	public void getDate(HttpServletResponse response) throws IOException{
		List<Object[]> data = userService.findByYeayMontheDay();
		response.getWriter().println(gson.toJson(data).replaceAll("\"", ""));
	}

	/*
	 * 获取各个承保公司的人数
	 */
	@RequestMapping(value="/getData",method=RequestMethod.GET)
	public void getData(HttpServletResponse response) throws IOException{
		Long total = userService.count();
		List<Object[]> infos = userService.get();
		Set<InsuranceCompany> sets = new HashSet<InsuranceCompany>();
		for (Object [] obj : infos){
			InsuranceCompany c = new InsuranceCompany((String) obj[1],
					((Long) obj[0]).doubleValue() / total.doubleValue() * 100);
			sets.add(c);
		}
		response.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		writer.print(gson.toJson(sets));
	}

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
		count = (count % 7 == 0 ? count / 7 : count / 7 + 1);
		if (page > count){
			page = count.intValue();
		}
		List<User> users = userService.findPage(page, 7);
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
	/*
	 * 检查电话号码是否存在
	 */
	@RequestMapping(value="/checkExistTelephone",method=RequestMethod.POST)
	public void checkTelephone(@RequestParam("telephone") String telephone,
			PrintWriter writer){
		User user = new User(telephone);
		if (userService.exist(user) == null){
			writer.print(1);
			return;
		}
		writer.print(0);
	}
}
