package com.fb4088.ba01.dao;

import java.util.List;

import com.fb4088.ba01.domain.Student;

public interface StudentDao {
	Integer  insertStudent(Student student );
	List<Student> selectAll();
	Integer deleteStuBySnum(String snum[]);
	Integer updataStu(Student student);
	List<Student> selectByClassroom(String classroom);
	List<Student> selectBySex(String sex);
	List<Student> selectByAge(String age);
	List<Student> selectByName(String name);
	List<Student> selectByPhone(String phone);
	List<Student> selectBySnum(String snum);
}
