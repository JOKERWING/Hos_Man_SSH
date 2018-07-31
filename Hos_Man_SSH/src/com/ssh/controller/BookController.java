package com.ssh.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssh.bean.Book;
import com.ssh.bean.Customer;
import com.ssh.bean.Hotelimformation;
import com.ssh.controller.base.BaseController;
import com.ssh.service.BookService;
import com.ssh.service.CustomerService;
import com.ssh.service.HotelimformationService;
import com.ssh.service.LevelService;

@Controller
@RequestMapping("/HosMan")
public class BookController extends BaseController {

	@Autowired
	private BookService bookservice;
	@Autowired
	private LevelService levelservice;
	@Autowired
	private CustomerService customerservice;
	@Autowired
	private HotelimformationService hotelimformationservice;

	@RequestMapping("/paysesset")
	public void paysesset(HttpServletRequest req, HttpServletResponse rsp,
			PrintWriter out) throws ParseException, IOException {
		String hoid = req.getParameter("hid").trim();
		String hname = req.getParameter("name").trim();
		String indate = req.getParameter("indate");
		String outdate = req.getParameter("outdate");
		String pnum = req.getParameter("pnum").trim();
		String bprice1 = req.getParameter("price").trim();
		String clogid = req.getParameter("logid").trim();
		String bprepay = req.getParameter("prepay").trim();
		Book bo = bookservice.dealbookdate(hoid, hname, indate, outdate, pnum,
				bprice1, clogid, bprepay);
		print(bookservice.paysesset(bo, req), req, rsp);

	}

	@RequestMapping("/paysesget")
	public void paysesget(HttpServletRequest req, HttpServletResponse rsp,
			PrintWriter out) throws IOException {
		printJSON(bookservice.paysesget(req), req, rsp);
	}

	@RequestMapping("/paydeal")
	public void pay(HttpServletRequest req, HttpServletResponse rsp,
			PrintWriter out) throws IOException, ParseException {
		String hoid = req.getParameter("hoid").trim();
		String hname = req.getParameter("type").trim();
		String indate = req.getParameter("indate").trim();
		String outdate = req.getParameter("outdate").trim();
		String pnum = req.getParameter("pnum").trim();
		String clogid = req.getParameter("logid").trim();
		String bprice1 = req.getParameter("price").trim();
		String bprepay = req.getParameter("prepay").trim();
		Book b = bookservice.dealbookdate(hoid, hname, indate, outdate, pnum,
				bprice1, clogid, bprepay);
		if (bookservice.chkexistbook(b.getHId(), b.getBIndate()) == true) {
			bookservice.rempayses(req);
			out.print("error1");
		} else {
			String clevel = null;
			List<Book> lstb = bookservice.selprebookbylogid(clogid);
			for (Customer c : customerservice.selcustomer(clogid)) {
				clevel = c.getCLevel();
			}
			int maxnum = (int) (103 - (levelservice.sellsale(clevel) * 100));
			if (lstb!=null) {
				if (lstb.size() >= maxnum) {
					print("more", req, rsp);
					return;
				}
			}
			if (bookservice.insertbook(b) == true) {
				bookservice.rempayses(req);
				print(customerservice.updaddlev(clogid,
						hotelimformationservice.getlevscobyname(hname)), req,
						rsp);
				req.getSession().setAttribute("customerlst",
						customerservice.selcustomer(clogid));
			} else {
				out.print(false);
			}
		}

	}

	@RequestMapping("/getlistbook")
	public void getlistbook(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		printJSON(bookservice.getlistbook(), req, rsp);
	}
	
