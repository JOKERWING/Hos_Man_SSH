package com.ssh.dao;

import java.util.Date;
import java.util.List;

import com.ssh.bean.Staff;
import com.ssh.dao.base.IBaseDao;

public interface IStaffDao extends IBaseDao<Staff, String> {
	public List<Staff> getliststa();

	public List<Staff> selstabyid(String slogid);

	public int updsta(String slogid, String spwd, String sname, String ssex,
			Date sbirth, String semail, String stele, String sidcard,
			String saddress, String rname);

	public int addsta(String slogid, String spwd, String sname, String ssex,
			Date sbirth, String semail, String stele, String sidcard,
			String saddress, String rname);

	public List<Staff> getliststaby(String slogid, String sname, String ssex,
			String sbirth, String semail, String stele, String sidcard,
			String saddress, String rname);
}
