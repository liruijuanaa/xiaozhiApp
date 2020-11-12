package com.xiaozhi.service;

import com.xiaozhi.entity.Log;

import java.util.List;

/**
 * (Log)表服务接口
 *
 * @author makejava
 * @since 2020-11-12 10:07:16
 */
public interface LogService {

    /**
     * 通过ID查询单条数据
     *
     * @param 主键
     * @return 实例对象
     */
    Log queryById(String id);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    List<Log> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param log 实例对象
     * @return 实例对象
     */
    int insert(Log log);

    /**
     * 修改数据
     *
     * @param log 实例对象
     * @return 实例对象
     */
    int update(Log log);

    /**
     * 通过主键删除数据
     *
     * @param 主键
     * @return 是否成功
     */
    boolean deleteById(String id);

}