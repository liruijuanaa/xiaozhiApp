package com.xiaozhi.service.impl;

import com.xiaozhi.dao.CategoryDao;
import com.xiaozhi.dao.TopicDao;
import com.xiaozhi.dao.UserDao;
import com.xiaozhi.entity.Category;
import com.xiaozhi.entity.Subsystem;
import com.xiaozhi.entity.Topic;
import com.xiaozhi.entity.User;
import com.xiaozhi.service.CategoryService;
import com.xiaozhi.vo.CatAndTopVO;
import com.xiaozhi.vo.SubCategpryVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

/**
 * (Category)表服务实现类
 *
 * @author makejava
 * @since 2020-11-24 09:49:21
 */
@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {
    @Resource
    private CategoryDao categoryDao;

    @Resource
    private TopicDao topicDao;

    @Resource
    private UserDao userDao;

    /**
     * 通过ID查询单条数据
     *
     * @param 主键
     * @return 实例对象
     */
    @Override
    public Subsystem queryById(int id) {
        return this.categoryDao.queryById(id);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    @Override
    public List<Category> queryAllByLimit(int offset, int limit) {
        return this.categoryDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param category 实例对象
     * @return 实例对象
     */
    @Override
    public Category insert(Category category) {
        category.setId(UUID.randomUUID().toString());
        category.setPosts(0);
        category.setTheme(0);
        this.categoryDao.insert(category);
        return category;
    }

    /**
     * 修改数据
     *
     * @param category 实例对象
     * @return 实例对象
     */
    @Override
    public Category update(Category category) {
        this.categoryDao.update(category);
        return null;
    }

    /**
     * 通过主键删除数据
     *
     * @param 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById() {
        return this.categoryDao.deleteById() > 0;
    }

    //查询所有

    @Override
    public List<Subsystem> queryAll() {
        return this.categoryDao.queryAll();
    }

    @Override
    public List<Subsystem> queryTwoCategory(String category_id) {

        Subsystem subsystem = queryByName(category_id);


        List<Subsystem> subsystemList = this.categoryDao.queryTwoCategory(subsystem.getId());

        return subsystemList;
    }

    @Override
    public List<Subsystem> queryTwoCategory2(int category_id) {
        return this.categoryDao.queryTwoCategory(category_id);
    }

    //查询最新发布的一条帖子

    @Override
    public Topic queryLatest(String id) {
//        CatAndTopVO catAndTopVO = this.categoryDao.queryLatest(id);
//        Topic topic = this.topicDao.queryById(catAndTopVO.getTopic_id());
//        return topic;
        return null;
    }

    @Override
    public int getTotal(String icon) {
        return this.categoryDao.getTotal(icon);
    }

    @Override
    public int getPidTotal(int id, int sys_level) {
        return this.categoryDao.getPidTotal(id,sys_level);
    }

    @Override
    public Subsystem queryByName(String name) {
        return this.categoryDao.queryByName(name);
    }

    @Override
    public Map<String, Object> queryTwoCategoryFenye(String category_id, int page) {

        Subsystem subsystem = queryByName(category_id);

        int start = (page - 1) * 10;

        List<Topic> topicList=new ArrayList<>();
        List<User> userList=new ArrayList<>();
        //根据一级类别查询所有二级类别，存储在list集合中
        //不应该对象类型为topic  因为要去展示话题的用户名，返回一个myquizvo，里面有用户ID 话题ID 返回这个
        List<Subsystem> subsystemList = this.categoryDao.queryTwoCategoryFenye(subsystem.getIcon(),start);
//        for (Subsystem subsystem : catAndTopVOS) {
//            Topic topic = this.topicDao.queryById(subsystem.getTopic_id());
//            //再根据话题ID 去查询用户
//            User user = this.userDao.queryUser(catAndTopVO.getTopic_id());
//            userList.add(user);
//            topicList.add(topic);
//        }

        int num = getTotal(subsystem.getIcon());
        int pageCount = num % 10 == 0 ? num / 10 : num / 10 + 1;

        System.out.println("总条数"+num);
        System.out.println("总页数"+pageCount);

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


        for (Object o : arr) {
            System.out.println(o);
        }
        /*
         * 1. 计算起始下标
         * 2. 计算总页数
         *
         * page: 当前页
         * num: 总页数
         *
         * */
        Map<String, Object> map = new HashMap<>();
        map.put("subsystemList",subsystemList);
        map.put("total",arr);
        map.put("num",pageCount);
        map.put("page",page);
//        map.put("userlist",userList);
        return map;
    }

    //根据所有一级去查询二级
    @Override
    public Map<String, Object> queryRequest(int id, int page,int sys_level) {

        int start = (page - 1) * 10;

        List<Subsystem> subsystemList = this.categoryDao.queryRequest(id,start,sys_level);

        int num = getPidTotal(id,sys_level);
        int pageCount = num % 10 == 0 ? num / 10 : num / 10 + 1;

        System.out.println("总条数"+num);
        System.out.println("总页数"+pageCount);

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


        for (Object o : arr) {
            System.out.println(o);
        }
        /*
         * 1. 计算起始下标
         * 2. 计算总页数
         *
         * page: 当前页
         * num: 总页数
         *
         * */
        Map<String, Object> map = new HashMap<>();
        map.put("subsystemList",subsystemList);
        map.put("total",arr);
        map.put("num",pageCount);
        map.put("page",page);
//        map.put("userlist",userList);
        return map;
    }

    @Override
    public int getThreeTotal(int id, int sys_level) {
        return this.categoryDao.getThreeTotal(id, sys_level);
    }

    //得到一级类别下的三级问题
    @Override
    public Map<String ,Object> queryTwoRequest(int id, int sys_level, int page) {
        int start = (page - 1) * 10;

        int num = getThreeTotal(id,2);
        int pageCount = num % 10 == 0 ? num / 10 : num / 10 + 1;

        System.out.println("总条数"+num);
        System.out.println("总页数"+pageCount);

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


        for (Object o : arr) {
            System.out.println(o);
        }

        Map<String ,Object> map=new HashMap<>();
        List list=new ArrayList();
        int totalThree=0;
        //得到指定一级类别下的二级类别
        List<Subsystem> subsystemList = this.categoryDao.queryTwoRequest(id, 2,start);
        map.put("subsystemList",subsystemList);
        map.put("total",arr);
        map.put("num",pageCount);
        map.put("page",page);
        return map;
    }
}