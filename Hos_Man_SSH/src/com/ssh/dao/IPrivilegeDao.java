package com.ssh.dao;

import java.util.List;

import com.ssh.bean.Privilege;
import com.ssh.dao.base.IBaseDao;

public interface IPrivilegeDao extends IBaseDao<Privilege, Integer> {

	public List<Privilege> getlistpri();

	public List<Privilege> selpribyid(Integer pid);

	public int updpri(Integer pid, String pfunction, String pimformation);

	public int addpri(Integer pid, String pfunction, String pimformation);

	public int delpri(Integer pid);

	public List<Privilege> getlistpriby(String pid, String pfunction,
			String pimformation);
}
