package cn.aura.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;

import cn.aura.dao.MusicDao;
import cn.aura.domain.Music;

/**
 * 
 * @author 伍
 * 查询界面的后台表现层
 *
 */
@WebServlet("/SelectServlet")
public class SelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置中文乱码
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		//创建MusicDao对象
		MusicDao musicDao = new MusicDao();
		
		//获取内容
		String value = request.getParameter("value");
		//进行判断
		if(value == "" || value == null){
			//搜索所有
			List<Music> result = musicDao.selectAll();
			//将内容返回给前端页面
			response.getWriter().write(JSONObject.toJSONString(result));
		}else {
			//根据条件搜索
			List<Music> result = musicDao.selectByName(value);
			//将查询的内容返回给前端页面
			response.getWriter().write(JSONObject.toJSONString(result));
		}
	}

}
