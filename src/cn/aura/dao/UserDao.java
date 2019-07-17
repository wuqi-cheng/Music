package cn.aura.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.aura.domain.User;
import cn.aura.utils.JdbcUtils;

public class UserDao {


	// 根据用户提供的账号与密码进行查询
	public User login(String username, String password){
		//创建数据库操作对象
		QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
		//在数据库中查询是否存在用户名和密码
		try {
			User user = queryRunner.query("select * from user where username = ? and password = ? ", new BeanHandler<User>(User.class),
					username,password);
			//如果存在，将查询到的数据返回出去
			return user;
		} catch (SQLException e) {
			e.printStackTrace();
			//如果没有，返回空对象。
			return null;
		}
	}
}
