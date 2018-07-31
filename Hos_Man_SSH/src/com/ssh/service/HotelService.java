package com.ssh.service;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder.In;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssh.bean.Hotel;
import com.ssh.bean.Hotel_Hotelimformation;
import com.ssh.dao.IHotelDao;

@Transactional
@Service
public class HotelService {

	@Autowired
	private IHotelDao hoteldaoimpl;

	/**
	 * 获取所有客房信息
	 * 
	 * @return List<Hotel>
	 */
	public List<Hotel_Hotelimformation> getListHotel() {
		return hoteldaoimpl.getlisthotel();
	}

	/**
	 * 筛选出符合条件的客房信息
	 * 
	 * @param type
	 * @param indate
	 * @param outdate
	 * @param pnum
	 * @return List<Hotel>
	 */
	public List<Hotel_Hotelimformation> hotsel(String hiname, String indate,
			String outdate, String pnum) {
		return hoteldaoimpl.hotsel(hiname, indate, outdate, pnum);
	}

	/**
	 * 根据客房号删除客房信息
	 * 
	 * @param hid
	 * @return boolean
	 */
	public boolean delhot(String hid) {
		return hoteldaoimpl.deleteById(hid);
	}

	/**
	 * 根据hid判断客房是否存在
	 * 
	 * @param hid
	 * @return boolean
	 */
	public boolean havehot(String hid) {
		if (hoteldaoimpl.get(hid) == null) {
			System.out.println("havehot  false");
			return false;
		} else {
			System.out.println("havehot  true");
			return true;
		}
	}

	/**
	 * 更新客房信息
	 * 
	 * @param hid
	 * @param hname
	 * @param harea
	 * @param hfloor
	 * @param hiid
	 * @return boolean
	 */
	public boolean updhot(String hid, String hname, String harea,
			String hfloor, String hiid) {
		Integer area = Integer.parseInt(harea);
		Integer floor = Integer.parseInt(hfloor);
		Integer hiid1 = Integer.parseInt(hiid);
		// Hotel hot = new Hotel(hid, hname, area, floor,hiid1);
		if (hoteldaoimpl.updhot(hid, hname, area, floor, hiid1) >= 0) {
			System.out.println("updhot  true");
			return true;
		} else {
			System.out.println("updhot  false");
			return false;
		}
	}
	/**
	 * 根据hid查询客房信息
	 * @param hid
	 * @return List<Hotel> 无则返回null，有则返回List
	 */
	public List<Hotel> selhotbyid(String hid) {
		List<Hotel> lst= hoteldaoimpl.selhotbyid(hid);
		if(lst.isEmpty()){
			System.out.println("selhotbyid  null");
			return null;
		}else{
			System.out.println("selhotbyid  have");
			return lst;
		}
	}
	/**
	 * 添加客房信息
	 * @param hid
	 * @param hname
	 * @param harea
	 * @param hfloor
	 * @param hiid
	 * @return boolean
	 */
	public boolean addhot(String hid, String hname, String harea,
			String hfloor, String hiid) {
		Integer area = Integer.parseInt(harea);
		Integer floor = Integer.parseInt(hfloor);
		Integer hiid1 = Integer.parseInt(hiid);
		// Hotel hot = new Hotel(hid, hname, area, floor,hiid1);
		if (hoteldaoimpl.addhot(hid, hname, area, floor, hiid1) >= 0) {
			System.out.println("addhot  true");
			return true;
		} else {
			System.out.println("addhot  false");
			return false;
		}
	}
	/**
	 * 根据条件查询客房信息
	 * @param hid
	 * @param hname
	 * @param area1
	 * @param area2
	 * @param floor1
	 * @param floor2
	 * @param hiid
	 * @return List<Hotel_Hotelimformation> 空则返回null
	 */
	public List<Hotel> getlisthotby(String hid, String hname,
			String area1, String area2, String floor1, String floor2,
			String hiid) {
		List<Hotel> lst= hoteldaoimpl.getlisthotby(hid,hname,area1,area2,floor1,floor2,hiid);
		if(lst.isEmpty()){
			System.out.println("getlisthotby  null");
			return null;
		}else{
			System.out.println("getlisthotby  have");
			return lst;
		}
	}
}