	@RequestMapping("/getlistbookby")
	public void getlistbookby(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException, ParseException {
		String bid=req.getParameter("bid");
		String hid=req.getParameter("hid");
		String hname=req.getParameter("hname");
		String bindate=req.getParameter("bindate");
		String boutdate=req.getParameter("boutdate");
		String bpnum=req.getParameter("bpnum");
		String clogid=req.getParameter("clogid");
		String bprice1=req.getParameter("bprice1");
		String bprice2=req.getParameter("bprice2");
		String bprepay=req.getParameter("bprepay");
		printJSON(bookservice.getlistbookby(bid,hid,hname,bindate,boutdate,bpnum,clogid,bprice1,bprice2,bprepay), req, rsp);
	}

	@RequestMapping("/selbookbyid")
	public void selbookbyid(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		Integer bid = Integer.parseInt(req.getParameter("bid").trim());
		printJSON(bookservice.selbookbyid(bid), req, rsp);
	}

	@RequestMapping("/selfinbookbylogid")
	public void selfinbookbylogid(HttpServletRequest req,
			HttpServletResponse rsp) throws IOException {
		String clogid = req.getParameter("clogid").trim();
		printJSON(bookservice.selfinbookbylogid(clogid), req, rsp);
	}

	@RequestMapping("/selprebookbylogid")
	public void selprebookbylogid(HttpServletRequest req,
			HttpServletResponse rsp) throws IOException {
		String clogid = req.getParameter("clogid").trim();
		printJSON(bookservice.selprebookbylogid(clogid), req, rsp);
	}

	@RequestMapping("/admin/updbook")
	public void updbook(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException, ParseException {
		String bid = req.getParameter("bid").trim();
		String hid = req.getParameter("hid").trim();
		String hname = req.getParameter("hname").trim();
		String bindate = req.getParameter("bindate").trim();
		String boutdate = req.getParameter("boutdate").trim();
		String bpnum = req.getParameter("bpnum").trim();
		String bprice = req.getParameter("bprice").trim();
		String clogid = req.getParameter("clogid").trim();
		String bprepay = req.getParameter("bprepay").trim();
		Boolean b = bookservice.updbook(bid, hid, hname, bindate, boutdate,
				bpnum, bprice, clogid, bprepay);
		print(b, req, rsp);

	}
	@RequestMapping("/admin/addbook")
	public void addbook(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException, ParseException {
		String hid = req.getParameter("hid").trim();
		String hname = req.getParameter("hname").trim();
		String bindate = req.getParameter("bindate").trim();
		String boutdate = req.getParameter("boutdate").trim();
		String bpnum = req.getParameter("bpnum").trim();
		String bprice = req.getParameter("bprice").trim();
		String clogid = req.getParameter("clogid").trim();
		String bprepay = req.getParameter("bprepay").trim();
		Boolean b = bookservice.addbook( hid, hname, bindate, boutdate,
				bpnum, bprice, clogid, bprepay);
		String clevel = null;
		List<Book> lstb = bookservice.selprebookbylogid(clogid);
		for (Customer c : customerservice.selcustomer(clogid)) {
			clevel = c.getCLevel();
		}
		int maxnum = (int) (103 - (levelservice.sellsale(clevel) * 100));
		if (lstb!=null) {
			if (lstb.size() >= maxnum) {
				print("more", req, rsp);
				return;
			}
		}
		if (b== true) {
			print(customerservice.updaddlev(clogid,
					hotelimformationservice.getlevscobyname(hname)), req,
					rsp);
		} else {
			print(false,req,rsp);
		}

	}

	// 根据bid删除订单信息
	@RequestMapping("/admin/delbook")
	public void delbook(PrintWriter out, HttpServletRequest req,
			HttpServletResponse rsp) throws IOException {
		Integer bid = Integer.parseInt(req.getParameter("bid").trim());
		if (bookservice.havebook(bid) == false) {
			out.print("nobook");
		} else {
			// print(bookservice.delbook(bid), req, rsp);

			List<Book> lst = bookservice.selbookbyid(bid);
			String logid = "";
			String hname = "";
			if (lst != null) {
				for (Book b : lst) {
					logid = b.getCLogid();
					hname = b.getHName();
				}
				if (!customerservice.updredlev(logid,
						hotelimformationservice.getlevscobyname(hname))) {
					print(false, req, rsp);
				} else {
					if (!bookservice.delbook(bid)) {
						print(false, req, rsp);
					} else {
						print(true, req, rsp);
					}
					req.getSession().setAttribute("customerlst",
							customerservice.selcustomer(logid));
				}
			}
		}
	}

}
