package com.ssh.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssh.bean.Book_Hotelimformation;
import com.ssh.bean.Hotel;
import com.ssh.bean.Hotelimformation;
import com.ssh.controller.base.BaseController;
import com.ssh.service.HotelimformationService;

@Controller
@RequestMapping("/HosMan")
public class HotelimformationController extends BaseController {

	@Autowired
	private HotelimformationService hotelimformationservice;

	// 输出最新的前三个订单的客房类信息
	@RequestMapping("/hotimftop3")
	public void showPrv(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		List<Book_Hotelimformation> lst = hotelimformationservice
				.getListHotelImformationTop3();
		printJSON(lst, req, rsp);
		System.out.println("hotimftop3 have");
	}

	// 根据房型类查询该类的房间信息
	@RequestMapping("/hotimfbyname")
	public void hotimfbyname(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		String hiname = req.getParameter("hiname").trim();
		List<Hotelimformation> lst = hotelimformationservice
				.gethotelimfbyname(hiname);
		printJSON(lst, req, rsp);
	}

	// 获取所有的客房类信息
	@RequestMapping("/getlisthotimf")
	public void getlisthotimf(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		List<Hotelimformation> lst = hotelimformationservice.getlisthotimf();
		printJSON(lst, req, rsp);
	}
	
	   @RequestMapping("/getlisthotimfby")
		public void getlisthotimfby(HttpServletRequest req, HttpServletResponse rsp)
				throws IOException {
		   String hiid=req.getParameter("hiid");
		   String hname=req.getParameter("hname");
		   String type=req.getParameter("type");
		   String bed=req.getParameter("bed");
		   String breakf=req.getParameter("breakf");
		   String addlevsco=req.getParameter("addlevsco");
		   String pri1=req.getParameter("pri1");
		   String pri2=req.getParameter("pri2");
		   String floor1=req.getParameter("floor1");
		   String floor2=req.getParameter("floor2");
		   String area1=req.getParameter("area1");
		   String area2=req.getParameter("area2");
		   String hotimf=req.getParameter("hotimf");
		   System.out.println(hiid+"--"+hname+"--"+type+"--"+bed+"--"+breakf+"--"+addlevsco+"--"+pri1+"--"+pri2+"--"+floor1+"--"+floor2+"--"+area1+"--"+area2+"--"+hotimf);
			printJSON(hotelimformationservice.getlisthotimfby(hiid,hname,type,bed,breakf,addlevsco,pri1,pri2,floor1,floor2,area1,area2,hotimf), req, rsp);
		}
	
	// 根据id查询客房类信息
	@RequestMapping("/selhotimfbyid")
	public void selhotimfbyid(HttpServletRequest req, HttpServletResponse rsp,
			PrintWriter out) throws IOException {
		Integer hiid = Integer.parseInt(req.getParameter("hiid").trim());
		printJSON(hotelimformationservice.selhotimfbyid(hiid), req, rsp);
	}

	// 根据id删除客房信息
	@RequestMapping("/admin/delhotimf")
	public void delhotimf(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		Integer hiid = Integer.parseInt(req.getParameter("hiid").trim());
		if (hotelimformationservice.havehotimf(hiid) == false) {
			print("nohotimf", req, rsp);
		} else {
			print(hotelimformationservice.delhotimf(hiid), req, rsp);
		}
	}

	// 更新客房类信息
	@RequestMapping("/admin/updhotimf")
	public void updhotimf(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		String hiid = req.getParameter("hiid").trim();
		String hiname = req.getParameter("hiname").trim();
		String hitype = req.getParameter("hitype").trim();
		String hibed = req.getParameter("hibed").trim();
		String hiwifi = req.getParameter("hiwifi").trim();
		String hiairt = req.getParameter("hiairt").trim();
		String hibreakf = req.getParameter("hibreakf").trim();
		String hiprice = req.getParameter("hiprice").trim();
		String hifloor = req.getParameter("hifloor").trim();
		String hiarea = req.getParameter("hiarea").trim();
		String hiimfor = req.getParameter("hiimfor").trim();
		String hiaddlevsco = req.getParameter("hiaddlevsco").trim();
		print(hotelimformationservice.updhotimf(hiid, hiname, hitype, hibed,
				hiarea, hiwifi, hiairt, hibreakf, hiprice, hifloor, hiimfor,
				hiaddlevsco), req, rsp);
	}

	@RequestMapping("/admin/addhotimf")
	public void addhotimf(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		String hiname = req.getParameter("hiname").trim();
		String hitype = req.getParameter("hitype").trim();
		String hibed = req.getParameter("hibed").trim();
		String hiwifi = req.getParameter("hiwifi").trim();
		String hiairt = req.getParameter("hiairt").trim();
		String hibreakf = req.getParameter("hibreakf").trim();
		String hiprice = req.getParameter("hiprice").trim();
		String hifloor = req.getParameter("hifloor").trim();
		String hiarea = req.getParameter("hiarea").trim();
		String hiimfor = req.getParameter("hiimfor").trim();
		String hiaddlevsco = req.getParameter("hiaddlevsco").trim();
		print(hotelimformationservice.addhotimf(hiname, hitype, hibed, hiarea,
				hiwifi, hiairt, hibreakf, hiprice, hifloor, hiimfor,
				hiaddlevsco), req, rsp);

	}
}
