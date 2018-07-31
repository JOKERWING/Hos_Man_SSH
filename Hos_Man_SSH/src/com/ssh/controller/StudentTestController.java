package com.ssh.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssh.bean.Student_Test;
import com.ssh.controller.base.BaseController;
import com.ssh.service.StaffService;
import com.ssh.service.StudentTestService;

@Controller
@RequestMapping("/StudentTest")
public class StudentTestController extends BaseController {
	
	@Autowired
	private StudentTestService studenttestservice;
	
	@RequestMapping("/seltestbystuid")
	public void seltestbystuid(PrintWriter out, HttpServletRequest req,
			HttpServletResponse rsp) throws IOException {
		String result=null;
		int score1 = 0,score2=0;
		Integer StudentID=Integer.parseInt(req.getParameter("studentid").trim());
		List<Student_Test> lst1= studenttestservice.seltestbystuid("tbl_test1",StudentID);
		if(lst1==null){
			result="1null";
		}else{
			for(Student_Test s:lst1){
				score1=Integer.parseInt(s.getScore());
			}
		}
		List<Student_Test> lst2= studenttestservice.seltestbystuid("tbl_test2",StudentID);
		if(lst2==null){
			result+="2null";
		}else{
			for(Student_Test s:lst2){
				score2=Integer.parseInt(s.getScore());
			}
		}
		if(result!=null&&result.equals("1null")){
			printJSON(lst2, req, rsp);
		}else if(result!=null&&result.equals("2null")){
			printJSON(lst1, req, rsp);
		}else if(result!=null&&result.equals("1null2null")){
			printJSON(null, req, rsp);
		}else if(score1>=score2){
			printJSON(lst1, req, rsp);
		}else if(score1<score2){
			printJSON(lst2, req, rsp);
		}
		
	}
}
