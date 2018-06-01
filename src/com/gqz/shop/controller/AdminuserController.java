package com.gqz.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.gqz.shop.pojo.Adminuser;
import com.gqz.shop.service.AdminuserService;
import com.gqz.shop.util.MyException;


/**
 * 知识点【@RequestMapping】
 * 	//使用RequestMapping注解   在类名前添加统一路径
	配置@RequestMapping时可省略后缀(.htm),注意访问的时候不能省略
 */
@Controller
@RequestMapping("/admin")
public class AdminuserController {
	@Autowired
	private AdminuserService adminuserService;
		
	//登录
	@RequestMapping("/login")
	public String login(Adminuser adminuser,HttpSession session){
		//访问services
//		System.out.println("正在login  ....");
		
		Adminuser admin = adminuserService.login(adminuser.getUsername(), adminuser.getPassword());
//		System.out.println(adminuser.getUsername()+"   "+ adminuser.getPassword());
		if (admin!=null) {
//			System.out.println("登录成功！");
			session.setAttribute("adminuser", admin);
			return "index";
		}
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("msg", "用户名或密码错误!");
		return "login";
	}
		
	@RequestMapping("/adminlist")
	public ModelAndView adminlist() throws MyException{
		//模拟异常  测试自定义异常处理器
//		List<Adminuser> list=new ArrayList<Adminuser>();
//		if (list==null||list.size()==0) {
//			throw new MyException("管理员列表为空，请稍后再试！！");
//		}
		//模拟异常 之 未知异常
//		int i=1/0;
		List<Adminuser> list = adminuserService.getAdminUserList();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("adminlist", list);
//		modelAndView.setViewName("/admin/admin_list.jsp");
		modelAndView.setViewName("admin_list");
		return modelAndView;
	}
	
	//通过分页查询管理员列表
	@RequestMapping("/adminListByPage")
	@ResponseBody()
	public PageInfo<Adminuser>adminListByPage(int page,int pageSize){
		return adminuserService.getAdminListByPage(page, pageSize);
	}
	

	//使用RESTful风格
	@RequestMapping("/adminEdit/{uid}")
	public ModelAndView adminEdit(@PathVariable()Integer uid){
		//访问services
		Adminuser admin = adminuserService.getAdminuserById(uid);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("admin", admin);
		modelAndView.setViewName("/admin/edit_admin");
		return modelAndView;
	}
	
	
	//修改
	@RequestMapping("adminModify")
	public String adminModify(Adminuser adminuser){
		//访问services
		adminuserService.adminModify(adminuser);
		//重定向页面
		return "redirect:/admin/adminlist";
	}
	
	//添加
	@RequestMapping("/addAdmin")
	public String addAdmin(Adminuser adminuser){
		//访问services
		
		adminuserService.addAdmin(adminuser);
		
		//重定向页面
		return "redirect:adminlist";
	}
	
	//删除
	
	//@ResponseBody() 注解
	@RequestMapping("/deleteAdmin")
	@ResponseBody()
	public String deleteAdmin(Integer uid){
		
		adminuserService.deleteAdmin(uid);
		return "ok";
	}
	
	//@ResponseBody() 注解
	@RequestMapping("/batchDel")
	@ResponseBody()
	public String batchDelAdmin(@RequestParam(value="uIds[]")Integer[] uIds){
		for (int i = 0; i < uIds.length; i++) {
			adminuserService.deleteAdmin(uIds[i]);
		}
		return "ok";
	}
		
}
