package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javaex.service.BlogService;

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


	
}
