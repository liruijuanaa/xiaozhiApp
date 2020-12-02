package com.xiaozhi.dao;

import com.xiaozhi.entity.User;
import com.xiaozhi.vo.AttentionVO;
import com.xiaozhi.vo.MyQuizVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * (User)表数据库访问层
 *
 * @author makejava
 * @since 2020-11-09 10:06:19
 */
public interface UserDao {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    User queryById(int id);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    List<User> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param user 实例对象
     * @return 对象列表
     */
    List<User> queryAll(User user);

    /**
     * 新增数据
     *
     * @param user 实例对象
     * @return 影响行数
     */
    int insert(User user);

    /**
     * 批量新增数据（MyBatis原生foreach方法）
     *
     * @param entities List<User> 实例对象列表
     * @return 影响行数
     */
    int insertBatch(@Param("entities") List<User> entities);

    /**
     * 批量新增或按主键更新数据（MyBatis原生foreach方法）
     *
     * @param entities List<User> 实例对象列表
     * @return 影响行数
     */
    int insertOrUpdateBatch(@Param("entities") List<User> entities);

    /**
     * 修改数据
     *
     * @param user 实例对象
     * @return 影响行数
     */
    int update(User user);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(int id);
    /**
     * 通过用户名、密码、验证码验证
     *
     * */
    User queryByName(String username);

    int insertAttention(AttentionVO attentionVO);

    //取消关注
    int delAttention(@Param("user_id") int user_id,@Param("topic_id") int topic_id);

    //查询关注问题
    List<AttentionVO> queryAttention(@Param("id") int id, @Param("start") int start);

    //查询发表问题
    List<MyQuizVO> queryQuiz(@Param("id") int id, @Param("start") int start);

    //删除发表
    int delQuiz(@Param("user_id") int user_id,@Param("topic_id") int topic_id);

    //根据用户名去查询用户
    User queryByOneName(String username);

    int queryPub(int id);

    //根据话题ID去查询用户
    User queryUser(String id);

    //查询用户关注话题的个数
    int getAttNum(int id);

    //查询用户发表话题的个数
    int getQuizNum(int id);

    //查询是否关注问题
    List<AttentionVO> queryIfAtten(@Param("id") int id);
}