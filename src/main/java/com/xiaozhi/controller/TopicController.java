package com.xiaozhi.controller;

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
    public Topic selectOne(String id) {
        return this.topicService.queryById(id);
    }

    @RequestMapping("queryHot")
    @ResponseBody
    public List<Topic> queryHot(){
        return this.topicService.queryHot();
    }

    @RequestMapping("queryAll")
    @ResponseBody
    public List<Topic> queryAll(){
        return this.topicService.queryAllByLimit(0,5);
    }

    //添加话题，用户发表问题
    @RequestMapping("addTopic")
    @ResponseBody
    //参数，话题的内容  用户ID
    public void addTopic(String title,String user_id){
        Topic topic = topicService.insert(title);
        String topicId = topic.getId();
        MyQuizVO quizVO=new MyQuizVO(user_id,topicId);
        topicService.insertQuiz(quizVO);
    }

    @RequestMapping("updateTopic")
    public String  updateTopic(String id){
        Topic topic = this.topicService.queryById(id);
        this.topicService.update(topic);
        System.out.println("uid"+id);
        return "redirect:/main.jsp";
    }
}