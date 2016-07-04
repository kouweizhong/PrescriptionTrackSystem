package com.silence.prescription.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.silence.prescription.entities.PrescriptionDetail;
import com.silence.prescription.repositories.PrescriptionDetailRepository;

@Service("prescriptionDetailService")
public class PrescriptionDetailService extends BaseServiceImpl<PrescriptionDetail> 
	implements BaseService<PrescriptionDetail>{
	@Autowired
	private PrescriptionDetailRepository prescriptionDetailDao;
	@Override
	public void update(PrescriptionDetail t) {
		prescriptionDetailDao.updateDetail(t.getCount(), t.getUnit(), t.getTakemethod(), t.getCanuse(), t.getId());
	}	
}
