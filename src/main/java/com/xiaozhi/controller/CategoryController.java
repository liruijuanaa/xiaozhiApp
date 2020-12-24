package com.xiaozhi.controller;

import com.xiaozhi.entity.Category;
import com.xiaozhi.entity.Subsystem;
import com.xiaozhi.entity.Topic;
import com.xiaozhi.service.CategoryService;
import com.xiaozhi.vo.SubCategpryVO;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * (Category)表控制层
 *
 * @author makejava
 * @since 2020-11-24 09:49:22
 */
@RestController
@RequestMapping("category")
public class CategoryController {
    /**
     * 服务对象
     */
    @Resource
    private CategoryService categoryService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @RequestMapping("selectOne")
    public Category selectOne(String id) {
        return null;
    }

    @RequestMapping("queryAll")
    public List<Subsystem> queryAll(){
        return this.categoryService.queryAll();
    }
    //查询二级类别
    @RequestMapping("queryTwoCategory")
    public List<Subsystem> queryTwoCategory(String category_id){
        System.out.println("类别ID"+category_id);
        return this.categoryService.queryTwoCategory(category_id);
    }

    @RequestMapping("queryTwoCategory2")
    public List<Subsystem> queryTwoCategory2(int category_id){
        System.out.println("类别ID"+category_id);
        return this.categoryService.queryTwoCategory2(category_id);
    }
    //查询类别并分页
    @RequestMapping("queryTwoCategoryFenye")
    public Map<String ,Object> queryTwoCategoryFenye(String category_id, int page){
        System.out.println(page);
        return this.categoryService.queryTwoCategoryFenye(category_id, page);
    }
    //根据选择的类别展示
    @RequestMapping("queryRequest")
    public Map<String ,Object> queryRequest(int id, int page,int sys_level){
        System.out.println(page);
        return this.categoryService.queryRequest(id,page,sys_level);
    }

    @RequestMapping("queryTwoRequest")
    public Map<String ,Object> queryTwoRequest(int id, int sys_level, int page){
//        System.out.println(page);
        return this.categoryService.queryTwoRequest(id, sys_level,page);
    }

    //根据类别ID查询最新发布的帖子
    @RequestMapping("queryLatest")
    public Topic queryLatest(String id){
        System.out.println("类别ID"+id);
        return this.categoryService.queryLatest(id);
    }
}
