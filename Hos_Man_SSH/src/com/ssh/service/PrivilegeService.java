package com.ssh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssh.bean.Privilege;
import com.ssh.dao.IPrivilegeDao;
import com.ssh.dao.IRolePrivilegeDao;

@Transactional
@Service
public class PrivilegeService {
	@Autowired
	private IPrivilegeDao privilegedaoimpl;

	/**
	 * 获得所有权限表信息
	 * 
	 * @return List<Privilege>
	 */
	public List<Privilege> getlistpri() {
		System.out.println("getlistpri  have");
		return privilegedaoimpl.getlistpri();
	}

	public List<Privilege> selpribyid(Integer pid) {
		List<Privilege> lst = privilegedaoimpl.selpribyid(pid);
		if (lst.isEmpty()) {
			System.out.println("selpribyid  null");
			return null;
		} else {
			System.out.println("selpribyid  have");
			return lst;
		}
	}

	/**
	 * 根据id删除权限表信息
	 * 
	 * @param pid
	 * @return boolean
	 */
	public boolean delpri(Integer pid) {
		if (privilegedaoimpl.delpri(pid)>=0) {
			System.out.println("delpri  true");
			return true;
		} else {
			System.out.println("delpri  false");
			return false;
		}
	}

	/**
	 * 根据pid更新权限表
	 * 
	 * @param pid
	 * @param pfunction
	 * @param pimformation
	 * @return boolean
	 */
	public boolean updpri(Integer pid, String pfunction, String pimformation) {
		if (privilegedaoimpl.updpri(pid, pfunction, pimformation) >= 0) {
			System.out.println("updpri  true");
			return true;
		} else {
			System.out.println("updpri  false");
			return false;
		}
	}

	/**
	 * 根据pid判断是否存在权限表信息
	 * 
	 * @param pid
	 * @return boolean 存在返回true ，否则返回false
	 */
	public boolean havepri(Integer pid) {
		if (privilegedaoimpl.get(pid) == null) {
			System.out.println("havepri  false");
			return false;
		} else {
			System.out.println("havepri  true");
			return true;
		}
	}

	/**
	 * 添加权限
	 * 
	 * @param pid
	 * @param pfunction
	 * @param pimformation
	 * @return boolean
	 */
	public boolean addpri(Integer pid, String pfunction, String pimformation) {
		if (privilegedaoimpl.addpri(pid, pfunction, pimformation) >= 0) {
			System.out.println("addpri  true");
			return true;
		} else {
			System.out.println("addpri  false");
			return false;
		}
	}
	/**
	 * 根据条件查询权限信息
	 * @param pid
	 * @param pfunction
	 * @param pimformation
	 * @return List<Privilege> 空则返回null
	 */
	public List<Privilege> getlistpriby(String pid, String pfunction, String pimformation) {
		List<Privilege> lst = privilegedaoimpl.getlistpriby(pid,pfunction,pimformation);
		if (lst.isEmpty()) {
			System.out.println("getlistpriby  null");
			return null;
		} else {
			System.out.println("getlistpriby  have");
			return lst;
		}
	}
}
