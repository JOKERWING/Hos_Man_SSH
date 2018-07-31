package com.ssh.dao;

import java.util.List;

import com.ssh.bean.Role;
import com.ssh.dao.base.IBaseDao;

public interface IRoleDao extends IBaseDao<Role, Integer> {
	public List<Role> getlistrole();

	public List<Role> selrolebyid(Integer rid);

	public int updpri(Integer rid, String rname, String rnamec,
			String rimformation, Integer rmaxnum);

	public List<Role> selrolebyname(String rname);

	public int addpri(Integer rid, String rname, String rnamec,
			String rimformation, Integer rmaxnum);

	public int delrole(Integer rid);

	public List<Role> getlistroleby(String rid, String rname, String rnamec,
			String rimformation, String rmaxnum);
}
