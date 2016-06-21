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

	//根据搜索关键字查询用户
	@Query("from User u where concat(u.name,u.birthday,u.telephone,u.insuranceCompany,u.policyNumber) like CONCAT('%',:search,'%')")
	public List<User> findUserByAll(@Param("search") String search);
	
	//根据承保公司计算用户的数量	
	@Query("select count(*),insuranceCompany from User u group by u.insuranceCompany")
	public List<Object[]> countUser();

	//根据不同的年龄段统计用户的数量
	@Query(value="select count(*),left(birthday,4) from user group by left(birthday,4)",nativeQuery=true)
	public List<Object[]> findByAgeCount();
	
	//查询用户的出生年份，月份，日期
	@Query(value="select left(birthday,4),substring(birthday,6,2),substring(birthday,9,2) from user",nativeQuery=true)
	public List<Object[]> findByYearMonthdayDay();
}
