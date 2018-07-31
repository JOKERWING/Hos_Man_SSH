package com.ssh.dao;

import java.util.List;

import com.ssh.bean.Hotel;
import com.ssh.bean.Hotel_Hotelimformation;
import com.ssh.dao.base.IBaseDao;

public interface IHotelDao extends IBaseDao<Hotel, String>{
	
	public List<Hotel_Hotelimformation> getlisthotel();
	public List<Hotel_Hotelimformation> hotsel(String hiname,String indate,String outdate,String pnum);
	public int updhot(String hid,String hname,Integer harea,Integer hfloor,Integer hiid); 
	public List<Hotel>  selhotbyid(String hid);
	public int addhot(String hid, String hname, Integer area, Integer floor,
			Integer hiid);
	public List<Hotel> getlisthotby(String hid, String hname, String area1,
			String area2, String floor1, String floor2, String hiid);
}
