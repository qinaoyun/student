package cn.jit.edu.service;
import java.util.List;

public interface UserService {
	List<Object> getlist();
	List<Object>  findPage(int first,int pagesize);

}
