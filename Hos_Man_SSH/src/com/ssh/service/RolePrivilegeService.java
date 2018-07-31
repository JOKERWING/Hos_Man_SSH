package com.ssh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssh.bean.RolePrivilegeAll;
import com.ssh.bean.Staff;
import com.ssh.dao.IRolePrivilegeDao;
import com.ssh.dao.IStaffDao;






@Transactional
@Service
public class RolePrivilegeService {
	@Autowired
	private IRolePrivilegeDao roleprivilegeimpl;
	@Autowired
	private IStaffDao staffimpl;
	/**
	 * 根据rid查询该角色所拥有的完整权限信息
	 * @param rid
	 * @return List<RolePrivilegeAll> 存在返回lst，否则返回null
	 */
	public List<RolePrivilegeAll> selrolepriallbyrid(Integer rid) {
		List<RolePrivilegeAll> lst= roleprivilegeimpl.selrolepriallbyrid(rid);
		if(lst.isEmpty()){
			System.out.println("selrolepriallbyrid  null");
			return null;
		}else{
			System.out.println("selrolepriallbyrid  have");
			return lst;
		}
	}
	/**
	 * 根据rname查询该角色所拥有的完整权限信息
	 * @param rname
	 * @return List<RolePrivilegeAll> 存在返回lst，否则返回null
	 */
	public List<RolePrivilegeAll> selrolepriallbyrname(String rname) {
		List<RolePrivilegeAll> lst= roleprivilegeimpl.selrolepriallbyrname(rname);
		if(lst.isEmpty()){
			System.out.println("selrolepriallbyrname  null");
			return null;
		}else{
			System.out.println("selrolepriallbyrname  have");
			return lst;
		}
	}
	/**
	 * 给rid角色添加pid权限
	 * @param rid
	 * @param pid
	 * @return boolean
	 */
	public boolean addrolepri(Integer rid,Integer pid) {
		if(roleprivilegeimpl.addrolepri(rid, pid)>=0){
			System.out.println("addrolepri  true");
			return true;
		}else{
			System.out.println("addrolepri  false");
			return false;
		}
	}
	/**
	 * 给rid角色删除pid权限
	 * @param rid
	 * @param pid
	 * @return boolean
	 */
	public boolean delrolepri(Integer rid,Integer pid) {
		if(roleprivilegeimpl.delrolepri(rid, pid)>=0){
			System.out.println("delrolepri  true");
			return true;
		}else{
			System.out.println("delrolepri  false");
			return false;
		}
	}
	/**
	 * 查询用户是否有相应权限
	 * @param slogid
	 * @param pfunction
	 * @return boolean
	 */
	public boolean havepri(String slogid, String pfunction) {
		String rname=null;
		for(Staff s:staffimpl.selstabyid(slogid)){
			rname=s.getRname();
		}
		for(RolePrivilegeAll rp:roleprivilegeimpl.selrolepriallbyrname(rname)){
			if(pfunction.equals(rp.getPfunction())){
				System.out.println("havepri  true");
				return true;
			}
		}
		System.out.println("havepri  false");
		return false;
	}
}
