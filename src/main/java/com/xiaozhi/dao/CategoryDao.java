package com.xiaozhi.dao;

import com.xiaozhi.entity.Subsystem;
import com.xiaozhi.vo.CatAndTopVO;
import com.xiaozhi.vo.SubCategpryVO;
import org.apache.ibatis.annotations.Param;
import com.xiaozhi.entity.Category;
import java.util.List;

/**
 * (Category)表数据库访问层
 *
 * @author makejava
 * @since 2020-11-24 09:49:20
 */
public interface CategoryDao {

    /**
     * 通过ID查询单条数据
     *
     * @param 主键
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
    List<Category> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param category 实例对象
     * @return 对象列表
     */
    List<Subsystem> queryAll();

    /**
     * 新增数据
     *
     * @param category 实例对象
     * @return 影响行数
     */
    int insert(Category category);

    /**
     * 批量新增数据（MyBatis原生foreach方法）
     *
     * @param entities List<Category> 实例对象列表
     * @return 影响行数
     */
    int insertBatch(@Param("entities") List<Category> entities);

    /**
     * 批量新增或按主键更新数据（MyBatis原生foreach方法）
     *
     * @param entities List<Category> 实例对象列表
     * @return 影响行数
     */
    int insertOrUpdateBatch(@Param("entities") List<Category> entities);

    /**
     * 修改数据
     *
     * @param category 实例对象
     * @return 影响行数
     */
    int update(Category category);

    int getTotal(String icon);

    int getPidTotal(@Param("id") int id, @Param("sys_level") int sys_level);

    int getThreeTotal(@Param("id") int id, @Param("sys_level") int sys_level);

    /**
     * 通过主键删除数据
     *
     * @param 主键
     * @return 影响行数
     */
    int deleteById();

    Subsystem queryByName(String name);

    //根据一级类别去查询二级类别
    List<Subsystem> queryTwoCategory(int category_id);

    //根据类别ID查询最新发布的一条帖子
    CatAndTopVO queryLatest(String id);

    //根据一级类别去查询二级类别
    List<Subsystem> queryTwoCategoryFenye(@Param("icon") String icon, @Param("start") int start);

      //根据指定的一级类别去查询二级-->
    List<Subsystem> queryRequest(@Param("id") int id, @Param("start") int start,@Param("sys_level") int sys_level);

    //根据二级类别去查询二级-->
    List<Subsystem> queryTwoRequest(@Param("id") int id,@Param("sys_level") int sys_level, @Param("start") int start);
}