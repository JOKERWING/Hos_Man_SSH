package com.ssh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssh.bean.Role;
import com.ssh.dao.IRoleDao;

@Transactional
@Service
public class RoleService {
	@Autowired
	private IRoleDao roleimpl;

	/**
	 * 获得所有角色表信息
	 * 
	 * @return List<Role1>
	 */
	public List<Role> getlistrole() {
		return roleimpl.getlistrole();
	}

	/**
	 * 根据rid获得角色表信息
	 * 
	 * @param rid
	 * @return List<Role1>
	 */
	public List<Role> selrolebyid(Integer rid) {
		List<Role> lst=roleimpl.selrolebyid(rid);
		if(lst.isEmpty()){
			System.out.println("selrolebyid  null");
			return null;
		}else{
			System.out.println("selrolebyid  have");
			return lst;
		}
	}
	public List<Role> selrolebyname(String rname) {
		List<Role> lst=roleimpl.selrolebyname(rname);
		if(lst.isEmpty()){
			System.out.println("selrolebyname  null");
			return null;
		}else{
			System.out.println("selrolebyname  have");
			return lst;
		}
	}
	/**
	 * 根据id删除角色表信息
	 * 
	 * @param rid
	 * @return boolean
	 */
	public boolean delrole(Integer rid) {
		if (roleimpl.delrole(rid)>=0) {
			System.out.println("delrole  true");
			return true;
		} else {
			System.out.println("delrole  false");
			return false;
		}
	}

	/**
	 * 根据rid判断是否存在角色表信息
	 * 
	 * @param rid
	 * @return boolean 存在返回true ，否则返回false
	 */
	public boolean haverole(Integer rid) {
		if (roleimpl.get(rid) == null) {
			System.out.println("haverole  false");
			return false;
		} else {
			System.out.println("haverole  true");
			return true;
		}
	}
	/**
	 * 根据rid更新角色表
	 * @param rid
	 * @param rname
	 * @param rnamec
	 * @param rimformation
	 * @param rmaxnum
	 * @return boolean
	 */
	public boolean updrole(Integer rid, String rname, String rnamec,
			String rimformation, Integer rmaxnum) {
		if(roleimpl.updpri(rid,rname,rnamec,rimformation,rmaxnum)>=0){
			System.out.println("updrole  true");
			return true;
		}else{
			System.out.println("updrole  false");
			return false;
		}
	}
	/**
	 * 添加角色
	 * @param rid
	 * @param rname
	 * @param rnamec
	 * @param rimformation
	 * @param rmaxnum
	 * @return boolean
	 */
	public boolean addrole(Integer rid, String rname, String rnamec,
			String rimformation, Integer rmaxnum) {
		if(roleimpl.addpri(rid,rname,rnamec,rimformation,rmaxnum)>=0){
			System.out.println("addrole  true");
			return true;
		}else{
			System.out.println("addrole  false");
			return false;
		}
	}
	/**
	 * 根据条件查询角色信息
	 * @param rid
	 * @param rname
	 * @param rnamec
	 * @param rimformation
	 * @param rmaxnum
	 * @return List<Role> 空则返回null
	 */
	public List<Role> getlistroleby(String rid, String rname, String rnamec,
			String rimformation, String rmaxnum) {
		List<Role> lst=roleimpl.getlistroleby(rid,rname,rnamec,rimformation,rmaxnum);
		if(lst.isEmpty()){
			System.out.println("getlistroleby  null");
			return null;
		}else{
			System.out.println("getlistroleby  have");
			return lst;
		}
	}

	
}
