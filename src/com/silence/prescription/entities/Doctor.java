package com.silence.prescription.entities;

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

@Entity
@Table(name="doctor")
public class Doctor {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	//医师姓名
	@Column(length=32,nullable=false)
	private String name;
	//医师电话
	@Column(length=32,nullable=false)
	private String telephone;
	//登录密码
	@Column(length=32,nullable=false)
	private String password;
	//医师所属的部门
	@ManyToOne(fetch=FetchType.EAGER,targetEntity=Department.class,optional=false)
	@JoinColumn(name="did")
	private Department department;
	//医师的职位
	@ManyToOne(fetch=FetchType.EAGER,targetEntity=Position.class,optional=false)
	@JoinColumn(name="pid")
	private Position position;
	
	//该医生的处方
	@OneToMany(fetch=FetchType.LAZY,mappedBy="doctor",cascade=CascadeType.ALL)
	private Set<Prescription> prescriptions;
	
	public Set<Prescription> getPrescriptions() {
		return prescriptions;
	}
	public void setPrescriptions(Set<Prescription> prescriptions) {
		this.prescriptions = prescriptions;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public Position getPosition() {
		return position;
	}
	public void setPosition(Position position) {
		this.position = position;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Doctor [id=" + id + ", name=" + name + ", telephone="
				+ telephone + ", password=" + password + ", department="
				+ department + ", position=" + position + ", prescriptions="
				+ prescriptions + "]";
	}
	public Doctor(String name, String password) {
		super();
		this.name = name;
		this.password = password;
	}
	public Doctor() {
		super();
	}
}
