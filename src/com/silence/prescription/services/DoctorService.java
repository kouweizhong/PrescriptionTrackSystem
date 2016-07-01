package com.silence.prescription.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.silence.prescription.entities.Doctor;
import com.silence.prescription.repositories.DoctorRepository;

@Service
public class DoctorService extends BaseServiceImpl<Doctor>{
	
	@Autowired
	private DoctorRepository doctorDao;

	@Override
	public Doctor find(Doctor t) {
		return doctorDao.findByNameAndPassword(t.getName(), t.getPassword());
	}
	
}
