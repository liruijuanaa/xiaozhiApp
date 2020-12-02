package com.xiaozhi.service;

import com.xiaozhi.entity.User;
import com.xiaozhi.vo.AttentionVO;
import com.xiaozhi.vo.MyQuizVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * (User)表服务接口
 *
 * @author makejava
 * @since 2020-11-09 10:06:21
 */
public interface UserService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    User queryById(int id);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    List<User> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param user 实例对象
     * @return 实例对象
     */
    User insert(User user);

    /**
     * 修改数据
     *
     * @param user 实例对象
     * @return 实例对象
     */
    User update(User user);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean deleteById(int id);
    Map<String,Object> queryByName(String username, String password);

    int insertAttention(AttentionVO attentionVO);
    int delAttention(int user_id,int topic_id);

    //查询关注问题
    Map<String, Object> queryAttention(int id, int page);

    //查询发表问题
    List<MyQuizVO> queryQuiz(int id);

    int delQuiz(int user_id,int topic_id);

    //根据用户名去查询用户
    User queryByOneName(String username);

    int queryPub(int id);

    //根据话题ID去查询用户
    User queryUser(String id);

    //查询用户关注话题的个数
    int getAttNum(int id);

    //查询是否关注问题
    List<AttentionVO> queryIfAtten(@Param("id") int id);
}