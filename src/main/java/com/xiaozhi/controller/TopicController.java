package com.xiaozhi.controller;

import com.xiaozhi.entity.Topic;
import com.xiaozhi.service.TopicService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Topic)表控制层
 *
 * @author makejava
 * @since 2020-11-09 13:52:27
 */
@RestController
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
    public Topic selectOne(String id) {
        return this.topicService.queryById(id);
    }

    @RequestMapping("queryHot")
    public List<Topic> queryHot(){
        return this.topicService.queryHot();
    }
}