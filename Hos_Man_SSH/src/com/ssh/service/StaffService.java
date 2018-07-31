package com.ssh.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssh.bean.Staff;
import com.ssh.dao.IStaffDao;



@Transactional
@Service
public class StaffService {

	@Autowired
	private IStaffDao staffdaoimpl;

	// 列出所有职工getliststaff
	public List<Staff> getliststa() {
		return staffdaoimpl.getliststa();
	}

	// 登陆判断 logincheck
	public Object logchk(String slogid, String spwd) {
		for (Staff s : getliststa()) {

			if (s.getSlogid().equals(slogid)) {
				if (s.getSpwd().equals(spwd)) {
					return s;
				} else {
					return "pwdfalse";
				}
			}
		}
		return "nostaff";
	}

	/**
	 * 删除职工信息
	 * @param sid
	 * @return boolean
	 */
	public boolean delsta(String sid) {
		if( staffdaoimpl.deleteById(sid)){
			System.out.println("delsta true");
			return true;
		}else{
			System.out.println("delsta false");
			return false;
		}
	}
	/**
	 * 根据slogid更新职工信息
	 * @param slogid
	 * @param spwd
	 * @param sname
	 * @param ssex
	 * @param sbirth
	 * @param semail
	 * @param stele
	 * @param sidcard
	 * @param saddress
	 * @param rname
	 * @return boolean
	 * @throws ParseException
	 */
	public boolean updsta(String slogid,String spwd,String sname,String ssex,String sbirth,String semail,String stele,String sidcard,String saddress,String rname) throws ParseException{
		Date sbirth1=(Date) new SimpleDateFormat("yyyy-MM-dd").parse(sbirth);
		if(staffdaoimpl.updsta(slogid, spwd, sname, ssex, sbirth1, semail, stele, sidcard, saddress, rname)>=0){
			return true;
		}else{
			return false;
		}
	}

	/**
	 * 根据slogid判断是否存在职工 havestaff
	 * @param slogid
	 * @return boolean
	 */
	public boolean havesta(String slogid) {
		if (staffdaoimpl.get(slogid) == null) {
			System.out.println("havesta  false");
			return false;
		}else{
			System.out.println("havesta  true");
			return true;
		}
	}
	/**
	 * 根据slogid获得职工信息
	 * @param slogid
	 * @return List<Staff> 空则返回null
	 */
	public List<Staff> selstabyid(String slogid){
		List<Staff> lst= staffdaoimpl.selstabyid(slogid);
		if(lst.isEmpty()){
			System.out.println("selstabyid  null");
			return null;
		}else{
			System.out.println("selstabyid  have");
			return lst;
		}
	}
	/**
	 * 根据sid获得职工信息中的rname
	 * @param sid
	 * @return String 如果存在返回rname，不存在返回"false"
	 */
	public String selstarname(String sid){
		if(staffdaoimpl.get(sid)==null){
			return "false";
		}else{
			return staffdaoimpl.get(sid).getRname();
		}
	}
	/**
	 * 添加员工
	 * @param slogid
	 * @param spwd
	 * @param sname
	 * @param ssex
	 * @param sbirth
	 * @param semail
	 * @param stele
	 * @param sidcard
	 * @param saddress
	 * @param rname
	 * @return boolean
	 * @throws ParseException
	 */
	public boolean addsta(String slogid, String spwd, String sname, String ssex,
			String sbirth, String semail, String stele, String sidcard,
			String saddress, String rname) throws ParseException {
		Date sbirth1=(Date) new SimpleDateFormat("yyyy-MM-dd").parse(sbirth);
		if(staffdaoimpl.addsta(slogid, spwd, sname, ssex, sbirth1, semail, stele, sidcard, saddress, rname)>=0){
			System.out.println("addsta  true");
			return true;
		}else{
			System.out.println("addsta  false");
			return false;
		}
	}
	/**
	 * 根据条件查询员工信息
	 * @param slogid
	 * @param sname
	 * @param ssex
	 * @param sbirth
	 * @param semail
	 * @param stele
	 * @param sidcard
	 * @param saddress
	 * @param rname
	 * @return List<Staff> 空则返回null
	 */
	public List<Staff> getliststaby(String slogid, String sname, String ssex,
			String sbirth, String semail, String stele, String sidcard,
			String saddress, String rname) {
		List<Staff> lst= staffdaoimpl.getliststaby(slogid,sname,ssex,sbirth,semail,stele,sidcard,saddress,rname);
		if(lst.isEmpty()){
			System.out.println("getliststaby  null");
			return null;
		}else{
			System.out.println("getliststaby  have");
			return lst;
		}
	}
}
