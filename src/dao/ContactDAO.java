package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.Contact;

@Repository
public class ContactDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Contact> getItems() {
		String sql = "select id,id_Account, (SELECT username from Account WHERE Account.id= id_Account) as userName, "
				+ " status, description from Contact GROUP BY id DESC";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Contact.class));
	}

	public int addItem(Contact objItem) {
		String sql = "insert into Contact(id_Account,description,status) value (?,?,'new')";
		return jdbcTemplate.update(sql, new Object[] { objItem.getId_Account(), objItem.getDescription() });
	}

	public int editItem(Contact objItem) {
		String sql = "update Contact set status=? where id=?";
		return jdbcTemplate.update(sql, new Object[] { objItem.getStatus(), objItem.getId() });
	}

	public int delItem(int id) {
		String sql = "delete from Contact where id=?";
		return jdbcTemplate.update(sql, new Object[] { id });
	}
}