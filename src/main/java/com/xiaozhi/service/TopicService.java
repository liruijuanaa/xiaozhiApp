package com.xiaozhi.service;

import com.xiaozhi.entity.Subsystem;
import com.xiaozhi.entity.Topic;
import com.xiaozhi.vo.MyAnswerVO;
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
    Subsystem queryById(int id);

    /**
     * 查询多条数据
     *
     * @param
     * @return 对象列表
     */
    List<Topic> queryAllTwo(String id);

    /**
     * 新增数据
     *
     * @param topic 实例对象
     * @return 实例对象
     */
    Subsystem insert(String title, String content, int category_id);

    /**
     * 修改数据
     *
     * @param topic 实例对象
     * @return 实例对象
     */
    Subsystem update(Subsystem subsystem);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean deleteById(int id);

    /**
     * 热股榜
     * */
    List<Topic> queryHot();

    /**
     * 用户发表提问
     * */
    int insertQuiz(MyQuizVO quizVO);

    int insertAns(MyAnswerVO answerVO);

    Subsystem insertTheme(String title,String icon);

    int selectSector();

    Subsystem insertCate(String title,int user_id,String fatherName);

    Subsystem queryThemeName(String icon);
}