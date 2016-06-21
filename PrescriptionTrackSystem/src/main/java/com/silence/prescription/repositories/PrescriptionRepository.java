package com.silence.prescription.repositories;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.silence.prescription.entities.Prescription;

@Transactional
@Repository("prescriptionDao")
public interface PrescriptionRepository extends JpaRepository<Prescription, Integer>{

	//根据用户id号查询处方记录
	public List<Prescription> findPrescriptionsByUserId(Integer id);
	
	//更新处方信息
	@Modifying
	@Query(value="update Prescription pre set pre.enddate = :enddate,pre.crawlagainst = :crawlagainst where pre.id = :id")
	public void update(@Param("enddate") Date enddate,@Param("crawlagainst") Integer crawlagainst,
			@Param("id") Integer id);
}
