package com.jk.controller.Aop;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.jk.bean.aop.Logs;
import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.reflect.CodeSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;


public class LogRecord {
	
	private Logger logger=Logger.getLogger(LogRecord.class);

	@Autowired
	private MongoTemplate mongoTemplate;
	
	private Long startTime;
	private Long endTime;
	
	public void beforeThead(){
		//startTime=new Date().getTime();
		System.out.println("前置调用");
	}
	
	public void afterThead(JoinPoint jp,Object retValue){
		endTime=new Date().getTime();
		System.out.println("后置调用");
		//Long time=(endTime-startTime)/1000;
		//类名
		String clazzName=null;
		try {
			clazzName = Class.forName(jp.getTarget().getClass().getName()).getSimpleName();
			//System.out.println("在类名为"+clazzName+"，方法名为"+jp.getSignature().getName()+"的方法运行时间为"+time+"秒");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		//方法名
		String methodName = jp.getSignature().getName();
		
		    Object[] paramValues = jp.getArgs();  
		    String[] paramNames = ((CodeSignature) jp.getSignature()).getParameterNames();  
		    String params=null;
		    for(int i=0;i<paramNames.length;i++){  
		    	params+=paramNames[i]+":"+paramValues[i]+",";  
		    } 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   
		Logs logs=new Logs();
		logs.setParams(params);
		logs.setClazzName(clazzName);
		logs.setMethodName(methodName);
		logs.setMethodName(methodName);
		logs.setTiem(sdf.format(new Date()));
		//System.out.println(retValue.toString());
		mongoTemplate.insert(logs);
		logger.info("类名:"+clazzName+",方法名:"+methodName+"参数与参数名:"+params);
	}
}
