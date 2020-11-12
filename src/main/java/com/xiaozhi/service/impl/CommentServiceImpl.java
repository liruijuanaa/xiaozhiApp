package com.xiaozhi.service.impl;

import com.xiaozhi.dao.CommentDao;
import com.xiaozhi.entity.Comment;
import com.xiaozhi.service.CommentService;
import com.xiaozhi.vo.CommentVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Comment)表服务实现类
 *
 * @author makejava
 * @since 2020-11-09 15:59:56
 */
@Service("commentService")
@Transactional
public class CommentServiceImpl implements CommentService {

    @Resource
    private CommentDao commentDao;

    /**
     * 通过ID查询单条数据
     *
     * @param 主键
     * @return 实例对象
     */
    @Override
    public Comment queryById(String id) {
        return this.commentDao.queryById(id);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    @Override
    public List<Comment> queryAllByLimit(int offset, int limit) {
        return this.commentDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param comment 实例对象
     * @return 实例对象
     */
    @Override
    public Comment insert(Comment comment) {
        this.commentDao.insert(comment);
        return comment;
    }

    /**
     * 修改数据
     *
     * @param comment 实例对象
     * @return 实例对象
     */
    @Override
    public void update(String id) {
        Comment comment = this.queryById(id);
        Integer prise = comment.getPrise();
        prise++;
        comment.setPrise(prise);
        this.commentDao.update(comment);
    }



    /**
     * 通过主键删除数据
     *
     * @param 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(String id) {
        return false;
    }
    @Override
    public List<CommentVO> queryComment(String id,Integer limit) {

        return this.commentDao.queryComment(id,limit);
    }

}