package com.sharemenu.company.entity;

import java.io.Serializable;

public class TestEntity  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6926608285376630960L;

	private String name;
	
	private Integer age;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}
	
	
}
