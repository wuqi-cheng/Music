package cn.aura.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.aura.domain.Music;
import cn.aura.utils.JdbcUtils;

public class MusicDao {
	
	// 查询所有的音乐
	public List<Music> selectAll(){
		//创建数据库操作对象
		QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
		try {
			//如果对象创建成功，返回集合
			return queryRunner.query("select * from music", new BeanListHandler<Music>(Music.class));
		} catch (SQLException e) {
			e.printStackTrace();
			//如果对象创建失败，返回空
			return null;
		}
	}

	//添加音乐
	public boolean add(Music music){
		QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
		try {
			queryRunner.update("insert into music values(null,?,?,?)",
					music.getMname(),music.getMurl(),music.getAuthor());
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	
	// 根据音乐的id，删除音乐
	public boolean del(int id) {
		QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
		try {
			//删除数据库对象
			queryRunner.update("delete from music where id = ?",id);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// 根据音乐的id来查询音乐
	public Music selectOne(int id) {
		QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
		//寻找到对象
		try {
			return queryRunner.query("select * from music where id = ?", new BeanHandler<Music>(Music.class),id);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	//根据音乐名称或作者来实现搜索
	public List<Music> selectByName(String value) {
		QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
		try {
			return queryRunner.query("select * from music where mname like '%"+value+"%' or author like '%"+value+"%'", new BeanListHandler<Music>(Music.class));
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
