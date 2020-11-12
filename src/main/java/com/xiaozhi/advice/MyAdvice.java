package com.xiaozhi.advice;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component
@Aspect
@Slf4j
public class MyAdvice {
    //切入点+通知
//    @Before(value = "execution(* com.xiaozhi.dao.*.*(..))")
//    public void before(JoinPoint joinPoint){
//        //方法名
//        String signature = joinPoint.getSignature().getName();
//        //参数[]
//        Object[] args = joinPoint.getArgs();
//        //目标对象
//        Object target = joinPoint.getTarget();
//        log.info("前置通知");
//    }
//    @After(value = "execution(* com.xiaozhi.dao.*.*(..))")
//    public void after(JoinPoint joinPoint){
//        log.info("后置通知");
//    }
//    @Around(value = "execution(* com.xiaozhi.dao.*.*(..))")
//    public Object around(ProceedingJoinPoint proceedingJoinPoint){
//        Object proceed = null;
//        try {
//            log.info("前置通知");
//            proceed = proceedingJoinPoint.proceed();
//            log.info("后置通知");
//            return proceed;
//        } catch (Throwable throwable) {
//            log.info("异常通知");
//            throwable.printStackTrace();
//        }
//        return null;
//    }
}
