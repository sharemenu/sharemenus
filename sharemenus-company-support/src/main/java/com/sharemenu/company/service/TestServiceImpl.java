package com.sharemenu.company.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.sharemenu.company.entity.ServiceResult;
import com.sharemenu.company.entity.TestEntity;
import com.sharemenu.company.manager.TestManager;

@Service
public class TestServiceImpl implements TestService	{

	private static final Logger logger = LoggerFactory.getLogger(TestServiceImpl.class);
	 
	@Autowired 
	private TestManager testManager;
	
	@Override
	public ServiceResult<List<TestEntity>> getTestEntityListByCount(Long count) {
		ServiceResult<List<TestEntity>>  serviceResult = new ServiceResult<> ();
//		List<TestEntity> list = new ArrayList<>();
//		for(int i=0;i<count;i++){
//			TestEntity entity = new TestEntity();
//			entity.setAge(i+1);
//			entity.setName("name"+(i+1));
//			list.add(entity);
//		}
		List<TestEntity> list = testManager.getTestEntityList();
		serviceResult.setResultBody(list);
		logger.info("TestService.getTestEntityListByCount result:"+JSONObject.toJSONString(serviceResult));
		return serviceResult;
	}

	 
}
