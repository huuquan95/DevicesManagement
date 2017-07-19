package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


import entities.Team;

@Repository
public class TeamDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Team> getItems(){
		String sql="select * from Team";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Team.class));
	}  
	
	
	public int addItem(Team objItem) {
		String sql="insert into Team(name) value (?)";
		return jdbcTemplate.update(sql, new Object[]{objItem.getName()});
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Team checkTeam(String name) {
		String sql="select name from Team where name= ?";
		try{
			return (Team) jdbcTemplate.queryForObject(sql,new Object[]{name},new BeanPropertyRowMapper(Team.class));
		}catch(Exception e){
			return null;
		}
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Team getItem(String id) {
  		String sql="select * from Team where id=?";
  		return (Team) jdbcTemplate.queryForObject(sql, new Object[]{id},new BeanPropertyRowMapper(Team.class));
  	}
	
	public int editItem(Team objItem) {
		String sql="update Team set name=? where id=?";
		return jdbcTemplate.update(sql, new Object[]{objItem.getName(),objItem.getId()});
	}
	
	public int delItem(String id) {
  		String sql="delete from Team where id=?";
  		return jdbcTemplate.update(sql, new Object[]{id});
  	}
}
