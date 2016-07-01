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
	
	@Query("from Prescription pre order by pre.id DESC")
	public List<Prescription> find();
	
	//更新处方，减少处方可取次数
	@Modifying
	@Query(value="update prescription set crawlagainst = crawlagainst - 1 where id = :id",nativeQuery=true)
	public void decreasePrescription(@Param("id") Integer id);
	
	//更新处方信息
	@Modifying
	@Query(value="update Prescription pre set pre.enddate = :enddate,pre.crawlagainst = :crawlagainst where pre.id = :id")
	public void update(@Param("enddate") Date enddate,@Param("crawlagainst") Integer crawlagainst,
			@Param("id") Integer id);
	
	@Query(value="select u.name,u.policy_number,u.telephone,u.insurance_company,count(*),u.id from prescription p inner join user u where u.id = p.uid group by p.uid",nativeQuery=true)
	public List<Object[]> showUPrescriptionCount();
	
	@Query(value="select * from prescription order by id desc limit 1",nativeQuery=true)
	public Prescription findLastPrescription();
}
