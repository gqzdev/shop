package com.gqz.shop.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.gqz.shop.pojo.Product;

/**
 * 
* @ClassName: CommonUtils
* @Description:  文件上传工具类
* @author ganquanzhong
* @date 2018-5-4 下午02:34:14
 */
public class CommonUtils {
	
	//文件名  使用UUID 唯一的UUID作为文件名
	public static String getUUID(){
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	//图片文件上传的路劲[E:\\ShopFile\\upload\\]
	//public static String path="E:\\ShopFile\\upload\\";
	/**
	     服务器添加  E:\\ShopFile\\upload\\  访问路径为/pic
	  <Context docBase="E:\\ShopFile\\upload" path="/pic" reloadable="false"/>
	  本机地址  E:\\ShopFile\\upload\\
	*/
	
	public static String path="E:\\ShopFile\\upload\\";//根据自己的路径设定
	
	//文件上传  多个文件上传
	public static void uploadFiles(Product product,MultipartFile[] files){
		//如果上传多个文件的话，文件名之间用逗号分隔，存在product的image属性中
		
		String picNames="";
		for (int i = 0; i < files.length; i++) {
			if (files[i]!=null) {
				String picName=getUUID();
				//获取上传文件的文件名
				String filename=files[i].getOriginalFilename();
				//获取扩展名
				String extname=filename.substring(filename.indexOf("."));
				
				//开始上传
				try {
					files[i].transferTo(new File(path+picName+extname));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				//多个文件名之间用逗号分隔
				picNames+=picName+extname+",";
			}
		}
		//设置图片名到商品对象中
		product.setImage(picNames.substring(0,picNames.length()-1));
	}
}
