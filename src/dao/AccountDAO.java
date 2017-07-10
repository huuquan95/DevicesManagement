package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.Account;




@Repository
public class AccountDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Account> getItems(){
		String sql="select A.id, A.username, A.password, A.role, "
				+ "A.id_Employee, E.name, E.picture  from Account as A "
				+ "INNER JOIN Employee as E ON A.id_Employee= E.id";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Account.class));
	}
 
	
}
