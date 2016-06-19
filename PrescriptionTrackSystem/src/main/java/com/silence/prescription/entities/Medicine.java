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
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="medicine")
public class Medicine {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@Column(length=64,nullable=false)
	private String name;
	@Column(length=128)
	private String sideeffect;
	@OneToMany(fetch=FetchType.LAZY,mappedBy="medicine",cascade=CascadeType.ALL,targetEntity=PrescriptionDetail.class)
	private Set<PrescriptionDetail> prescriptionDetails = new HashSet<PrescriptionDetail>();	
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	//表关联的方式来映射一对多或者多对多的关系时，要使用@JoinTable这个标记
	//name属性为连接两个表的表名称
	//joinColumns属性表示，在保存关系中的表中，所保存关联关系的外键的字段。并配合@JoinColumn标记使用。
	//inverseJoinColumns属性与joinColumns属性类似，它保存的是保存关系的另一个外键字段
	@JoinTable(name="subtitute",joinColumns={@JoinColumn(name="m_id")},inverseJoinColumns
	={@JoinColumn(name="s_id")})
	private Set<Medicine> substitutes = new HashSet<Medicine>();

	public Set<Medicine> getSubstitutes() {
		return substitutes;
	}

	public void setSubstitutes(Set<Medicine> substitutes) {
		this.substitutes = substitutes;
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

	public String getSideeffect() {
		return sideeffect;
	}

	public void setSideeffect(String sideeffect) {
		this.sideeffect = sideeffect;
	}

	public Set<PrescriptionDetail> getPrescriptionDetails() {
		return prescriptionDetails;
	}

	public void setPrescriptionDetails(Set<PrescriptionDetail> prescriptionDetails) {
		this.prescriptionDetails = prescriptionDetails;
	}
	public Medicine() {
		super();
	}
	
	public Medicine(String name, String sideeffect) {
		super();
		this.name = name;
		this.sideeffect = sideeffect;
	}
	
}
