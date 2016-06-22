package com.silence.prescription.services;

import java.util.List;

public interface BaseService<T> {
	
	public void add(T t);
	
	public T find(Integer id);
	
	public List<T> find(String[] Param);
	
	public List<T> get(Integer id);
	
	public T find(T t);
		
	public List<T> find();
	
	public void  delete(T t);
	
	public void delete(Integer id);
	
	public List<Object []> get();
	
	public List<Object []> get(T t);
	
	public void update(T t);
	
	public Long count();
	
	public List<T> findPage(int page,int pageSize);
	
	public T exist(T t);
	
}
