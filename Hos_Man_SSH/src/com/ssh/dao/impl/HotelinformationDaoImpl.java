package com.ssh.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ssh.bean.Book_Hotelimformation;
import com.ssh.bean.Hotelimformation;
import com.ssh.dao.IHotelimformationDao;

@Repository
public class HotelinformationDaoImpl extends
		BaseDaoImpl<Hotelimformation, Integer> implements IHotelimformationDao {

	@Override
	public List<Book_Hotelimformation> gethotelimftop3() {
		// 联表查询
		StringBuffer buf = new StringBuffer();
		buf.append(" select * ");
		buf.append(" from book B LEFT JOIN hotelimformation H ");
		buf.append(" ON B.h_name=H.hi_name ");
		buf.append(" WHERE B.h_name IN ( ");
		buf.append(" SELECT h_name ");
		buf.append(" FROM ( ");
		buf.append(" SELECT h_name FROM book ");
		buf.append(" GROUP BY h_name ");
		buf.append(" ORDER BY COUNT(*) desc ");
		buf.append(" LIMIT 0,3) ");
		buf.append(" AS t) ");
		buf.append(" GROUP BY B.h_name; ");
		return super.getListBySQL_JDBC(Book_Hotelimformation.class,
				buf.toString());
	}

	@Override
	public List<Hotelimformation> gethotelimfbyname(String hiname) {
		StringBuffer buf = new StringBuffer();
		buf.append(" select * ");
		buf.append(" from hotelimformation ");
		buf.append(" where hi_name LIKE ?; ");
		return super.getListBySQL(buf.toString(), "%" + hiname + "%");
	}

	@Override
	public List<Hotelimformation> getlisthotimf() {
		String sql = "select * from hotelimformation order by hi_id;";
		return super.getListBySQL(sql);
	}

	@Override
	public List<Hotelimformation> selhotimfbyid(Integer hiid) {
		String sql = "select * from hotelimformation where hi_id=?;";
		return super.getListBySQL(sql, hiid);
	}

	@Override
	public boolean delhotimf(Integer hiid) {
		return super.deleteById(hiid);
	}

	@Override
	public int updhotimf(Integer hiid, String hiname, String hitype,
			String hibed, String hiarea, String hiwifi, String hiairt,
			String hibreakf, Integer hiprice, String hifloor, String hiimfor,
			Integer hi_addlevsco) {
		StringBuffer sql = new StringBuffer();
		sql.append(" UPDATE hotelimformation SET hi_name=?,hi_type=?,hi_bed=?,hi_area=? ");
		sql.append(" ,hi_wifi=?,hi_airt=?,hi_breakf=?,hi_price=?,hi_floor=?,hi_imfor=?,hi_addlevsco=? ");
		sql.append(" WHERE hi_id = ? ");
		return super.querySql(sql.toString(), hiname, hitype, hibed, hiarea,
				hiwifi, hiairt, hibreakf, hiprice, hifloor, hiimfor,
				hi_addlevsco, hiid);
	}

	@Override
	public int addhotimf(String hiname, String hitype, String hibed,
			String hiarea, String hiwifi, String hiairt, String hibreakf,
			Integer hiprice, String hifloor, String hiimfor,
			Integer hi_addlevsco) {
		StringBuffer sql=new StringBuffer();
		sql.append(" insert into ");
		sql.append(" hotelimformation( hi_name,hi_type,hi_bed,hi_area,hi_wifi,hi_airt,hi_breakf,hi_price,hi_floor,hi_imfor,hi_addlevsco) ");
		sql.append(" values(?,?,?,?,?,?,?,?,?,?,?); ");
		return super.querySql(sql.toString(),hiname, hitype, hibed, hiarea,
				hiwifi, hiairt, hibreakf, hiprice, hifloor, hiimfor,
				hi_addlevsco);
	
	}

	@Override
	public List<Hotelimformation> getlisthotimfby(String hiid, String hname,
			String type,String bed, String breakf, String addlevsco, String pri1,
			String pri2, String floor1, String floor2, String area1,
			String area2, String hotimf) {
		StringBuffer sql=new StringBuffer();
		sql.append(" select * from hotelimformation where 1=1  ");
		if(hiid!=""){
			sql.append(" and hi_id="+hiid+" ");
		}
		sql.append(" and hi_name like '%"+hname+"%' ");
		if(type!=""){
			sql.append(" and hi_type="+type+" ");
		}
		if(!bed.equals("全部")){
			sql.append(" and hi_bed='"+bed+"' ");
		}
		if(!breakf.equals("全部")){
			sql.append(" and hi_breakf='"+breakf+"' ");
		}
		if(addlevsco!=""){
			sql.append(" and hi_addlevsco="+addlevsco+" ");
		}
		if(pri1!=""){
			sql.append(" and hi_price>="+pri1+" ");
		}
		if(pri2!=""){
			sql.append(" and hi_price<="+pri2+" ");
		}
		if(floor1!=""){
			sql.append(" and CAST((SELECT substring_index(hi_floor,'~', 1)) AS signed)>=CAST('"+floor1+"' AS signed) ");
		}
		if(floor2!=""){
			sql.append(" and CAST((SELECT substring_index(hi_floor,'~', -1)) AS signed)<=CAST('"+floor2+"' AS signed) ");
		}
		if(area1!=""){
			sql.append(" and CAST((SELECT substring_index(hi_area,'~', 1)) AS signed)>=CAST('"+area1+"' AS signed) ");
		}
		if(area2!=""){
			sql.append(" and CAST((SELECT substring_index(hi_area,'~', -1)) AS signed)<=CAST('"+area2+"' AS signed) ");
		}
		sql.append(" and hi_imfor like '%"+hotimf+"%' ");
		sql.append(" order by hi_type ");
		return super.getListBySQL(sql.toString());
	}

}
