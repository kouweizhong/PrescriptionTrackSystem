package com.silence.prescription.utils; 

import com.silence.prescription.entities.Medicine;


/**
 * 处方详细对象
 */
public class PrescriptionDetailOperator {
	
	private int count;
	private String unit;
	private Medicine medicine;
	private String takeMethod;
	private String canuse;
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public Medicine getMedicine() {
		return medicine;
	}
	public void setMedicine(Medicine medicine) {
		this.medicine = medicine;
	}
	public String getTakeMethod() {
		return takeMethod;
	}
	public void setTakeMethod(String takeMethod) {
		this.takeMethod = takeMethod;
	}
	public String getCanuse() {
		return canuse;
	}
	public void setCanuse(String canuse) {
		this.canuse = canuse;
	}
	public PrescriptionDetailOperator(int count, String unit,
			Medicine medicine, String takeMethod, String canuse) {
		super();
		this.count = count;
		this.unit = unit;
		this.medicine = medicine;
		this.takeMethod = takeMethod;
		this.canuse = canuse;
	}
	public PrescriptionDetailOperator() {
		super();
	}
	
}
	
