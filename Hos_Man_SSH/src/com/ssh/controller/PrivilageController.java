package com.ssh.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssh.controller.base.BaseController;
import com.ssh.service.PrivilegeService;



@Controller
@RequestMapping("/HosMan")
public class PrivilageController extends BaseController {
	@Autowired
	private PrivilegeService privilegeservice;
	
	@RequestMapping("/getlistpri")
	public void getlistpri(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		printJSON(privilegeservice.getlistpri(),req , rsp);
	}
	
	@RequestMapping("/getlistpriby")
	public void getlistpriby(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		String pid=req.getParameter("pid");
		String pfunction=req.getParameter("pfunction");
		String pimformation=req.getParameter("pimformation");
		printJSON(privilegeservice.getlistpriby(pid,pfunction,pimformation),req , rsp);
	}
	
	@RequestMapping("/selpribyid")
	public void selpribyid(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		Integer pid=Integer.parseInt(req.getParameter("pid"));
		printJSON(privilegeservice.selpribyid(pid),req , rsp);
	}
	
	@RequestMapping("/admin/delpri")
	public void delpri(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		Integer pid=Integer.parseInt(req.getParameter("pid"));
		if(!privilegeservice.havepri(pid)){
			print("nopri", req, rsp);
		}else{
			if(!privilegeservice.delpri(pid)){
				print(false, req, rsp);
			}else{
				print(true, req, rsp);
			}
		}
	}
	
	@RequestMapping("/admin/updpri")
	public void updpri(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		Integer pid=Integer.parseInt(req.getParameter("pid"));
		String pfunction=req.getParameter("pfunction");
		String pimformation=req.getParameter("pimformation");
		print(privilegeservice.updpri(pid,pfunction,pimformation), req, rsp);
	}
	
	@RequestMapping("/admin/addpri")
	public void addpri(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		Integer pid=Integer.parseInt(req.getParameter("pid"));
		String pfunction=req.getParameter("pfunction");
		String pimformation=req.getParameter("pimformation");
		if(privilegeservice.selpribyid(pid)!=null){
			print("havepri", req, rsp);
		}else{
			print(privilegeservice.addpri(pid,pfunction,pimformation), req, rsp);
		}
		
	}
}
