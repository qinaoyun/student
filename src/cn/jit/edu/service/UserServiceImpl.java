package cn.jit.edu.service;
import java.util.List;

import cn.jit.edu.dao.*;
import javax.annotation.Resource;
import cn.jit.edu.entity.*;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Service;
@Service("userImpl")
public class UserServiceImpl implements UserService {
	@Resource(name="entityDao")
	private EntityDao entityDao1;
	
	
	public UserServiceImpl()
	{
		
		
	}
	public UserServiceImpl(int m)
	{
		
		
	}
	
//	
//	public List<Object> findPage(int first,int pagesize)
//	{ 
//		//创建动态查询对象
//		/*DetachedCriteria  dcriteria=DetachedCriteria.forClass(User.class);
//		///dcriteria.setf
//		return entityDao1.findPage(dcriteria, first, pagesize);
//		*/
//		return entityDao1.findPage("from user", first, pagesize);
//	}
	
	public List<Object> getlist()
	{
		return entityDao1.createQuery("from user");
	}
	public EntityDao getEntityDao1() {
		return entityDao1;
	}
	public void setEntityDao1(EntityDao entityDao1) {
		this.entityDao1 = entityDao1;
	}
	@Override
	public List<Object> findPage(int first, int pagesize) {
		// TODO Auto-generated method stub
		return null;
	}

}
