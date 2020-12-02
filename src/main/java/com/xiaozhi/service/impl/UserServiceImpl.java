package com.xiaozhi.service.impl;

import com.xiaozhi.annotation.AddLog;
import com.xiaozhi.dao.UserDao;
import com.xiaozhi.entity.User;
import com.xiaozhi.service.UserService;
import com.xiaozhi.vo.AttentionVO;
import com.xiaozhi.vo.MyQuizVO;
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
import java.util.*;

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
    public User queryById(int id) {
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
        user.setUpdatetime(new Date());
        this.userDao.insert(user);
        return user;
    }

    /**
     * 修改数据
     *
     * @param user 实例对象
     * @return 实例对象
     */
    @AddLog(value = "修改用户")
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
    public boolean deleteById(int id) {
        return this.userDao.deleteById(id) > 0;
    }

    @Override
    public Map<String, Object> queryByName(String username, String password) {
        Map<String, Object> map = new HashMap<String, Object>();
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
            session.setAttribute("user",users);
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

    @Override
    public int insertAttention(AttentionVO attentionVO) {
        return this.userDao.insertAttention(attentionVO);
    }

    @Override
    public int delAttention(int user_id,int topic_id) {
        return this.userDao.delAttention(user_id,topic_id);
    }

    @Override
    public Map<String, Object> queryAttention(int id, int page) {
        int start = (page - 1) * 2;
        int num = getAttNum(id);
        int pageCount = num % 2 == 0 ? num / 2 : num / 2 + 1;
        Object arr[];
        if (pageCount>10){
            arr= new Object[10];
            for (int i=0;i<10;i++){
                arr[i]=i+1;
            }
        }else {
            arr= new Object[pageCount];
            for (int i=0;i<pageCount;i++){
                arr[i]=i+1;
            }
        }

        List<AttentionVO> attentionVOList = this.userDao.queryAttention(id, start);
        System.out.println("关注的集合");
        System.out.println(attentionVOList);
        Map<String, Object> map = new HashMap<>();

        map.put("total",arr);
        map.put("num",pageCount);
        map.put("page",page);
        map.put("attlist",attentionVOList);
        return map;
    }

    @Override
    public int getAttNum(int id) {
        return this.userDao.getAttNum(id);
    }

    @Override
    public List<MyQuizVO> queryQuiz(int id) {
        return this.userDao.queryQuiz(id);
    }

    @Override
    public int delQuiz(int user_id, int topic_id) {
        return this.userDao.delQuiz(user_id,topic_id);
    }

    @Override
    public User queryByOneName(String username) {
        return userDao.queryByOneName(username);
    }

    @Override
    public int queryPub(int id) {
        return this.userDao.queryPub(id);
    }

    @Override
    public User queryUser(String id) {
        return this.userDao.queryUser(id);
    }

    @Override
    public List<AttentionVO> queryIfAtten(int id) {
        return this.userDao.queryIfAtten(id);
    }
}