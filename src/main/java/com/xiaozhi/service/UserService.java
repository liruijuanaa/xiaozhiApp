package com.xiaozhi.service;

import com.xiaozhi.entity.Topic;
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
    User queryById(String id);

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
    boolean deleteById(String id);
    Map<String,String> queryByName(String username, String password);

    int insertAttention(AttentionVO attentionVO);
    int delAttention(String user_id,String topic_id);

    //查询关注问题
    List<AttentionVO> queryAttention(String id);

    //查询发表问题
    List<MyQuizVO> queryQuiz(String id);

    int delQuiz(String user_id,String topic_id);
}