package com.xiaozhi.controller;

import com.xiaozhi.entity.User;
import com.xiaozhi.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Map;

/**
 * (User)表控制层
 *
 * @author makejava
 * @since 2020-11-09 10:06:25
 */
@Controller
@RequestMapping("user")
public class UserController {
    /**
     * 服务对象
     */
    @Resource
    private UserService userService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @RequestMapping("selectOne")
    @ResponseBody
    public User selectOne(String id) {
        System.out.println("啊啊啊啊啊"+id);
        return this.userService.queryById(id);
    }

    @RequestMapping("login")
    @ResponseBody
    public Map<String,String> login(String username, String password){
//        System.out.println("这里是登录验证controller");
//        System.out.println(username);

//        Md5Hash md5Hash = new Md5Hash(password,"abcd",1024);
        Map<String, String> map =this.userService.queryByName(username,password);
        System.out.println("map"+map);
        return map;
    }
}