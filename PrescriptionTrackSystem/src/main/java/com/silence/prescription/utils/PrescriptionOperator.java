package com.silence.prescription.utils;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 处方详细
 */
public class PrescriptionOperator{
	// 处方属性
	// 处方详细的集合
	private Map<Integer, PrescriptionDetailOperator> map = 
			new LinkedHashMap<Integer, PrescriptionDetailOperator>();

	public Collection<PrescriptionDetailOperator> getPreDetail(){
		return map.values();
	}
	
	public void addPrescriptionDetail(PrescriptionDetailOperator preDetail) {
		Integer id = preDetail.getMedicine().getId();
		if(map.containsKey(id)){
			PrescriptionDetailOperator _preDetail = map.get(id);
			_preDetail.setCount(_preDetail.getCount() + preDetail.getCount());
		}else{
			// 不存在
			map.put(id, preDetail);
		}
	}
	public void removePreDetail(Integer pid) {
		if (map.containsKey(pid)){			
			map.remove(pid);
		}
	}
}
