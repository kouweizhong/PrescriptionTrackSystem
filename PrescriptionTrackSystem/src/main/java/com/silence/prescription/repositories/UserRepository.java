package com.silence.prescription.repositories;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.silence.prescription.entities.User;

@Transactional
@Repository("userDao")
public interface UserRepository extends JpaRepository<User, Integer>{

	@Modifying
	@Query("update User u set u.name = :name,u.birthday = :birthday,u.telephone = :telephone,u.insuranceCompany = :insuranceCompany,u.policyNumber = :policyNumber where u.id = :id")
	public void update(@Param("name") String name,@Param("birthday") Date birthday,
			@Param("telephone") String telephone,@Param("insuranceCompany") String insuranceCompany,
			@Param("policyNumber") String policyNumber,@Param("id") Integer id);
	
	@Query("from User u where concat(u.name,u.birthday,u.telephone,u.insuranceCompany,u.policyNumber) like CONCAT('%',:search,'%')")
	public List<User> findUserByAll(@Param("search") String search);
}
