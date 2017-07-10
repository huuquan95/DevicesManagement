package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.Employee;

@Repository
public class EmployeeDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Employee> getList() {
		String sql = "Select employee.id,employee.name,birthday,address,phone,picture,position.name as namePos,team.name as nameTeam from employee left join position on employee.id_Position = position.id left join team on employee.id_Team = team.id";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Employee.class));
	}
}
