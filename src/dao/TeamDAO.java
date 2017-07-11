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
		String sql="select * from team";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Team.class));
	}  
	
	
	public int addItem(Team objItem) {
		String sql="insert into team(name) value (?)";
		return jdbcTemplate.update(sql, new Object[]{objItem.getName()});
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Team checkTeam(String name) {
		String sql="select name from team where name= ?";
		try{
			return (Team) jdbcTemplate.queryForObject(sql,new Object[]{name},new BeanPropertyRowMapper(Team.class));
		}catch(Exception e){
			return null;
		}
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Team getItem(int id) {
		String sql="select * from team where id=?";
		return (Team) jdbcTemplate.queryForObject(sql, new Object[]{id},new BeanPropertyRowMapper(Team.class));
	}
	
	
	public int editItem(Team objItem) {
		String sql="update team set name=? where id=?";
		return jdbcTemplate.update(sql, new Object[]{objItem.getName(),objItem.getId()});
	}
	
	public int delItem(int id) {
		String sql="delete from team where id=?";
		return jdbcTemplate.update(sql, new Object[]{id});
	}
}
