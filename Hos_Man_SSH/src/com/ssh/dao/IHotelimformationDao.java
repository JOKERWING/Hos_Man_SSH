package com.ssh.dao;

import java.util.List;

import com.ssh.bean.Book_Hotelimformation;
import com.ssh.bean.Hotelimformation;
import com.ssh.dao.base.IBaseDao;

public interface IHotelimformationDao extends
		IBaseDao<Hotelimformation, Integer> {

	public List<Book_Hotelimformation> gethotelimftop3();

	public List<Hotelimformation> gethotelimfbyname(String hiname);

	public List<Hotelimformation> getlisthotimf();

	public List<Hotelimformation> selhotimfbyid(Integer hiid);

	public boolean delhotimf(Integer hiid);

	public int updhotimf(Integer hiid, String hiname, String hitype,
			String hibed, String hiarea, String hiwifi, String hiairt,
			String hibreakf, Integer hiprice, String hifloor, String hiimfor,
			Integer hi_addlevsco);

	public int addhotimf(String hiname, String hitype, String hibed,
			String hiarea, String hiwifi, String hiairt, String hibreakf,
			Integer hiprice1, String hifloor, String hiimfor,
			Integer hi_addlevsco1);

	public List<Hotelimformation> getlisthotimfby(String hiid, String hname,
			String type, String bed, String breakf, String addlevsco,
			String pri1, String pri2, String floor1, String floor2,
			String area1, String area2, String hotimf);
}
