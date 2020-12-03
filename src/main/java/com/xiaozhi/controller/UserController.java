package com.xiaozhi.controller;

import com.xiaozhi.entity.User;
import com.xiaozhi.service.TopicService;
import com.xiaozhi.service.UserService;
import com.xiaozhi.vo.AttentionVO;
import com.xiaozhi.vo.MyQuizVO;
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
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
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

    @Resource
    private TopicService topicService;

    @Resource
    private HttpSession session;
    /**
     * 通过主键查询单条数据
     *
     * @param  主键
     * @return 单条数据
     */
    @RequestMapping("selectOne")
    @ResponseBody
    public User selectOne(String username) {
        System.out.println("啊啊啊啊啊"+username);
        return this.userService.queryByOneName(username);
    }

    @RequestMapping("login")
    @ResponseBody
    public Map<String,Object> login(String username, String password){
//        System.out.println("这里是登录验证controller");
//        System.out.println(username);

//        Md5Hash md5Hash = new Md5Hash(password,"abcd",1024);
        Map<String, Object> map =this.userService.queryByName(username,password);
        System.out.println("map"+map);
        return map;
    }

    //注册用户
    @RequestMapping("addUser")

    public String addUser(String username,String password){

//                System.out.println(username+password+file);
//
//        //1. 获得 upload的路径
//        String realPath = session.getServletContext().getRealPath("/upload/img");
//        //2. 判断文件夹是否存在
//        File file1 = new File(realPath);
//        if(!file1.exists()){
//            file1.mkdirs();
//        }
//        //3.获取文件真实名字
//        String originalFilename = file.getOriginalFilename();
//        //4. 为了防止同一个文件多次上传发生覆盖  拼接时间戳
//        String name = new Date().getTime()+"_"+originalFilename;
//        //5.文件上传
//        try {
//            file.transferTo(new File(realPath,name));
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        String photo="/upload/img/"+name;
//        System.out.println("photourl"+photo);
        User user=new User(011,username,password,"comm","","","",new Date());
        this.userService.insert(user);
        return "redirect:/login.jsp";
    }

    @RequestMapping("addAtten")
    @ResponseBody
    public int addAtten(int user_id,int topic_id){
        System.out.println("调用添加关注");

        AttentionVO attentionVO=new AttentionVO(user_id,topic_id);
        int i = this.userService.insertAttention(attentionVO);

        return i;
    }

    @RequestMapping("delAtten")
    @ResponseBody
    public int delAtten(int user_id,int topic_id){

        System.out.println("调用取消关注");
        return this.userService.delAttention(user_id,topic_id);
    }

    @RequestMapping("delQuiz")
    public String delQuiz(int user_id,int topic_id){
        System.out.println(topic_id);
        System.out.println("调用aaaaaaaaa");
        userService.delQuiz(user_id,topic_id);
        topicService.deleteById(topic_id);
        return "redirect:/myPublish.jsp";
    }

    @RequestMapping("queryAtten")
    @ResponseBody
    public Map<String, Object> queryAtten(int id, int page){
        System.out.println("调用查询关注");
        System.out.println("传递ID为："+id);
        return this.userService.queryAttention(id,page);
    }

    @RequestMapping("queryIfAtten")
    @ResponseBody
    public List<AttentionVO> queryIfAtten(int id){
        System.out.println("调用查询关注");
        System.out.println("传递ID为："+id);
        return this.userService.queryIfAtten(id);
    }

    @RequestMapping("queryQuiz")
    @ResponseBody
    public Map<String, Object> queryQuiz(int id,int page){
        System.out.println("调用查询关注");
        System.out.println("传递ID为："+id);
        return this.userService.queryQuiz(id,page);
    }

    @RequestMapping("queryPub")
    @ResponseBody
    public  User queryPub(int id){
        int user_id = this.userService.queryPub(id);
        User user = this.userService.queryById(user_id);
        return user;
    }

    @RequestMapping("queryUser")
    @ResponseBody
    public User queryUser(String id){
        return this.userService.queryUser(id);
    }
}