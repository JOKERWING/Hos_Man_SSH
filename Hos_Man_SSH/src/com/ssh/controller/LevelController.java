package com.ssh.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssh.bean.Level;
import com.ssh.controller.base.BaseController;
import com.ssh.service.LevelService;


@Controller
@RequestMapping("/HosMan")
public class LevelController extends BaseController{
	@Autowired 
	private LevelService levelservice;
	
	@RequestMapping("/sellsale")
	public void sellsale(HttpServletRequest req,HttpServletResponse rsp) throws IOException{
		String llevel=req.getParameter("llevel");
		print(levelservice.sellsale(llevel), req, rsp);
	}
	@RequestMapping("/getlistlevel")
	public void getlistlevel(HttpServletRequest req,HttpServletResponse rsp) throws IOException{
		printJSON(levelservice.getlistlevel(), req, rsp);
	}
}
