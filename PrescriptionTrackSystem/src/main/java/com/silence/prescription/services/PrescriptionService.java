package com.silence.prescription.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.silence.prescription.entities.Prescription;
import com.silence.prescription.repositories.PrescriptionRepository;

@Service
public class PrescriptionService extends BaseServiceImpl<Prescription> {

	@Autowired
	private PrescriptionRepository prescriptionDao;
	@Override
	public List<Prescription> get(Integer id) {
		return prescriptionDao.findPrescriptionsByUserId(id);
	}
	
}
