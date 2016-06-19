package com.silence.prescription.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.silence.prescription.entities.Medicine;

@Repository(value="medicineDao")
@Transactional(readOnly=true)
public interface MedicineRepository extends JpaRepository<Medicine, Integer>{

}
