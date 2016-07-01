package com.silence.prescription.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.silence.prescription.entities.Doctor;

@Repository(value="doctoryDao")
@Transactional(readOnly=true)
public interface DoctorRepository extends JpaRepository<Doctor, Integer>{

	@Modifying
	@Query("update Doctor d set d.name=:name,d.telephone=:telephone where d.id=:id")
	public void update(@Param("name") String name,
			@Param("telephone") String telephone,@Param("id") Integer id);
	
	public Doctor findByNameAndPassword(String name,String password);
	
}
