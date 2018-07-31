package com.ssh.dao;

import java.util.List;

import com.ssh.bean.RolePrivilegeAll;
import com.ssh.bean.Roleprivilege;
import com.ssh.dao.base.IBaseDao;



public interface IRolePrivilegeDao extends IBaseDao<Roleprivilege,Integer>{
	public List<RolePrivilegeAll> selrolepriallbyrid(Integer rid);
	public List<RolePrivilegeAll> selrolepriallbyrname(String rname);
	public int addrolepri(Integer rid,Integer pid);
	public int delrolepri(Integer rid,Integer pid);
}
