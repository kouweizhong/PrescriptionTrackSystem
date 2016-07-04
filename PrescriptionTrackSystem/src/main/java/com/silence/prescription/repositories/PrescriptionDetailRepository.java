package com.silence.prescription.repositories;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.silence.prescription.entities.PrescriptionDetail;

@Repository(value="prescriptionDetailDao")
public interface PrescriptionDetailRepository extends JpaRepository<PrescriptionDetail, Integer> {
	//更新处方详细信息
	@Transactional
	@Modifying
	@Query(value="update PrescriptionDetail detail set detail.count = :count,detail.unit = :unit,detail.takemethod = :takemethod,detail.canuse = :canuse where detail.id = :id")
	public void updateDetail(@Param("count") Integer count,@Param("unit") String unit, @Param("takemethod") String takemethod,@Param("canuse") String canuse,
@Param("id") Integer id);
}
