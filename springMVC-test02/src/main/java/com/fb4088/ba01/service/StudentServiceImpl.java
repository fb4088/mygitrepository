package com.fb4088.ba01.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.fb4088.ba01.dao.StudentDao;
import com.fb4088.ba01.domain.Student;
@Component(value = "studentservice")
public class StudentServiceImpl implements StudentService {
	@Autowired
	@Qualifier(value="studentDao")
	private StudentDao studentDao;
	@Override
	public Integer addStudent(Student student) {
		
		return studentDao.insertStudent(student);
	}
	@Override
	public List<Student> checkAll() {
		return studentDao.selectAll();
	}
	@Override
	public Integer deleteStudent(String snum[]) {
		return studentDao.deleteStuBySnum(snum);
	}
	@Override
	public Integer modifyStudent(Student student) {
		return studentDao.updataStu(student);
	}
	@Override
	public List<Student> checkByClassroom(String classroom) {
		return studentDao.selectByClassroom(classroom);
	}
	@Override
	public List<Student> checkBySex(String sex) {
		return studentDao.selectBySex(sex);
	}
	@Override
	public List<Student> checkByAge(String age) {
		return studentDao.selectByAge(age);
	}
	@Override
	public List<Student> checkByName(String name) {
		return studentDao.selectByName(name);
	}
	@Override
	public List<Student> checkByPhone(String phone) {
		return studentDao.selectByPhone(phone);
	}
	@Override
	public List<Student> checkBySnum(String snum) {
		return studentDao.selectBySnum(snum);
	}

}
