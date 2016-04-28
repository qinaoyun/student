package cn.jit.edu.dao;
import java.util.List;   

import org.hibernate.Criteria;
import org.hibernate.Query;   
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate3.HibernateCallback;   
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;   
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

public class EntityDaoImpl extends HibernateDaoSupport implements EntityDao{   
 
	public List<Object> createQuery(final String queryString) { 
		//  List<?> list=  getSession().createQuery("from user").list();
		//getHibernateTemplate()
		  
		  List<?> list=getHibernateTemplate().executeFind(   
                new HibernateCallback<Object>() {   
                    public Object doInHibernate(org.hibernate.Session session)   
                            throws org.hibernate.HibernateException {   
                        Query query = session.createQuery(queryString);   
                       List<?> rows= query.list();   
                     return rows;   
                    }
                });
		  return (List<Object>)list;
    }   
    public Object save(final Object model) {   
        return  getHibernateTemplate().execute(   
                new HibernateCallback<Object>() {   
                    public Object doInHibernate(org.hibernate.Session session)   
                            throws org.hibernate.HibernateException {   
                        session.save(model);   
                        return null;   
                    }   
                });   
    }   
    public void update(final Object model) {   
        getHibernateTemplate().execute(new HibernateCallback<Object>() {   
            public Object doInHibernate(org.hibernate.Session session)   
                    throws org.hibernate.HibernateException {   
                session.update(model);   
                return null;   
            }   
        });   
    }   
    public void delete(final Object model) {   
        getHibernateTemplate().execute(
        new HibernateCallback<Object>() {   
            public Object doInHibernate(org.hibernate.Session session)   
                    throws org.hibernate.HibernateException {   
                session.delete(model);   
                return null;   
            }   
        });   
    }
    
    
    //分页对单个表的实体进行分页查询
    @SuppressWarnings("unchecked")
	public List<Object> findPage(DetachedCriteria criteria ,int firstResult,int pagesize)
    {
    	return getHibernateTemplate().findByCriteria(criteria, firstResult, pagesize);
    }
    
    @SuppressWarnings("unchecked")
	public List<Object> findPage(final String queryString,final String page, final String rows)
    {
    	 List<?> list=getHibernateTemplate().executeFind(   
                 new HibernateCallback<Object>() {   
                     public Object doInHibernate(org.hibernate.Session session)   
                             throws org.hibernate.HibernateException {  
                    	 int currentpage = Integer.parseInt((page==null || page == "0") ? "1": page);//第几页  
                         int pagesize = Integer.parseInt((rows == null || rows == "0") ? "10": rows);//每页多少行  
                         Query query = session.createQuery(queryString);   
                        List<?> rows= query.setFirstResult((currentpage-1)*pagesize).setMaxResults(pagesize).list();   
                      return rows;   
                     }
                 });
 		  return (List<Object>)list;
     } 
    public void delete(final String queryString)
    {
    	 getHibernateTemplate().execute(
    		        new HibernateCallback<Object>() {   
    		            public Object doInHibernate(org.hibernate.Session session)   
    		                    throws org.hibernate.HibernateException {   
    		                session.createQuery(queryString).executeUpdate();   
    		                return null;   
    		            }   
    		        });   
    	
    }
    public void update(final String queryString)
    {
    	 getHibernateTemplate().execute(
    		        new HibernateCallback<Object>() {   
    		            public Object doInHibernate(org.hibernate.Session session)   
    		                    throws org.hibernate.HibernateException {   
    		                session.createQuery(queryString).executeUpdate();   
    		                return null;   
    		            }   
    		        });   
    	
    }
    
    public int count(final String queryString)
    {
    	int n = 0;
    	 getHibernateTemplate().execute(
    		        new HibernateCallback<Object>() {   
    		            public Object doInHibernate(org.hibernate.Session session)   
    		                    throws org.hibernate.HibernateException {   
    		                int n=session.createQuery(queryString).executeUpdate();   
    		                return n;   
    		            }   
    		        });
		return n;   
    	
    }

    
}  
