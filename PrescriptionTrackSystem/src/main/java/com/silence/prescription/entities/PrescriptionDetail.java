package com.silence.prescription.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="prescriptiondetail")
public class PrescriptionDetail {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	//该药的数量
	@Column(length=4)
	private int count;
	//该药的单位
	@Column(length=16)
	private String unit;
	@Column(length=128)
	private String takemethod;
	@Column(length=16)
	private String canuse;
	@ManyToOne(fetch=FetchType.LAZY,targetEntity=Prescription.class,optional=false)
	@JoinColumn(name="pid")
	private Prescription prescription;
	@ManyToOne(fetch=FetchType.LAZY,targetEntity=Medicine.class,optional=false)
	@JoinColumn(name="mid")
	private Medicine medicine;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

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

	public String getTakemethod() {
		return takemethod;
	}

	public void setTakemethod(String takemethod) {
		this.takemethod = takemethod;
	}

	public String getCanuse() {
		return canuse;
	}

	public void setCanuse(String canuse) {
		this.canuse = canuse;
	}

	public Prescription getPrescription() {
		return prescription;
	}

	public void setPrescription(Prescription prescription) {
		this.prescription = prescription;
	}

	public Medicine getMedicine() {
		return medicine;
	}

	public void setMedicine(Medicine medicine) {
		this.medicine = medicine;
	}

	public PrescriptionDetail() {
		super();
	}

	public PrescriptionDetail(int id, int count, String unit,
			String takemethod, String canuse) {
		super();
		this.id = id;
		this.count = count;
		this.unit = unit;
		this.takemethod = takemethod;
		this.canuse = canuse;
	}
	
}
