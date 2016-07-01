package com.silence.prescription.entities;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name="user")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	// 用户id
	private int id;
	// 用户姓名
	@Column(length=32)
	private String name;
	// 用户电话
	private String telephone;
	// 用户出生日期
	@DateTimeFormat(pattern="MM/dd/yyyy")
	@Temporal(TemporalType.DATE)
	private Date birthday;
	// 承保公司
	@Column(length=32)
	private String insuranceCompany;
	// 保单号
	@Column(length=32)
	private String policyNumber;

	/*
	 * CascadeType.REFRESH当多个用户同时操作一个实体，为了用户取到的数据是实时的，在用shiite中的数据之前就可以调用一下refresh()方法
	 * CascadeType.REMOVE级联删除，当调用remove()方法删除实体时会先级联删除相关数据
	 * CascadeType.MERGE级联更新
	 * CascadeType.ALL包含以上所有的属性
	 */
	@OneToMany(fetch=FetchType.LAZY,mappedBy="user",cascade=CascadeType.ALL)
	private Set<Prescription> prescriptions;
	
	public Set<Prescription> getPrescriptions() {
		return prescriptions;
	}

	public void setPrescriptions(Set<Prescription> prescriptions) {
		this.prescriptions = prescriptions;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getInsuranceCompany() {
		return insuranceCompany;
	}

	public void setInsuranceCompany(String insuranceCompany) {
		this.insuranceCompany = insuranceCompany;
	}

	public String getPolicyNumber() {
		return policyNumber;
	}

	public void setPolicyNumber(String policyNumber) {
		this.policyNumber = policyNumber;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User(int id) {
		super();
		this.id = id;
	}

	public User(int id, String name, String telephone, Date birthday,
			String insuranceCompany, String policyNumber) {
		this.id = id;
		this.name = name;
		this.telephone = telephone;
		this.birthday = birthday;
		this.insuranceCompany = insuranceCompany;
		this.policyNumber = policyNumber;
	}

	public User(String telephone) {
		super();
		this.telephone = telephone;
	}

	public User() {
		super();
	}	
}