package com.xiaozhi.dao;

import com.xiaozhi.entity.AddTheme;
import com.xiaozhi.entity.Subsystem;
import com.xiaozhi.entity.Topic;
import com.xiaozhi.vo.MyAnswerVO;
import com.xiaozhi.vo.MyQuizVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * (Topic)表数据库访问层
 *
 * @author makejava
 * @since 2020-11-09 13:52:25
 */
public interface TopicDao {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Subsystem queryById(int id);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    List<Topic> queryAllTwo(String id);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param topic 实例对象
     * @return 对象列表
     */
    List<Topic> queryAll(Topic topic);

    /**
     * 新增数据
     *
     * @param topic 实例对象
     * @return 影响行数
     */
    int insert(Subsystem topic);

    /**
     * 批量新增数据（MyBatis原生foreach方法）
     *
     * @param entities List<Topic> 实例对象列表
     * @return 影响行数
     */
    int insertBatch(@Param("entities") List<Topic> entities);

    /**
     * 批量新增或按主键更新数据（MyBatis原生foreach方法）
     *
     * @param entities List<Topic> 实例对象列表
     * @return 影响行数
     */
    int insertOrUpdateBatch(@Param("entities") List<Topic> entities);

    /**
     * 修改数据
     *
     * @param topic 实例对象
     * @return 影响行数
     */
    int update(Subsystem subsystem);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(int id);

    List<Topic> queryHot();

    //用户发表提问
    int insertQuiz(MyQuizVO quizVO);

    int insertAns(MyAnswerVO answerVO);

    int insertTheme(Subsystem subsystem);

    int selectSector();

    int insertCate(Subsystem subsystem);

    Subsystem queryThemeName(String icon);
}