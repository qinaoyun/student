package cn.jit.edu.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity (name="collegeinfo")
public class  Collegeinfo{
	@Column(name = "collegeinfo", nullable = false)
	String collegeinfo;							//学院

	
	@Column(name = "joindate", nullable = false)
	Date joindate;									//写入数据表时间
	@Column(name = "modifydate", nullable = false)
	Date modifydate;								//修改数据表时间
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	int ID;									//主键id

	public String getCollogeinfo() {
		return collegeinfo;
	}

	public void setCollogeinfo(String collogeinfo) {
		this.collegeinfo = collogeinfo;
	}


	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}

	public Date getModifydate() {
		return modifydate;
	}

	public void setModifydate(Date modifydate) {
		this.modifydate = modifydate;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}
	
}
