package com.xiaozhi.service.impl;

import com.xiaozhi.dao.CommentDao;
import com.xiaozhi.dao.UserDao;
import com.xiaozhi.entity.Comment;
import com.xiaozhi.entity.Subsystem;
import com.xiaozhi.entity.User;
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

    @Resource
    private UserDao userDao;
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

    //查询总条数
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
    public int insert(Subsystem subsystem) {
        int i = this.commentDao.insert(subsystem);
        return i;
    }

    //查询最新评论
    @Override
    public int selectLast() {
        return this.commentDao.selectLast();
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

    //根据话题ID查询话题下的总评论数目
    @Override
    public int queryComNum(int id) {
        return this.commentDao.queryComNum(id);
    }

    //查询评论信息并分页
    @Override
    public Map<String, Object> queryComment(int id,int page) {

        int start = (page - 1) * 4;
        int num = queryComNum(id);
        int pageCount = num % 4 == 0 ? num / 4 : num / 4 + 1;
        Object arr[];
        if (pageCount>10){
            arr= new Object[10];
            for (int i=0;i<10;i++){
                arr[i]=i+1;
            }
        }else {
            arr= new Object[pageCount];
            for (int i=0;i<pageCount;i++){
                arr[i]=i+1;
            }
        }
        List<CommentVO> commentVOS = this.commentDao.queryComment(id, start);
        System.out.println("关注的集合");
        System.out.println(commentVOS);
        Map<String, Object> map = new HashMap<>();

        map.put("total",arr);
        map.put("num",pageCount);
        map.put("page",page);
        map.put("comlist",commentVOS);

        return map;
    }

    @Override
    public List<Comment> queryCom() {
        return this.commentDao.queryCom();
    }

    //添加评论
    @Override
    public int addComm(CommentVO commentVO) {
        return this.commentDao.addComm(commentVO);
    }

    //根据话题ID查询话题的发布者
    @Override
    public String  queryByuserID(int topic_id) {
        int user_id = this.commentDao.queryByuserID(topic_id);
        if (user_id==0){
            return "";
        }else {
            User user = userDao.queryById(user_id);
            return user.getUsername();
        }

    }

    //根据话题ID查询话题的发布者
    @Override
    public String queryByName(int topic_id) {
        int user_id = this.commentDao.queryByName(topic_id);
        if (user_id==0){
            return "";
        }else {
            User user = userDao.queryById(user_id);
            return user.getUsername();
        }
    }
}
