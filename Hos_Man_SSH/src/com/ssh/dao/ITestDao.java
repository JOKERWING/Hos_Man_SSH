package com.ssh.dao;

import java.util.List;

import com.ssh.bean.Student_Test;
import com.ssh.bean.TblTest1;
import com.ssh.dao.base.IBaseDao;

public interface ITestDao  extends IBaseDao<TblTest1, Integer> {
	public List<TblTest1> getlisttest();

	public List<Student_Test> seltestbystuid(String test,int studentId);

}