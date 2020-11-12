package com.xiaozhi.controller;

import com.xiaozhi.entity.Log;
import com.xiaozhi.service.LogService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * (Log)表控制层
 *
 * @author makejava
 * @since 2020-11-12 10:07:17
 */
@RestController
@RequestMapping("log")
public class LogController {
    /**
     * 服务对象
     */
    @Resource
    private LogService logService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public Log selectOne(String id) {
        return this.logService.queryById(id);
    }

}