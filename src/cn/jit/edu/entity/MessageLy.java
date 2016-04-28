package cn.jit.edu.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "messagely")
public class MessageLy {
	@Column(name = "mname", nullable = false)
	String mname; // 发布人的姓名

	@Column(name = "mcontent", nullable = false)
	String mcontent; // 评论的内容

	@Column(name = "mdate", nullable = false)
	Date mdate; // 发布留言的时间
	
	@Column(name = "msworkid", nullable = false)
	int   msworkid;						//作业通知表中的ID


	
	public int getMsworkid() {
		return msworkid;
	}

	public void setMsworkid(int msworkid) {
		this.msworkid = msworkid;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}


	public String getMcontent() {
		return mcontent;
	}

	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}

	public Date getMdate() {
		return mdate;
	}

	public void setMdate(Date mdate) {
		this.mdate = mdate;
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
