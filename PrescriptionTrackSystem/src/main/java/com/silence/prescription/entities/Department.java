package com.silence.prescription.entities;

import java.util.HashSet;
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

@Table(name="department")
@Entity
public class Department {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@Column(length=32,nullable=false)	
	//部门的名字
	private String name;
	//该部门下的医生
	@OneToMany(fetch=FetchType.LAZY,mappedBy="department",cascade=CascadeType.ALL)
	private Set<Doctor> doctors = new HashSet<Doctor>();
	
 	public Set<Doctor> getDoctors() {
		return doctors;
	}
	public void setDoctors(Set<Doctor> doctors) {
		this.doctors = doctors;
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
	@Override
	public String toString() {
		return "Department [id=" + id + ", name=" + name + ", doctors="
				+ "]";
	}
	
}
