package com.xiaozhi.service.impl;

import com.xiaozhi.annotation.AddLog;
import com.xiaozhi.dao.LogDao;
import com.xiaozhi.entity.Log;
import com.xiaozhi.service.LogService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Log)表服务实现类
 *
 * @author makejava
 * @since 2020-11-12 10:07:17
 */
@Service("logService")
@Transactional
public class LogServiceImpl implements LogService {
    @Resource
    private LogDao logDao;

    /**
     * 通过ID查询单条数据
     *
     * @param 主键
     * @return 实例对象
     */
    @Override
    public Log queryById(String id) {

        return this.logDao.queryById(id);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    @Override
    public List<Log> queryAllByLimit(int offset, int limit) {
        return this.logDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param log 实例对象
     * @return 实例对象
     */

    @Override
    public int insert(Log log) {
        int insert = this.logDao.insert(log);
        return insert;
    }

    /**
     * 修改数据
     *
     * @param log 实例对象
     * @return 实例对象
     */
    @AddLog(value = "修改日志")
    @Override
    public int update(Log log) {
        int update = this.logDao.update(log);
        return update;
    }

    /**
     * 通过主键删除数据
     *
     * @param 主键
     * @return 是否成功
     */
    @AddLog(value = "删除日志")
    @Override
    public void deleteById(String id) {
        this.logDao.deleteById(id);

    }
}