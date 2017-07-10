package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.Account;
import entities.Employee;
import utils.StringUtils;





@Repository
public class AccountDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Account> getItems(){
		String sql="select A.id, A.username, A.password, A.role, A.id_Employee, A.enabled, E.name, E.picture  from Account as A INNER JOIN Employee as E ON A.id_Employee= E.id";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Account.class));
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Account checkAccount(String username) {
		String sql="SELECT * FROM Account WHERE username=?";
		try{
			return (Account) jdbcTemplate.queryForObject(sql, new Object[]{username},new BeanPropertyRowMapper(Account.class));
		}catch(Exception e){
			return null;
		}
	}
	public int addItem(Account objItem) {
		String sql="INSERT INTO Account(username, password, role, id_Employee, enabled) value(?,?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[]{objItem.getUsername(),StringUtils.md5(objItem.getPassword()), objItem.getRole(), objItem.getId_Employee(), 0});
	}
	public Account getItem(int id) {
		String sql="SELECT * FROM Account WHERE id=?";
		return (Account) jdbcTemplate.queryForObject(sql, new Object[]{id},new BeanPropertyRowMapper(Account.class));
	}

	public int editItem(Account objItem) {
		if(!objItem.getPassword().isEmpty()){
			String sql="update Account set username=?,password=? where id=?";
			return jdbcTemplate.update(sql,new Object[]{objItem.getUsername(),StringUtils.md5(objItem.getPassword()),objItem.getId()});
		}else{
			String sql="update Account set username=?,role=? where id=?";
			return jdbcTemplate.update(sql,new Object[]{objItem.getUsername(),objItem.getId()});
		}
	}
	public int delItem(int id) {
		String sql="delete from Account where id=?";
		return jdbcTemplate.update(sql,new Object[]{id});
	}
	public int active(int id, int enabled) {
		String sql="Update Account set enabled=? where id=?";
		return jdbcTemplate.update(sql, new Object[] {enabled,id});
		
	}
	
	public List<Employee> getListAdd() {
		String sql = "SELECT Employee.id, Employee.name FROM Employee WHERE id not in (SELECT id_Employee FROM Account)";
		try{
			return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Employee>(Employee.class));
		} catch(EmptyResultDataAccessException e) {
			return null;
		}
		
	}
}
 
	
		

