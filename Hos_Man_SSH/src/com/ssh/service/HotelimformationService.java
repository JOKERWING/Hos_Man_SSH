package com.ssh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssh.bean.Book_Hotelimformation;
import com.ssh.bean.Hotelimformation;
import com.ssh.dao.IHotelimformationDao;

@Transactional
@Service
public class HotelimformationService {

	@Autowired
	private IHotelimformationDao hotelimformationdaoimpl;

	// 获取最新的三次成交订单的客房类信息
	public List<Book_Hotelimformation> getListHotelImformationTop3() {
		return hotelimformationdaoimpl.gethotelimftop3();
	}

	/**
	 * 根据房型类查询该类的房间信息
	 * 
	 * @param hiname
	 * @return List<Hotelimformation> 为空返回null
	 */
	public List<Hotelimformation> gethotelimfbyname(String hiname) {
		List<Hotelimformation> lst = hotelimformationdaoimpl
				.gethotelimfbyname(hiname);
		if (lst.isEmpty()) {
			System.out.println("gethotelimfbyname  null");
			return null;
		} else {
			System.out.println("gethotelimfbyname  have");
			return lst;
		}
	}

	/**
	 * 根据房型类查询该类客房的的会员积分
	 * @param hiname
	 * @return Integer 空则控制台输出信息（不做处理），否则返回addlevsco
	 */
	public Integer getlevscobyname(String hiname) {
		List<Hotelimformation> lst = gethotelimfbyname(hiname);
		Integer addlevsco = null;
		if (lst == null) {
			System.out.println("getaddlevscobyname  null");
		} else {
			for (Hotelimformation hi : lst) {
				addlevsco = hi.getHiAddlevsco();
			}
		}
		System.out.println("getaddlevscobyname  have");
		return addlevsco;
	}

	// 获取所有客房分类信息
	public List<Hotelimformation> getlisthotimf() {
		return hotelimformationdaoimpl.getlisthotimf();
	}

	/**
	 * 根据id获得客房分类信息
	 * @param hiid
	 * @return List<Hotelimformation> 空则返回null，有则返回lst
	 */
	public List<Hotelimformation> selhotimfbyid(Integer hiid) {
		List<Hotelimformation> lst= hotelimformationdaoimpl.selhotimfbyid(hiid);
		if(lst.isEmpty()){
			System.out.println("selhotimfbyid  null");
			return null;
		}else{
			System.out.println("selhotimfbyid  have");
			return lst;
		}
	}

	// 根据id删除客房分类信息
	public boolean delhotimf(Integer hiid) {
		if( hotelimformationdaoimpl.delhotimf(hiid)){
			System.out.println("delhotimf  true");
			return true;
		}else{
			System.out.println("delhotimf  false");
			return false;
		}
	}

	// 根据id更新客房分类信息
	public boolean updhotimf(String hiid, String hiname, String hitype,
			String hibed, String hiarea, String hiwifi, String hiairt,
			String hibreakf, String hiprice, String hifloor, String hiimfor,
			String hi_addlevsco) {
		Integer hiid1 = Integer.parseInt(hiid);
		Integer hiprice1 = Integer.parseInt(hiprice);
		Integer hi_addlevsco1 = Integer.parseInt(hi_addlevsco);
		if(hotelimformationdaoimpl.updhotimf(hiid1, hiname, hitype, hibed,
				hiarea, hiwifi, hiairt, hibreakf, hiprice1, hifloor, hiimfor,
				hi_addlevsco1)>=0){
			System.out.println("updhotimf  true");
			return true;
		}else{
			System.out.println("updhotimf  false");
			return false;
		}
	}

	public boolean havehotimf(Integer hiid) {
		if (hotelimformationdaoimpl.get(hiid) == null) {
			System.out.println("havehotimf  false");
			return false;
		} else {
			System.out.println("havehotimf  true");
			return true;
		}
	}
	/**
	 * 添加客房分类信息
	 * @param hiname
	 * @param hitype
	 * @param hibed
	 * @param hiarea
	 * @param hiwifi
	 * @param hiairt
	 * @param hibreakf
	 * @param hiprice
	 * @param hifloor
	 * @param hiimfor
	 * @param hi_addlevsco
	 * @return boolean
	 */
	public boolean addhotimf(String hiname, String hitype, String hibed,
			String hiarea, String hiwifi, String hiairt, String hibreakf,
			String hiprice, String hifloor, String hiimfor, String hi_addlevsco) {
		Integer hiprice1 = Integer.parseInt(hiprice);
		Integer hi_addlevsco1 = Integer.parseInt(hi_addlevsco);
		if(hotelimformationdaoimpl.addhotimf(hiname, hitype, hibed,
				hiarea, hiwifi, hiairt, hibreakf, hiprice1, hifloor, hiimfor,
				hi_addlevsco1)>=0){
			System.out.println("addhotimf  true");
			return true;
		}else{
			System.out.println("addhotimf  false");
			return false;
		}
	}
	/**
	 * 根据条件查询客房分类信息
	 * @param hiid
	 * @param hname
	 * @param type
	 * @param bed
	 * @param breakf
	 * @param addlevsco
	 * @param pri1
	 * @param pri2
	 * @param floor1
	 * @param floor2
	 * @param area1
	 * @param area2
	 * @param hotimf
	 * @return List<Hotelimformation> 空则返回null
	 */
	public List<Hotelimformation> getlisthotimfby(String hiid, String hname, String type,String bed,
			String breakf, String addlevsco, String pri1, String pri2,
			String floor1, String floor2, String area1, String area2,
			String hotimf) {
		List<Hotelimformation> lst= hotelimformationdaoimpl.getlisthotimfby(hiid,hname,type,bed,breakf,addlevsco,pri1,pri2,floor1,floor2,area1,area2,hotimf);
		if(lst.isEmpty()){
			System.out.println("getlisthotimfby  null");
			return null;
		}else{
			System.out.println("getlisthotimfby  have");
			return lst;
		}
	}
}
