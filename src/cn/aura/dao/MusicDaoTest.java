package cn.aura.dao;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import cn.aura.domain.Music;

public class MusicDaoTest {
	Music music = new Music();
	private int id;
	private String mname;
	private String murl;
	private String author;

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testSelectAll() {
		MusicDao a = new MusicDao();
		boolean f;
		if(a.selectAll()!=null) {
			f=true;
		}else {
			f=false;
		}
		assertEquals(true,f);
	}

	@Test
	public void testAdd() {
		mname="花火";
		murl="huahuo.mp3";
		author="李四";
		music.setId(id);
		music.setMname(mname);
		music.setMurl(murl);
		music.setAuthor(author);
		MusicDao a = new MusicDao();
		assertEquals(true,a.add(music));
	}

	@Test
	public void testDel() {
		MusicDao a = new MusicDao();
		assertEquals(true,a.del(2));
	}

	@Test
	public void testSelectOne() {
		MusicDao dao = new MusicDao();
		boolean f;
		if(dao.selectOne(3)!=null) {
			f=true;
		}else {
			f=false;
		}
		assertEquals(true,f);
	}

	@Test
	public void testSelectByName() {
		MusicDao dao = new MusicDao();
		boolean f;
		if(dao.selectByName("红日")!=null) {
			f=true;
		}else {
			f=false;
		}
		assertEquals(true,f);
	}
		
	
}
