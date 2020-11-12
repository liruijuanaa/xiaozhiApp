package com.xiaozhi.service.impl;

import com.xiaozhi.dao.UserDao;
import com.xiaozhi.entity.User;
import com.xiaozhi.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * (User)表服务实现类
 *
 * @author makejava
 * @since 2020-11-09 10:06:23
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;

    @Resource
    HttpServletRequest request;

    @Resource
    HttpSession session;
    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public User queryById(String id) {
        return this.userDao.queryById(id);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    @Override
    public List<User> queryAllByLimit(int offset, int limit) {
        return this.userDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param user 实例对象
     * @return 实例对象
     */
    @Override
    public User insert(User user) {
        String password = user.getPassword();
        Md5Hash md5Hash=new Md5Hash(password,"abcd",1024);
        user.setPassword(md5Hash.toString());
        this.userDao.insert(user);
        return user;
    }

    /**
     * 修改数据
     *
     * @param user 实例对象
     * @return 实例对象
     */
    @Override
    public User update(User user) {
        this.userDao.update(user);
        return this.queryById(user.getId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(String id) {
        return this.userDao.deleteById(id) > 0;
    }

    @Override
    public Map<String, String> queryByName(String username, String password) {
        Map<String, String> map = new HashMap<String, String>();
        System.out.println("password的值是:"+password);
            User users = this.userDao.queryByName(username);
            System.out.println("users"+users);

        //根据安全工具类获取主体对象
        Subject subject = SecurityUtils.getSubject();

        //创建token对象 参数：身份信息，凭证信息
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);


        //认证
        try {
            subject.login(token);

            boolean authenticated = subject.isAuthenticated();
            System.out.println("认证状态："+authenticated);
            map.put("status","200");
            map.put("url","/main.jsp");
            map.put("id", users.getId());
            session.setAttribute("isflag", "true");
        } catch (UnknownAccountException e) {
            map.put("status","201");
            map.put("msg", "用户名不存在");
            map.put("url","/login.jsp");
        }catch (IncorrectCredentialsException e){
            map.put("status","202");
            map.put("msg", "不正确的凭证异常  密码错误");
            map.put("url","/login.jsp");
        }

        return map;
    }
}