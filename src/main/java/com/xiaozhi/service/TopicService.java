package com.xiaozhi.service;

import com.xiaozhi.entity.Topic;
import com.xiaozhi.vo.MyQuizVO;

import java.util.List;

/**
 * (Topic)表服务接口
 *
 * @author makejava
 * @since 2020-11-09 13:52:26
 */
public interface TopicService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Topic queryById(String id);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    List<Topic> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param topic 实例对象
     * @return 实例对象
     */
    Topic insert(String title);

    /**
     * 修改数据
     *
     * @param topic 实例对象
     * @return 实例对象
     */
    Topic update(Topic topic);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean deleteById(String id);

    /**
     * 热股榜
     * */
    List<Topic> queryHot();

    /**
     * 用户发表提问
     * */
    int insertQuiz(MyQuizVO quizVO);
}