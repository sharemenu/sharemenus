package com.sharemenu.company.manager.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sharemenu.company.dao.TestDao;
import com.sharemenu.company.entity.TestEntity;
import com.sharemenu.company.manager.TestManager;
@Component
public class TestManagerImpl implements TestManager {

	@Autowired
	private TestDao testDao;

	@Override
	public List<TestEntity> getTestEntityList() {
		return testDao.getTestEntityList();
	}
	
	
}
