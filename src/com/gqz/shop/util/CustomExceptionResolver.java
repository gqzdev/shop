package com.gqz.shop.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerExceptionResolverComposite;

/**
 * 
* @ClassName: CustomExceptionResolver
* @Description: TODO(这里用一句话描述这个类的作用)
* @author ganquanzhong
* @date 2018-5-3 上午09:07:41
 */
public class CustomExceptionResolver extends HandlerExceptionResolverComposite {

	@Override
	public ModelAndView resolveException(HttpServletRequest requset,
			HttpServletResponse response, Object obj, Exception exception) {

		ModelAndView modelAndView=new ModelAndView();
		
		//异常提示
		String msg="";
		//判断异常的类型
		if (exception instanceof MyException) {
			msg=exception.getMessage();
		}else {
			msg="服务器正忙，请稍后再试！！";
		}
		modelAndView.addObject("msg", msg);
		modelAndView.setViewName("error");
		
		return modelAndView;
	}
	
}
