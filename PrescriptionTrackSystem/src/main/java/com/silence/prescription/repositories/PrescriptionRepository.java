package com.silence.prescription.repositories;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.silence.prescription.entities.Prescription;

@Transactional
@Repository("prescriptionDao")
public interface PrescriptionRepository extends JpaRepository<Prescription, Integer>{
	
	public List<Prescription> findPrescriptionsByUserId(Integer id);
}
