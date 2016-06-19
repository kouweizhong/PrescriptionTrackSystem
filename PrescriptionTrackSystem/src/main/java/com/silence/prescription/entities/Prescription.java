package com.silence.prescription.entities;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="prescription")
public class Prescription {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@DateTimeFormat(pattern="MM/dd/yyyy")
	@Temporal(TemporalType.DATE)
	//处方开始日期
	private Date begindate;
	@DateTimeFormat(pattern="MM/dd/yyyy")
	@Temporal(TemporalType.DATE)
	//处方终止日期
	private Date enddate;
	//有效抓要次数
	@Column(length=4)
	private int crawlagainst;
	//处方所属用户
	@ManyToOne(fetch=FetchType.LAZY,targetEntity=User.class,optional=false)
	@JoinColumn(name="uid")
	private User user;
	//处方所属医生
	@ManyToOne(fetch=FetchType.LAZY,targetEntity=Doctor.class,optional=false)
	@JoinColumn(name="did")
	private Doctor doctor;
	
	@OneToMany(fetch=FetchType.EAGER,mappedBy="prescription",cascade=CascadeType.ALL)
	private Set<PrescriptionDetail> prescriptionDetails = new HashSet<PrescriptionDetail>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getBegindate() {
		return begindate;
	}

	public void setBegindate(Date begindate) {
		this.begindate = begindate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public int getCrawlagainst() {
		return crawlagainst;
	}

	public void setCrawlagainst(int crawlagainst) {
		this.crawlagainst = crawlagainst;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Doctor getDoctor() {
		return doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

	public Set<PrescriptionDetail> getPrescriptionDetails() {
		return prescriptionDetails;
	}

	public void setPrescriptionDetails(Set<PrescriptionDetail> prescriptionDetails) {
		this.prescriptionDetails = prescriptionDetails;
	}
	
	
}
