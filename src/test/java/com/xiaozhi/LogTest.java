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

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;

@SpringBootTest(classes = XiaozhiApplication.class)
@Slf4j
public class LogTest {
    @Autowired
    private LogService logService;

    @Resource
    HttpSession session;
    @Autowired
    private UserService userService;

    @Test
    public void addTest(){
//        Log log2=new Log("22","小冬",new Date(),"添加日志","400");
//        int insert = logService.insert(log2);

    }

    @Test
    public void updateTest(){
//        session.setAttribute("user",new User("22","小冬","111111","","comm"));
//        Log log = logService.queryById("f5cd8427-a94d-4b36-a361-7d581989b9a7");
//        log.setUsername("nn男");
//        int update = logService.update(log);
//        session.setAttribute("user",new User("22","小冬","111111",""));
//        logService.deleteById("22");
//        Md5Hash md5Hash = new Md5Hash("111111","abcd",1024);
//        System.out.println(md5Hash);
//        String s = md5Hash.toString();
//        System.out.println(s);

//        User user=new User("22","小冬","111111","/style/img/pkq01.jpg");
//        userService.insert(user);
    }
}
