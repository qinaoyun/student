package cn.jit.edu.dao;
import java.util.List;   

import org.hibernate.criterion.DetachedCriteria;

public interface EntityDao {   
    public List<Object> createQuery(final String queryString);   
    public Object save(final Object model);   
    public void update(final Object model);   
    public void delete(final Object model);  
    
    public List<Object> findPage(final String queryString,final String page,final String rows);
    public void delete(final String queryString);
    public void update(final String queryString);
    public int count(final String queryString);
}  
