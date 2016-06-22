package com.silence.prescription.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.silence.prescription.entities.User;
import com.silence.prescription.repositories.UserRepository;

@Service
public class UserService extends BaseServiceImpl<User>{

	@Autowired
	private UserRepository userDao;

	@Override
	public void update(User user) {
		userDao.update(user.getName(), user.getBirthday(),user.getTelephone(),
				user.getInsuranceCompany(),user.getPolicyNumber(), user.getId());
	}
	@Override
	public List<User> find(String[] param) {
		return userDao.findUserByAll(param[0]);
	}
	@Override
	public List<Object[]> get() {
		return userDao.countUser();
	}
	
	public List<Object[]> findByAgeCount(){
		return userDao.findByAgeCount();
	}
	
	public List<Object[]> findByYeayMontheDay(){
		return userDao.findByYearMonthdayDay();
	}
	@Override
	public User exist(User t) {
		return userDao.exist(t.getTelephone());
	}
}
