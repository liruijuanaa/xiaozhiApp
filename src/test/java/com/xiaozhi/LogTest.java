package com.xiaozhi;

import com.xiaozhi.entity.Log;
import com.xiaozhi.entity.User;
import com.xiaozhi.service.LogService;
import com.xiaozhi.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Date;

@SpringBootTest(classes = XiaozhiApplication.class)
@Slf4j
public class LogTest {
    @Autowired
    private LogService logService;

    @Autowired
    private UserService userService;

    @Test
    public void addTest(){
        Log log2=new Log("1","li",new Date(),"操作","200");
        int insert = logService.insert(log2);
        log.info("添加成功"+insert+"条");
    }

    @Test
    public void updateTest(){
//        Log log = logService.queryById("1");
//        log.setUsername("nt男");
//        int update = logService.update(log);

//        Md5Hash md5Hash = new Md5Hash("111111","abcd",1024);
//        System.out.println(md5Hash);
//        String s = md5Hash.toString();
//        System.out.println(s);

        User user=new User("22","小冬","111111","/style/img/pkq01.jpg");
        userService.insert(user);
    }
}
