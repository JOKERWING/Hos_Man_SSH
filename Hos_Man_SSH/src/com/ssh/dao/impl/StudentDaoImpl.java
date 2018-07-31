package com.ssh.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ssh.bean.TblStudent;
import com.ssh.dao.IStudentDao;

@Repository
public class StudentDaoImpl  extends BaseDaoImpl<TblStudent, Integer> implements IStudentDao{

	@Override
	public List<TblStudent> getliststu() {
		String sql="select * from tbl_student order by StudentID";
		return super.getListBySQL(sql);
	}

	@Override
	public List<TblStudent> selstubyid(int studentId) {
		StringBuffer sql=new StringBuffer();
		sql.append(" select * from tbl_student ");
		sql.append(" where StudentID =? ");
		return super.getListBySQL(sql.toString(), studentId);
	}
	
}
