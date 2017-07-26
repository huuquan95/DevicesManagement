
package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.Account;
import entities.Devices;
import entities.History;

@Repository
public class HistoryDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<History> getItems(){
		String sql="select his.id,dev.name,his.seri_number,his.action from History as his left join Account as acc on his.id_Account = acc.id"
				+" inner join Devices as dev on his.idEquipment = dev.id and his.seri_number = dev.seri_number order by his.id desc ";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper(History.class));
	}

	public int addItems(History objHis) {
		String sql = "Insert into History(id_Account,timestart,action,idEquipment,seri_number) value(?,?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[]{objHis.getId_Account(), objHis.getTimeStart(), objHis.getAction(), objHis.getId_Equipment(), objHis.getSeri_number()});
	}  
	
	public int updateItems(History objHis) {
		String sql = "Update History set id_Account = ?,timestart = ?,action = ?,idEquipment = ?,seri_number = ? where id = ?";
		return jdbcTemplate.update(sql, new Object[]{objHis.getId_Account(), objHis.getTimeStart(), objHis.getAction(), objHis.getId_Equipment(), objHis.getSeri_number(), objHis.getId()});
	}  
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Devices checkValid(String seriNumber , String idEquip) {
		String sql = "Select * from Devices where id = ? and seri_number = ?";
		try {
			return (Devices) jdbcTemplate.queryForObject(sql,new Object[] {idEquip , seriNumber}, new BeanPropertyRowMapper(Devices.class));
		} catch (EmptyResultDataAccessException e){
			return null;
		}
		
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Devices> getItemsDevice(){
		String sql="select distinct d.id as id, d.seri_number as seri_number, c.id as idCat,"
				+ "d.name, d.made_in, d.picture,c.name as cname from Devices as d "
				+ "inner join Category as c on c.id=d.idCat"
				+ " Where d.seri_number not in (SELECT seri_number FROM History)";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Devices.class));
	}  
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Account> getItemsAccount() {
		String sql = "select A.id, A.username, A.password, A.role, A.id_Employee, A.enabled, E.name, E.picture  from Account as A INNER JOIN Employee as E ON A.id_Employee= E.id";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Account.class));
	}
	
	public int delItem(int idHis) {
		String sql = "Delete from History where id = ?";
		return jdbcTemplate.update(sql, new Object[]{idHis});
	} 
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public History getDetail(int idHis){
		String sql="select his.id as id,acc.id as id_Account,dev.id as id_Equipment,dev.name as name,dev.date_start as date_start,dev.picture as picture,cat.id as idCat,cat.name as nameCat,his.seri_number,his.timestart,his.action,acc.username as username from History as his inner join Account as acc on his.id_Account = acc.id"
				+" inner join Devices as dev on his.idEquipment = dev.id and his.seri_number = dev.seri_number"
				+ " inner join Category as cat on dev.idCat = cat.id where his.id = ?";
		return (History) jdbcTemplate.queryForObject(sql, new Object[] {idHis},new BeanPropertyRowMapper(History.class));
	}
	
}
