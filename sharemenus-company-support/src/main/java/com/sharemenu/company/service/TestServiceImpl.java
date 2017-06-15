package com.sharemenu.company.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.sharemenu.company.entity.ServiceResult;
import com.sharemenu.company.entity.TestEntity;

@Service
public class TestServiceImpl implements TestService	{

	private static final Logger logger = LoggerFactory.getLogger(TestServiceImpl.class);
	 
	@Override
	public ServiceResult<List<TestEntity>> getTestEntityListByCount(Long count) {
		ServiceResult<List<TestEntity>>  serviceResult = new ServiceResult<> ();
		List<TestEntity> list = new ArrayList<>();
		for(int i=0;i<count;i++){
			TestEntity entity = new TestEntity();
			entity.setAge(i+1);
			entity.setName("name"+(i+1));
			list.add(entity);
		}
		serviceResult.setResultBody(list);
		logger.info("TestService.getTestEntityListByCount result:"+JSONObject.toJSONString(serviceResult));
		return serviceResult;
	}

	 
}
