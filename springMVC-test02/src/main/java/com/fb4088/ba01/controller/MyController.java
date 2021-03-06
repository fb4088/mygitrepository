package com.fb4088.ba01.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fb4088.ba01.domain.Student;
import com.fb4088.ba01.domain.User;
import com.fb4088.ba01.exception.NotExistException;
import com.fb4088.ba01.exception.NotMatchException;
import com.fb4088.ba01.service.StudentService;
import com.fb4088.ba01.service.UserService;

@Controller
public class MyController {
	@Autowired
	@Qualifier(value = "userservice")
	private UserService userService;
	@Autowired
	@Qualifier(value="studentservice")
	private StudentService studentService;
	@RequestMapping(value = "/some.do")
	public ModelAndView doSome(String username,String password) {
//		System.out.println(password);
		ModelAndView mv = new ModelAndView();
		User user = userService.checkUser(username);
		System.out.println(user);
		if (user == null) {
			throw new NotExistException("�û������ڣ�");
		}
		if (!user.getPassword().equals(password)) {
			throw new NotMatchException("�������벻��ȷ");
		}
		mv.addObject("user", user);
		mv.setViewName("welcome");
		return mv;
	}
	@RequestMapping(value="/regist.do")
	public String doRegist() {
		return "regist";
	}
	@RequestMapping(value="/registSubmit.do",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView doRegistSubmit(@RequestParam(value="username")String name,String password,String kouling) {
		ModelAndView mv = new ModelAndView();
		if (kouling.equals("admin")) {
			User user = new User();
			user.setUsername(name);
			user.setPassword(password);
			Integer num=userService.registUser(user);
			if (num > 0) {
				mv.addObject("msg", "ע��ɹ�,���¼");
				mv.setViewName("forward:/index.jsp");
				return mv;
			}else {
				mv.addObject("msg","ע��ʧ�ܣ�������ע�ᣡ");
				mv.setViewName("regist");
				return mv;
			}
		}
		mv.addObject("msg","ע��ʧ�ܣ�����Ա�����ȷ��");
		mv.setViewName("regist");
		return mv;
		
		
	}
	@RequestMapping(value="/usernameCheck.do",method=RequestMethod.GET,produces="text/plain;charset=utf-8")
	@ResponseBody
	public String doUsernameCheck(String username) {
		String msg="";
		User user = userService.checkUser(username);
		if (user !=null) {
			msg="�û����Ѿ����ڣ�";
		}else {
			msg="�û�������ʹ�ã�";
		}
		return msg;
	}
	@RequestMapping(value="/add.do",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	@ResponseBody
	public String doAdd(Student student) {
		System.out.println(student.getName());
		String msg="���ѧ��ʧ�ܣ��밴��ȷ��ʽ��д��Ϣ";
		Integer num = studentService.addStudent(student);
		if (num > 0) {
			msg="���ѧ���ɹ���";
		}
		return msg; 
	}
	@RequestMapping(value="/checkall.do",method=RequestMethod.POST)
	@ResponseBody
	public Object doCheckAll() {
		return studentService.checkAll();
	}
	@RequestMapping(value="/delete.do",method=RequestMethod.POST)
	@ResponseBody
	public Object dodelete(String requestdata) {
		String data[]=requestdata.split("-");
		Integer retnum = studentService.deleteStudent(data);
		if (retnum>0) {
			return studentService.checkAll();
		}
		return "false";
	}
	@RequestMapping(value="/modify.do",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	@ResponseBody
	public String doModify(Student student) {
		Integer backnum = studentService.modifyStudent(student);
		if (backnum < 0) {
			return "�޸�ʧ��";
		}
		return "�޸ĳɹ���";
	}
	@RequestMapping(value="/checkclassroom.do",method=RequestMethod.POST)
	@ResponseBody
	public Object doCheckClassRoom(String classroom) {
		return studentService.checkByClassroom(classroom);
	}
	@RequestMapping(value="/checksex.do",method=RequestMethod.POST)
	@ResponseBody
	public Object doCheckSex(String sex) {
		return studentService.checkBySex(sex);
	}
	@RequestMapping(value="/checkage.do",method=RequestMethod.POST)
	@ResponseBody
	public Object doCheckAge(String age) {
		return studentService.checkByAge(age);
	}
	@RequestMapping(value="/checkname.do",method=RequestMethod.POST)
	@ResponseBody
	public Object doCheckName(String name) {
		return studentService.checkByName(name);
	}
	@RequestMapping(value="/checkphone.do",method=RequestMethod.POST)
	@ResponseBody
	public Object doCheckPhone(String phone) {
		return studentService.checkByPhone(phone);
	}
	@RequestMapping(value="/checksnum.do",method=RequestMethod.POST)
	@ResponseBody
	public Object doCheckSnum(String snum) {
		return studentService.checkBySnum(snum);
	}
	@RequestMapping(value="/stock.do")
	public String doStock() {
		return "stock";
	}
}
