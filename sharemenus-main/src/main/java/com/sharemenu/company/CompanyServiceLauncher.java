package com.sharemenu.company;

import java.util.concurrent.CountDownLatch;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/****************************************** 
   * Description: CompanyServiceLauncher.java
   * 启动类
   * Company:  meicai
   * @author wenli.zhao
   * @date 2017年6月15日
   ****************************************/
public class CompanyServiceLauncher {

	 private static final Logger logger = LoggerFactory.getLogger(CompanyServiceLauncher.class);

	public static void main(String[] args) {
    	try {
			new ClassPathXmlApplicationContext("spring/spring-main.xml");
			logger.info("CompanyServiceLauncher started successfully!");
			CountDownLatch latch = new CountDownLatch(1);
			latch.await();
		} catch (InterruptedException e) {
			logger.error(e.getMessage(), e);
		}
    }
}
