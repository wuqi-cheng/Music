package cn.aura.domain;

/**
 * 
 * @author 伍
 * 音乐表
 *
 */
public class Music {

	private int id;
	private String mname;
	private String murl;
	private String author;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMurl() {
		return murl;
	}
	public void setMurl(String murl) {
		this.murl = murl;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	
	@Override
	public String toString() {
		return "Music [id=" + id + ", mname=" + mname + ", murl=" + murl
				+ ", author=" + author + "]";
	}
}
