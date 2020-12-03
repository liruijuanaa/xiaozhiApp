package com.xiaozhi.controller;

import com.xiaozhi.dao.TopicDao;
import com.xiaozhi.entity.Category;
import com.xiaozhi.entity.Comment;
import com.xiaozhi.entity.Subsystem;
import com.xiaozhi.entity.Topic;
import com.xiaozhi.service.CategoryService;
import com.xiaozhi.service.CommentService;
import com.xiaozhi.service.TopicService;
import com.xiaozhi.vo.CommentVO;
import com.xiaozhi.vo.MyAnswerVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Date;
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
    private CategoryService categoryService;

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
    public Map<String, Object> queryComment(int id, int page){
        System.out.println("话题ID为："+id);


        return this.commentService.queryComment(id,page);
    }

    @RequestMapping("updateComment")
    public String updateComment(String id,String topid){
        System.out.println("uid"+topid);
        this.commentService.update(id);
        return "redirect:/commen.jsp?id="+topid+"";
    }
    @ResponseBody
    @RequestMapping("addComment")
    public String addComment(CommentVO commentVO){
        System.out.println("输出comment"+commentVO);
        Subsystem subsystem1 = this.topicService.queryById(commentVO.getPid());

        Subsystem subsystem=new Subsystem();
        subsystem.setName(commentVO.getName());
        subsystem.setDescription(commentVO.getDescription());
        subsystem.setIcon(subsystem1.getIcon());
        subsystem.setPid(commentVO.getPid());
        subsystem.setCreate_time(new Date());
        subsystem.setStatus(0);
        subsystem.setSeq(0);
        int level = subsystem1.getSys_level();
        int a=++level;
        System.out.println("level"+level);
        subsystem.setSys_level(level);
        System.out.println("----"+subsystem);
        this.commentService.insert(subsystem);
        int i = this.commentService.selectLast();
        CommentVO cc=new CommentVO();
        cc.setName(commentVO.getName());
        cc.setDescription(commentVO.getDescription());
        cc.setIcon(subsystem1.getIcon());
        cc.setPid(commentVO.getPid());
        cc.setCreate_time(new Date());
        cc.setUser_id(commentVO.getUser_id());
        cc.setUsername(commentVO.getUsername());
        System.out.println("这里是新增话题的ID值："+i);
        this.topicService.insertAns(new MyAnswerVO(commentVO.getUser_id(), i));
        this.commentService.addComm(cc);
//        String topicId = comment.getTopicId();
//        System.out.println("topicid"+topicId);
//        Topic topic = this.topicService.queryById(topicId);
//        Integer num = topic.getComment();
//        topic.setComment(++num);
//        this.topicService.update(topic);
//        System.out.println(comment);
//        Category category = this.categoryService.queryById(topic.getCategory_id());
//        Integer posts = category.getPosts();
//        category.setPosts(++posts);
//        this.categoryService.update(category);
        return "nnn";
    }

    //分页查询
    @RequestMapping("queryFenye")
    public Map<String,Object> queryFenye(int rows,int page,String id){
        Map<String, Object> map = commentService.queryAllByLimit(rows, page, id);
        return map;
    }

    //查询所有
    @RequestMapping("queryCom")
    @ResponseBody
    public List<Comment> queryCom(){
        return this.commentService.queryCom();
    }

    //查询用户名
    @RequestMapping("queryByuserID")
    @ResponseBody
    public String queryByuserID(int topic_id){
        return this.commentService.queryByuserID(topic_id);
    }
}