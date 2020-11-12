package com.xiaozhi.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("shiroLogin")
public class ShiroLogin {

    @RequestMapping("login")
    public String login(String username,String password){

        //根据安全工具类获取主体对象
        Subject subject = SecurityUtils.getSubject();

        //创建token对象 参数：身份信息，凭证信息
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        //认证
        try {
            subject.login(token);

            boolean authenticated = subject.isAuthenticated();
            System.out.println("认证状态："+authenticated);

            return "redirect:/main/main.jsp";
        } catch (UnknownAccountException e) {
            System.out.println("未知的账户异常 用户名不正确");
            return "redirect:/shiroLogin/login.jsp";
        }catch (IncorrectCredentialsException e){
            System.out.println("不正确的凭证异常  密码错误");
            return "redirect:/shiroLogin/login.jsp";
        }
    }
}
