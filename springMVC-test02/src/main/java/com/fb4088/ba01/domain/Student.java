package com.fb4088.ba01.domain;

import org.omg.CosNaming.IstringHelper;

public class Student {
	private Integer id;
	private String snum;
	private String name;
	private String age;
	private String sex;
	private String classroom;
	private String phone;
	private String address;
	public Student() {
	}
	public Student(Integer id, String snum, String name, String age, String sex, String classroom, String phone,
			String address) {
		super();
		this.id = id;
		this.snum = snum;
		this.name = name;
		this.age = age;
		this.sex = sex;
		this.classroom = classroom;
		this.phone = phone;
		this.address = address;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSnum() {
		return snum;
	}
	public void setSnum(String snum) {
		this.snum = snum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getClassroom() {
		return classroom;
	}
	public void setClassroom(String classroom) {
		this.classroom = classroom;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "Student [id=" + id + ", snum=" + snum + ", name=" + name + ", age=" + age + ", sex=" + sex
				+ ", classroom=" + classroom + ", phone=" + phone + ", address=" + address + "]";
	}
	
	
}
