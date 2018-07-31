package com.ssh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssh.bean.Student_Test;
import com.ssh.dao.ITestDao;


@Transactional
@Service
public class StudentTestService {
		
	@Autowired
	private ITestDao testdaoimpl;

	// 列出指定学生id的某一场成绩
	public List<Student_Test> seltestbystuid(String test,int studentId){
		List<Student_Test> lst=testdaoimpl.seltestbystuid(test,studentId);
		if(lst.isEmpty()){
			System.out.println("seltestbystuid  null");
			return null;
		}else{
			System.out.println("seltestbystuid  have");
			return lst;
		}
	}
}
