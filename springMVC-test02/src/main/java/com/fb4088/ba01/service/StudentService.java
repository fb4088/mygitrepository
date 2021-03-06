package com.fb4088.ba01.service;

import java.util.List;

import com.fb4088.ba01.domain.Student;

public interface StudentService {
	Integer addStudent(Student student);
	List<Student> checkAll();
	Integer deleteStudent(String snum[]);
	Integer modifyStudent(Student student);
	List<Student> checkByClassroom(String classroom);
	List<Student> checkBySex(String sex);
	List<Student> checkByAge(String age);
	List<Student> checkByName(String name);
	List<Student> checkByPhone(String phone);
	List<Student> checkBySnum(String snum);
}
