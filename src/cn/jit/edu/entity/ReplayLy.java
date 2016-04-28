package cn.jit.edu.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "replayly")
public class ReplayLy {
	@Column(name = "rname", nullable = false)
	String rname; // 发布人的姓名

	@Column(name = "rcontent", nullable = false)
	String rcontent; // 评论的内容

	@Column(name = "rdate", nullable = false)
	Date rdate; // 回复留言的时间
    
	@Column(name = "messageid", nullable = false)
	int  messageid; // 回复的留言的ID

	
	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	

	public int getMessageid() {
		return messageid;
	}

	public void setMessageid(int messageid) {
		this.messageid = messageid;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int ID; // 主键id

}
