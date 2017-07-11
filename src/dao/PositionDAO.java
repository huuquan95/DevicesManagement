package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.Position;

@Repository
public class PositionDAO {

	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Position> getItems(){
		String sql="select * from role";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Position.class));
	}  
	
	
	public int addItem(Position objItem) {
		String sql="insert into role(name) value (?)";
		return jdbcTemplate.update(sql, new Object[]{objItem.getNamePos()});
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Position checkPos(String name) {
		String sql="select name from role where name= ?";
		try{
			return (Position) jdbcTemplate.queryForObject(sql,new Object[]{name},new BeanPropertyRowMapper(Position.class));
		}catch(Exception e){
			return null;
		}
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Position getItem(int id) {
		String sql="select * from role where id=?";
		return (Position) jdbcTemplate.queryForObject(sql, new Object[]{id},new BeanPropertyRowMapper(Position.class));
	}
	
	
	public int editItem(Position objItem) {
		String sql="update role set name=? where id=?";
		return jdbcTemplate.update(sql, new Object[]{objItem.getNamePos(),objItem.getId()});
	}
	
	public int delItem(int id) {
		String sql="delete from role where id=?";
		return jdbcTemplate.update(sql, new Object[]{id});
	}
	
}
