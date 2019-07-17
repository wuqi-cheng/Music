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
 * 主页的Servlet，用来显示音乐
 *
 */
@WebServlet("/IndexServlet")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置中文编码
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		//查询所有的音乐
		MusicDao musicDao = new MusicDao();
		List<Music> result = musicDao.selectAll();
		
		//将查询内容返回给前端页面
		response.getWriter().write(JSONObject.toJSONString(result));
	}
}
