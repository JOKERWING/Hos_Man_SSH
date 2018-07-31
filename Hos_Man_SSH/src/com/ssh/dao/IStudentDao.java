package com.ssh.dao;

import java.util.List;

import com.ssh.bean.TblStudent;
import com.ssh.dao.base.IBaseDao;

public interface IStudentDao extends IBaseDao<TblStudent, Integer> {
	public List<TblStudent> getliststu();

	public List<TblStudent> selstubyid(int studentId);

}
