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
		String sql = "Select employee.id,employee.name,birthday,address,phone,picture,role.namePos as namePos,team.name as nameTeam from employee left join role on employee.id_Position = role.id left join team on employee.id_Team = team.id";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Employee.class));
	}

	public int addItem(Employee objItem) {
		String sql = "Insert into employee(id,name,birthday,address,phone,picture,id_Position,id_Team) values(?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql,
				new Object[] { objItem.getId(), objItem.getName(), objItem.getBirthday(), objItem.getAddress(),
						objItem.getPhone(), objItem.getPicture(), objItem.getId_Position(), objItem.getId_Team() });
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Employee getItem(String idEmployee) {
		String sql = "Select * from employee where id = ?";
		return (Employee) jdbcTemplate.queryForObject(sql, new Object[] { idEmployee },
				new BeanPropertyRowMapper(Employee.class));
	}

	public int delItem(String id) {
		String sql = "Delete from employee where id = ?";
		return jdbcTemplate.update(sql, new Object[] { id });
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public boolean checkID(String id) {
		boolean check = true;
		String query = "SELECT * FROM employee";
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

		String sql = "UPDATE employee SET name = ?, birthday = ?, address = ?, phone = ?, picture = ?, id_Position = ?, id_Team = ? WHERE id = ?";
		return jdbcTemplate.update(sql,
				new Object[] { objEmployee.getName(), objEmployee.getBirthday(), objEmployee.getAddress(),
						objEmployee.getPhone(), objEmployee.getPicture(), objEmployee.getId_Position(),
						objEmployee.getId_Team(), objEmployee.getId() });

	}
}
