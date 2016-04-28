package cn.jit.edu.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;

public class LogonUtils {

	/**  
	* @Name: checkNumber
	* @Description: 首页登录中添加验证码的功能
	* @Version: V1.00 （版本号）
	* @Create Date: 2016-3-17 （创建日期）
	* @Parameters: HttpServletRequest request对象
	* @Return: boolean true 验证成功
	*                  false 验证失败
	*/
	public static boolean checkNumber(HttpServletRequest request) {
		//从session中获取验证码的数值
		HttpSession session = request.getSession(false);
		if(session==null){
			return false;
		}
		String check_number_key = (String)session.getAttribute("CHECK_NUMBER_KEY");
		if(StringUtils.isBlank(check_number_key)){
			return false;
		}
		//从登录页面获取验证码的数值
		String checkNumber = request.getParameter("checkNumber");
		if(StringUtils.isBlank(checkNumber)){
			return false;
		}
		return check_number_key.equalsIgnoreCase(checkNumber);
	}
	
	/**  
	* @throws UnsupportedEncodingException 
	* @Name: remeberMeByCookie
	* @Description: 首页登录中添加记住我的功能
	* @Version: V1.00 （版本号）
	* @Create Date: 2016-3-17 （创建日期）
	* @Parameters: HttpServletRequest request对象
	*              HttpServletResponse response对象
	* @Return: 无
	*/

		

}

