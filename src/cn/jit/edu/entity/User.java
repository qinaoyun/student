package cn.jit.edu.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@Entity (name="user")
public class User {
	@Column(name = "sheadimg", nullable = false)
	String sheadimg;								//用户头像
	@Column(name = "sname", nullable = false) 
	String sname;									//用户名
	@Column(name = "sno", nullable = false, unique = true)
	String sno;										//学号
	@Column(name = "spasswd", nullable = false)
	String spasswd;									//密码		
	@Column(name = "sdesc", nullable = true)
	String sdesc;									//个性签名
	@Column(name = "sclass", nullable = false)
	String sclass;									//班级
	@Column(name = "scollege", nullable = false)
	String scollege;								//学院；暂时显示插入中文。。后期可能会改
	@Column(name = "status", nullable = false)
	String status;									//身份；0表示普通学生，1表示学委，2表示班长，3表示任课老师
	@Column(name = "semail", nullable = false)
	String semail;									//电子邮箱
	@Column(name = "ssex", nullable = false)
	String ssex;									//性别；0表示女；1表示男
	@Column(name = "scontact", nullable = false)
	String scontact;								//联系方式
	@Column(name = "smodifydate", nullable = false)
	Date   smodifydate;								//修改日期
//	@OneToMany(cascade = CascadeType.ALL, mappedBy = "oneId")//指向多的那方的pojo的关联外键字段   
//	Collection manyCollection;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	int ID;											//主键id

	public String getSheadimg() {
		return sheadimg;
	}

	public void setSheadimg(String sheadimg) {
		this.sheadimg = sheadimg;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public String getSpasswd() {
		return spasswd;
	}

	public void setSpasswd(String spasswd) {
		this.spasswd = spasswd;
	}

	public String getSdesc() {
		return sdesc;
	}

	public void setSdesc(String sdesc) {
		this.sdesc = sdesc;
	}

	public String getSclass() {
		return sclass;
	}

	public void setSclass(String sclass) {
		this.sclass = sclass;
	}

	public String getScollege() {
		return scollege;
	}

	public void setScollege(String scollege) {
		this.scollege = scollege;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSemail() {
		return semail;
	}

	public void setSemail(String semail) {
		this.semail = semail;
	}
	
	

	public String getSsex() {
		return ssex;
	}

	public void setSsex(String ssex) {
		this.ssex = ssex;
	}

	public String getScontact() {
		return scontact;
	}

	public void setScontact(String scontact) {
		this.scontact = scontact;
	}

	public Date getSmodifydate() {
		return smodifydate;
	}

	public void setSmodifydate(Date smodifydate) {
		this.smodifydate = smodifydate;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}




}
