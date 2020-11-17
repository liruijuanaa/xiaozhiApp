package com.xiaozhi.service.impl;

import com.xiaozhi.dao.TopicDao;
import com.xiaozhi.entity.Topic;
import com.xiaozhi.service.TopicService;
import com.xiaozhi.vo.MyQuizVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.UUID;

/**
 * (Topic)表服务实现类
 *
 * @author makejava
 * @since 2020-11-09 13:52:27
 */
@Service("topicService")
@Transactional
public class TopicServiceImpl implements TopicService {

    @Resource
    private TopicDao topicDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Topic queryById(String id) {
        return this.topicDao.queryById(id);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    @Override
    public List<Topic> queryAllByLimit(int offset, int limit) {
        return this.topicDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param topic 实例对象
     * @return 实例对象
     */
    @Override
    public Topic insert(String title) {
        Topic topic=new Topic();
        topic.setId(UUID.randomUUID().toString());
        topic.setTitle(title);
        topic.setComment(0);
        topic.setPrise(0);
        this.topicDao.insert(topic);
        return topic;
    }

    /**
     * 修改数据
     *
     * @param topic 实例对象
     * @return 实例对象
     */
    @Override
    public Topic update(Topic topic) {
        Integer prise = topic.getPrise();
        prise++;
        topic.setPrise(prise);
        this.topicDao.update(topic);
        return topic;
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(String id) {
        return this.topicDao.deleteById(id) > 0;
    }

    @Override
    public List<Topic> queryHot() {
        return this.topicDao.queryHot();
    }

    @Override
    public int insertQuiz(MyQuizVO quizVO) {
        int i = this.topicDao.insertQuiz(quizVO);
        return i;
    }
}