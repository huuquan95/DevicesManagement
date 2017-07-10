package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.Cat;

@Repository
public class CatDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Cat> getItems(){
		String sql="select * from Category";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Cat.class));
	}  

	public int addItem(Cat objItem) {
		String sql="insert into Category(name) value (?)";
		return jdbcTemplate.update(sql, new Object[]{objItem.getName()});
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Cat checkCat(String name) {
		String sql="select name from Category where name= ?";
		try{
			return (Cat) jdbcTemplate.queryForObject(sql,new Object[]{name},new BeanPropertyRowMapper(Cat.class));
		}catch(Exception e){
			return null;
		}
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Cat getItem(int id) {
		String sql="select * from Category where id=?";
		return (Cat) jdbcTemplate.queryForObject(sql, new Object[]{id},new BeanPropertyRowMapper(Cat.class));
	}

	public int editItem(Cat objItem) {
		String sql="update Category set name=? where id=?";
		return jdbcTemplate.update(sql, new Object[]{objItem.getName(),objItem.getId()});
	}
	
	public int delItem(int id) {
		String sql="delete from Category where id=?";
		return jdbcTemplate.update(sql, new Object[]{id});
	}

}