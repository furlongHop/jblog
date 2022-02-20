package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.service.BlogService;
import com.javaex.vo.BlogVo;

@Controller
@RequestMapping("/{id}/admin")
public class BlogAdminController {

	@Autowired
	private BlogService blogService;

	@RequestMapping("/basic")
	public String basic(@PathVariable("id") String id) {
		System.out.println("BlogAdminController/basic()");

		return "blog/admin/blog-admin-basic";
	}

	@RequestMapping("/writeForm")
	public String writeForm() {
		System.out.println("BlogAdminController/wirteForm()");

		return "blog/admin/blog-admin-write";
	}

	@RequestMapping("/write")
	public String write() {
		System.out.println("BlogAdminController/wirte()");
		
		return "redirect:writeForm";
	}


	@RequestMapping("/category")
	public String category() {
		System.out.println("BlogAdminController/category()");


		return "blog/admin/blog-admin-cate";
	}


}
