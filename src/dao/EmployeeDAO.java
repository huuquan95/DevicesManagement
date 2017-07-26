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
		String sql = "Select Employee.id,Employee.name,birthday,address,phone,picture,Role.namePos as namePos,Team.name as nameTeam from Employee left join Role on Employee.id_Position = Role.id left join Team on Employee.id_Team = Team.id";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Employee.class));
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Employee> getListByTeam(String id) {
		String sql = "select * from employee where id_Team ='" + id + "'";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Employee.class));
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Employee> getListByRole(int id) {
		String sql = "select * from employee where id_Position ='" +id +"'";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Employee.class));
	}

	public int addItem(Employee objItem) {
		String sql = "Insert into Employee(id,name,birthday,address,phone,picture,id_Position,id_Team,email) values(?,?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql,
				new Object[] { objItem.getId(), objItem.getName(), objItem.getBirthday(), objItem.getAddress(),
						objItem.getPhone(), objItem.getPicture(), objItem.getId_Position(), objItem.getId_Team(),objItem.getEmail() });
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Employee getItem(String idEmployee) {
		String sql = "Select * from Employee where id = ?";
		return (Employee) jdbcTemplate.queryForObject(sql, new Object[] { idEmployee },
				new BeanPropertyRowMapper(Employee.class));
	}

	public int delItem(String id) {
		String sql = "Delete from Employee where id = ?";
		return jdbcTemplate.update(sql, new Object[] { id });
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public boolean checkID(String id) {
		boolean check = true;
		String query = "SELECT * FROM Employee";
		List<Employee> objItem = jdbcTemplate.query(query, new BeanPropertyRowMapper(Employee.class));
		for (Employee item : objItem) {
			if (id.equalsIgnoreCase(item.getId())) {
				check = false;
				break;
			}
		}
		return check;
	}

	public int editItem(Employee objEmployee) {

		String sql = "UPDATE Employee SET name = ?, birthday = ?, address = ?, phone = ?, picture = ?, id_Position = ?, id_Team = ? ,email=? WHERE id = ?";
		return jdbcTemplate.update(sql,
				new Object[] { objEmployee.getName(), objEmployee.getBirthday(), objEmployee.getAddress(),
						objEmployee.getPhone(), objEmployee.getPicture(), objEmployee.getId_Position(),
						objEmployee.getId_Team(),objEmployee.getEmail(), objEmployee.getId() });

	}
	
}
