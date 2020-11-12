package com.xiaozhi.aspect;

import com.xiaozhi.annotation.AddLog;
import com.xiaozhi.entity.Log;
import com.xiaozhi.service.LogService;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import java.lang.reflect.Method;
import java.util.Date;
import java.util.UUID;

@Configuration
@Aspect
@Slf4j
public class LogAspect {

    @Autowired
    private LogService logService;

    //记录用户的日志
    @Around("@annotation(com.xiaozhi.annotation.AddLog)")
    public Object addLog(ProceedingJoinPoint proceedingJoinPoint){
        log.info("--环绕通知");
        //谁 时间 操作 是否成功

        //获取方法
        MethodSignature methodSignature= (MethodSignature) proceedingJoinPoint.getSignature();
        Method method = methodSignature.getMethod();
        //获取方法上的注解
        AddLog addLog = method.getAnnotation(AddLog.class);
        //获取注解属性的值
        String value = addLog.value();
        //获取方法名 操作的哪个方法
        String name = proceedingJoinPoint.getSignature().getName();
        //放行
        Object methodResult=null;
        try{
           methodResult = proceedingJoinPoint.proceed();
           String message = "success";
           Log logs = new Log(UUID.randomUUID().toString(),"li",new Date(),value + "(" + name + ")", message);
           logService.insert(logs);
           log.info("日志入库"+logs);
        }catch (Throwable throwable){
            throwable.printStackTrace();
            String message = "error";
        }
        return methodResult;
    }
}
