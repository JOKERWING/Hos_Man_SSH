package com.ssh.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ssh.bean.Student_Test;
import com.ssh.bean.TblStudent;
import com.ssh.bean.TblTest1;
import com.ssh.dao.IStudentDao;
import com.ssh.dao.ITestDao;

@Repository
public class testDaoImpl  extends BaseDaoImpl<TblTest1, Integer> implements ITestDao{

	@Override
	public List<TblTest1> getlisttest() {
		String sql="select * from tbl_test1 order by TestID";
		return super.getListBySQL(sql);
	}

	@Override
	public List<Student_Test> seltestbystuid(String test,int studentId) {
		StringBuffer sql=new StringBuffer();
		sql.append(" select * from tbl_student s");
		sql.append(" join "+test+" t on s.StudentID=t.Student_id");
		sql.append(" where StudentID =? ");
		return super.getListBySQL_JDBC(Student_Test.class,sql.toString(), studentId);
	}
	
}
