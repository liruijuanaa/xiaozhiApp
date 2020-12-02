package com.xiaozhi.service;

import com.xiaozhi.entity.Comment;
import com.xiaozhi.entity.Subsystem;
import com.xiaozhi.vo.CommentVO;

import java.util.List;
import java.util.Map;

/**
 * (Comment)表服务接口
 *
 * @author makejava
 * @since 2020-11-09 15:59:56
 */
public interface CommentService {

    /**
     * 通过ID查询单条数据
     *
     * @param 主键
     * @return 实例对象
     */
    Comment queryById(String id);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    Map<String, Object> queryAllByLimit(int rows, int page, String id);

    /**
     * 新增数据
     *
     * @param comment 实例对象
     * @return 实例对象
     */
    Subsystem insert(Subsystem subsystem);

    /**
     * 修改数据
     *
     * @param comment 实例对象
     * @return 实例对象
     */
    void update(String id);

    /**
     * 通过主键删除数据
     *
     * @param 主键
     * @return 是否成功
     */
    boolean deleteById(String id);
    List<CommentVO> queryComment(int id);

    int queryNum();

    List<Comment> queryCom();
}