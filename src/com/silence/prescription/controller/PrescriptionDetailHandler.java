package com.silence.prescription.controller;

import java.io.PrintWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.silence.prescription.entities.PrescriptionDetail;
import com.silence.prescription.services.PrescriptionDetailService;

@Controller
public class PrescriptionDetailHandler {

	@Autowired
	private PrescriptionDetailService prescriptionDetailService;
	
	@RequestMapping(value="/saveUpdateDetail",method=RequestMethod.POST)
	public void saveUpdateDetail(@RequestParam("id") Integer id,@RequestParam("count") Integer count,
			@RequestParam("canuse") String canuse,@RequestParam("unit") String unit,
			@RequestParam("takemethod") String takemethod,PrintWriter writer){
		PrescriptionDetail p = new PrescriptionDetail(id, count, unit, takemethod, canuse);
		prescriptionDetailService.update(p);
		writer.print(1);
	}
	
	@RequestMapping(value="/deletePreDetail")
	public void deletePreDetail(@RequestParam("id") Integer id,PrintWriter writer){
		prescriptionDetailService.delete(id);
		writer.print(1);
	}
}
