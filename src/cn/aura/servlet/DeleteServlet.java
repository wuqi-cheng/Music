package cn.aura.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.aura.dao.MusicDao;
import cn.aura.domain.Music;

/**
 * 删除音乐
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置中文编码，防止乱码
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		//获取需要删除音乐的id
		String id = request.getParameter("id");
		
		//删除操作
		MusicDao musicDao = new MusicDao();
		Music music = musicDao.selectOne(Integer.parseInt(id));
		if(music != null){
			//查询当前的音乐文件
			File file = new File(request.getServletContext().getRealPath("/music") + "/" + music.getMurl());
			file.delete();//删除文件
			System.out.println(file.getPath());
		}
		musicDao.del(Integer.parseInt(id));
		
		response.getWriter().write("删除成功！");
	}

}
