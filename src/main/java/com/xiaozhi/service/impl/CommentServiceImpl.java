package com.xiaozhi.service.impl;

import com.xiaozhi.dao.CommentDao;
import com.xiaozhi.entity.Comment;
import com.xiaozhi.entity.Subsystem;
import com.xiaozhi.service.CommentService;
import com.xiaozhi.vo.CommentVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public Map<String, Object> queryAllByLimit(int rows, int page,String id) {
        int start = (page-1) * rows;
        List<Comment> comments = commentDao.queryAllByLimit(start, rows, id);
        int i = queryNum();
        System.out.println(i);
        int pageCount = i % rows == 0 ? i / rows : i / rows + 1;
        /*
         * 1. 计算起始下标
         * 2. 计算总页数
         *
         * page: 当前页
         * rows: 查询到的数据
         * total: 总页数
         * records: 总条数
         * */
        Map<String, Object> map = new HashMap<>();
        map.put("page", page);
        map.put("rows", comments);
        map.put("records", i);
        map.put("total", pageCount);
//        List<Category> categories = categoryDao.queryByLevels("2");
//        map.put("twoClass", categories);
        return map;
    }

    @Override
    public int queryNum() {
        return this.commentDao.queryNum();
    }

    /**
     * 新增数据
     *
     * @param comment 实例对象
     * @return 实例对象
     */
    @Override
    public Subsystem insert(Subsystem subsystem) {
        this.commentDao.insert(subsystem);
        return subsystem;
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
    public List<CommentVO> queryComment(int id) {

        return this.commentDao.queryComment(id);
    }

    @Override
    public List<Comment> queryCom() {
        return this.commentDao.queryCom();
    }
}