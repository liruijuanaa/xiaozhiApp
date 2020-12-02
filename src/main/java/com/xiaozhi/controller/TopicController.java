package com.xiaozhi.controller;

import com.xiaozhi.entity.Subsystem;
import com.xiaozhi.entity.Topic;
import com.xiaozhi.service.TopicService;
import com.xiaozhi.vo.MyQuizVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Topic)表控制层
 *
 * @author makejava
 * @since 2020-11-09 13:52:27
 */
@Controller
@RequestMapping("topic")
public class TopicController {
    /**
     * 服务对象
     */
    @Resource
    private TopicService topicService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @RequestMapping("selectOne")
    @ResponseBody
    public Subsystem selectOne(int id) {

        return this.topicService.queryById(id);
    }

    @RequestMapping("queryHot")
    @ResponseBody
    public List<Topic> queryHot(){
        return this.topicService.queryHot();
    }

    @RequestMapping("queryAll")
    @ResponseBody
    public List<Topic> queryAll(String id){
        return this.topicService.queryAllTwo(id);
    }

    //添加话题，用户发表问题
    @RequestMapping("addTopic")
    @ResponseBody
    //参数，话题的内容  用户ID
    public void addTopic(String title,String content,int user_id,int category_id){

        Subsystem subsystem = topicService.insert(title, content, category_id);
        int id = subsystem.getId();
        MyQuizVO quizVO=new MyQuizVO(user_id,id);
        topicService.insertQuiz(quizVO);
    }

    @RequestMapping("updateTopic")
    public String  updateTopic(String id){
//        Topic topic = this.topicService.queryById(id);
//        this.topicService.update(topic);
//        System.out.println("uid"+id);
        return "redirect:/main.jsp";
    }
    @RequestMapping("updateStatus")

    public String updateStatus(Integer status,int id){
        System.out.println("这里是状态信息"+status);
        System.out.println(id+"id");
        Subsystem subsystem = this.topicService.queryById(id);
        System.out.println("这里status"+subsystem);
        subsystem.setStatus(status);
        this.topicService.update(subsystem);
        return "redirect:/myPublish.jsp";
    }

    //添加主题
    @RequestMapping("addTheme")
    @ResponseBody
    //参数，话题的内容  用户ID
    public void addTheme(String title,int user_id,String icon){

        Subsystem subsystem = topicService.insertTheme(title,icon);
//        int id = subsystem.getId();
//        MyQuizVO quizVO=new MyQuizVO(user_id,id);
//        topicService.insertQuiz(quizVO);
    }

    //添加类别
    @RequestMapping("addCate")
    @ResponseBody
    public void addCate(String title,int user_id,String fatherName){
        System.out.println("输出类别信息");
        System.out.println(title+user_id+fatherName);
        Subsystem subsystem = this.topicService.insertCate(title, user_id, fatherName);
//        int id = subsystem.getId();
//        MyQuizVO quizVO=new MyQuizVO(user_id,id);
//        topicService.insertQuiz(quizVO);
    }

    @RequestMapping("queryThemeName")
    @ResponseBody
    public Subsystem queryThemeName(String icon){
        Subsystem subsystem = this.topicService.queryThemeName(icon);
        return subsystem;
    }
}