package com.silence.prescription.utils;

public class InsuranceCompany {

	private String name;
	private double y;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getY() {
		return y;
	}
	public void setY(double y) {
		this.y = y;
	}
	public InsuranceCompany(String name, double y) {
		super();
		this.name = name;
		this.y = y;
	}
	public InsuranceCompany() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
