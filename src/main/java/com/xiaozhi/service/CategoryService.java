package com.xiaozhi.service;

import com.xiaozhi.entity.Category;
import com.xiaozhi.entity.Subsystem;
import com.xiaozhi.entity.Topic;
import com.xiaozhi.vo.CatAndTopVO;
import com.xiaozhi.vo.SubCategpryVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * (Category)表服务接口
 *
 * @author makejava
 * @since 2020-11-24 09:49:21
 */
public interface CategoryService {

    /**
     * 通过ID查询单条数据
     *
     * @param 主键
     * @return 实例对象
     */
    Subsystem queryById(int id);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    List<Category> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param category 实例对象
     * @return 实例对象
     */
    Category insert(Category category);

    /**
     * 修改数据
     *
     * @param category 实例对象
     * @return 实例对象
     */
    Category update(Category category);

    int getTotal(String icon);

    int getPidTotal(int id, int sys_level);

    int getThreeTotal(int id,int sys_level);
    /**
     * 通过主键删除数据
     *
     * @param 主键
     * @return 是否成功
     */
    boolean deleteById();

    //查询所有
    List<Subsystem> queryAll();

    //根据一级类别去查询二级类别
    List<Subsystem> queryTwoCategory(String category_id);
    List<Subsystem> queryTwoCategory2(int category_id);
    //查询最新发布的一条帖子
    Topic queryLatest(String id);

    Map<String ,Object> queryTwoCategoryFenye(String category_id,int page);

    Map<String ,Object> queryRequest(int id, int page, int sys_level);

    //根据一级类别去查询二级-->
    Map<String ,Object> queryTwoRequest(int id, int sys_level, int page);

    Subsystem queryByName(String name);
}