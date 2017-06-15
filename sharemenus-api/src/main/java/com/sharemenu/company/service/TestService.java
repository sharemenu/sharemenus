package com.sharemenu.company.service;

import java.util.List;

import com.sharemenu.company.entity.ServiceResult;
import com.sharemenu.company.entity.TestEntity;

public interface TestService {

	 /**
	  * 根据数量获取构建testEntity数据
	  * @param count
	  * @return ServiceResult<List<TestEntity>>
	  * @author wenli.zhao
	  * @date 2017年6月15日
	  */
	public ServiceResult<List<TestEntity>> getTestEntityListByCount(Long count);
}
