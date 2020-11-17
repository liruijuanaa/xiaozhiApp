package com.xiaozhi.controller;

import com.xiaozhi.dao.TopicDao;
import com.xiaozhi.entity.Comment;
import com.xiaozhi.entity.Topic;
import com.xiaozhi.service.CommentService;
import com.xiaozhi.service.TopicService;
import com.xiaozhi.vo.CommentVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * (Comment)表控制层
 *
 * @author makejava
 * @since 2020-11-09 15:59:57
 */
@Controller
@RequestMapping("comment")
public class CommentController {
    /**
     * 服务对象
     */
    @Resource
    private CommentService commentService;

    @Resource
    private TopicService topicService;
    private int limit2 =0;
    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    @ResponseBody
    public Comment selectOne(String id) {
        return this.commentService.queryById(id);
    }

    @RequestMapping("queryComment")
    @ResponseBody
    public List<CommentVO> queryComment(String id,Integer limit){
        limit2=limit2+2;
        System.out.println("limit2的值是："+limit2);
        return this.commentService.queryComment(id,limit2);
    }

    @RequestMapping("updateComment")
    public String updateComment(String id,String topid){
        System.out.println("uid"+topid);
        this.commentService.update(id);
        return "redirect:/commen.jsp?id="+topid+"";
    }
    @ResponseBody
    @RequestMapping("addComment")
    public String addComment(Comment comment){
        System.out.println("输出comment");
        String s = UUID.randomUUID().toString();
        comment.setId(s);
        this.commentService.insert(comment);
        String topicId = comment.getTopicId();
        Topic topic = this.topicService.queryById(topicId);
        Integer num = topic.getComment();
        topic.setComment(++num);
        this.topicService.update(topic);
        System.out.println(comment);
        return "nnn";
    }

    //分页查询
    @RequestMapping("queryFenye")
    public Map<String,Object> queryFenye(int rows,int page,String id){
        Map<String, Object> map = commentService.queryAllByLimit(rows, page, id);
        return map;
    }
}