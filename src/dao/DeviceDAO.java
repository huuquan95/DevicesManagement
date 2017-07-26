package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.Devices;

@Repository
public class DeviceDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	// id employee
	public List<Devices> getItemsByEmployee(String id){
		String sql="select d.id,d.seri_number,d.idAccount,d.name,d.made_in,d.price,d.warranty,d.picture,"
				+"account.id_Employee from devices as d left join account "
				+"on d.idAccount = account.id where account.id_Employee ='"+id+"'";		
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Devices.class));
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Devices> getItems(){
		String sql="select distinct d.id as id, c.id as idCat,"
				+ "d.name, d.made_in, d.picture,d.seri_number,c.name as cname from Devices as d "
				+ "inner join Category as c on c.id=d.idCat";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Devices.class));
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Devices> getItemsByIdCat(int id){
		String sql="select distinct d.id as id, c.id as idCat,"
				+ "d.name, d.made_in, d.picture,c.name as cname from Devices as d "
				+ "inner join Category as c on c.id=d.idCat where c.id="+id;
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Devices.class));
	}
	
	public int getCount(String id){
		String sql="SELECT count(seri_number) as soluong FROM Devices WHERE id='"+id+"'";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Devices> getItemDetails(String id) {
		String sql="select a.id as idAccount,username, status, isnew,date_start,"
				+ "d.name,seri_number,warranty,price from Devices as d "
				+ "inner join Account as a on a.id=d.idAccount "
				+ " where d.id='"+id +"'";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Devices.class));
	}
	public int addItem(Devices objItem) {
		String sql="insert into Devices(id, seri_number,name,idAccount,idCat,made_in,price,warranty,isnew,status,picture) value (?,?,?,?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[]{objItem.getId(),objItem.getSeri_number(),
				objItem.getName(),objItem.getIdAccount(),objItem.getIdCat(),
				objItem.getMade_in(),objItem.getPrice(),objItem.getWarranty(),
				objItem.getIsnew(),objItem.getStatus(),objItem.getPicture()});
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Devices checkDevices(String id,String seri_number) {
		String sql="select name from Devices where id=? and seri_number=?";
		try{
			return (Devices) jdbcTemplate.queryForObject(sql,new Object[]{id,seri_number},new BeanPropertyRowMapper(Devices.class));
		}catch(Exception e){
			return null;
		}
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Devices getItemDetail(String id) {
		String sql="select * from Devices where id=? limit 1";
		return (Devices) jdbcTemplate.queryForObject(sql, new Object[]{id},new BeanPropertyRowMapper(Devices.class));
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Devices getItem(String seri) {
		String sql="select * from Devices where seri_number=?";
		return (Devices) jdbcTemplate.queryForObject(sql, new Object[]{seri},new BeanPropertyRowMapper(Devices.class));
	}

	public int editItem(Devices objItem) {
		String sql="update Devices set name=?,idCat=?, made_in=?,picture=? where id=?";
		return jdbcTemplate.update(sql, new Object[]{objItem.getName(),objItem.getIdCat(),
				objItem.getMade_in(),objItem.getPicture(),objItem.getId()});
	}
	
	public int delItem(String id) {
		String sql="delete from Devices where id=?";
		return jdbcTemplate.update(sql, new Object[]{id});
	}
	
	public int delItemSeri(String seri) {
		String sql="delete from Devices where seri_number=?";
		return jdbcTemplate.update(sql, new Object[]{seri});
	}
	
	public int editItem1(Devices objItem) {
		String sql="update Devices set idAccount=?, price=?,warranty=?,isnew=?,status=? where seri_number=?";
		return jdbcTemplate.update(sql, new Object[]{objItem.getIdAccount(),
				objItem.getPrice(),objItem.getWarranty(),objItem.getIsnew(),objItem.getStatus(),objItem.getSeri_number()});
	}

	public int changeAccount(String seri, int idAccount) {
		String sql="update Devices set idAccount=? where seri_number=?";
		return jdbcTemplate.update(sql, new Object[]{idAccount,seri});
		
	}
	
	public int delItemByIDCat(int idCat) {
		String sql="delete from Devices where idCat=?";
		return jdbcTemplate.update(sql, new Object[]{idCat});
		
	}

}
