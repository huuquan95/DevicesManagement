package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.Account;
import entities.Devices;
import entities.Employee;
import utils.StringUtils;

@Repository
public class AccountDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Account> getItems() {
		String sql = "select A.id, A.username, A.password, A.role, A.id_Employee, A.enabled, E.name, E.picture  from Account as A INNER JOIN Employee as E ON A.id_Employee= E.id";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Account.class));
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Account checkAccount(String username) {
		String sql = "SELECT * FROM Account WHERE username=?";
		try {
			return (Account) jdbcTemplate.queryForObject(sql, new Object[] { username },
					new BeanPropertyRowMapper(Account.class));
		} catch (Exception e) {
			return null;
		}
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Account getItem(String username) {
		String sql = "Select a.id as id,e.id as id_Employee,username,e.picture as picture, password,role from Account as a inner join Employee as e on a.id_Employee= e.id where username = ?";

		return (Account) jdbcTemplate.queryForObject(sql, new Object[] { username },
				new BeanPropertyRowMapper(Account.class));
	}

	public int addItem(Account objItem) {
		String sql = "INSERT INTO Account(username, password, role, id_Employee, enabled) value(?,?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] { objItem.getUsername(), StringUtils.md5(objItem.getPassword()),
				objItem.getRole(), objItem.getId_Employee(), 0 });
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Account getItem(int id) {
		String sql = "SELECT * FROM Account WHERE id=?";
		return (Account) jdbcTemplate.queryForObject(sql, new Object[] { id },
				new BeanPropertyRowMapper(Account.class));
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Devices> getItems(int id) {
		String sql = "SELECT * FROM Devices WHERE idAccount="+ id;
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Devices.class));
	}

	public int editItem(Account objItem) {
		if (!objItem.getPassword().isEmpty()) {
			String sql = "update Account set username=?,password=? where id=?";
			return jdbcTemplate.update(sql,
					new Object[] { objItem.getUsername(), StringUtils.md5(objItem.getPassword()), objItem.getId() });
		} else {
			String sql = "update Account set username=?,role=? where id=?";
			return jdbcTemplate.update(sql, new Object[] { objItem.getUsername(), objItem.getId() });
		}
	}

	public int delItem(int id) {
		String sql = "delete from Account where id=?";
		return jdbcTemplate.update(sql, new Object[] { id });
	}

	public int active(int id, int enabled) {
		String sql = "Update Account set enabled=? where id=?";
		return jdbcTemplate.update(sql, new Object[] { enabled, id });

	}

	public List<Employee> getListAdd() {
		String sql = "SELECT Employee.id, Employee.name FROM Employee WHERE id not in (SELECT id_Employee FROM Account)";
		try {
			return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Employee>(Employee.class));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}

	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Employee getItemByEmail(String email) {
		String sql = "Select * from Account inner join Employee on Employee.id=Account.id_Employee where Employee.email =? ";
		try{
			return (Employee) jdbcTemplate.queryForObject(sql, new Object[] { email },
					new BeanPropertyRowMapper(Employee.class));
		}catch(Exception e){
			return null;
		}
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Account getItemByIDEmployee(String id) {
		String sql = "Select Account.id_Employee,Account.id,username,password from Account inner join Employee on Employee.id=Account.id_Employee where Employee.id=?";
		try{
			return (Account) jdbcTemplate.queryForObject(sql, new Object[] { id },
					new BeanPropertyRowMapper(Account.class));
		}catch(Exception e){
			return null;
		}
	}
	
	public int updatePass(String new_pass,String id_Employee) {
		String sql = "update Account set password=? where id_Employee=?";
		return jdbcTemplate.update(sql,
				new Object[] { StringUtils.md5(new_pass),id_Employee});
}
//	@SuppressWarnings({ "unchecked", "rawtypes" })
//	public Employee getItemByLogin(String username) {
//		String sql = "Select *,picture from Account inner join Employee on Account.id_Employee= Employee.id where username = ?";
//		return (Employee) jdbcTemplate.queryForObject(sql, new Object[] { username },
//				new BeanPropertyRowMapper(Employee.class));
//	}
	
}
