package com.xiaozhi.service.impl;

import com.xiaozhi.dao.CategoryDao;
import com.xiaozhi.dao.TopicDao;
import com.xiaozhi.entity.AddTheme;
import com.xiaozhi.entity.Category;
import com.xiaozhi.entity.Subsystem;
import com.xiaozhi.entity.Topic;
import com.xiaozhi.service.TopicService;
import com.xiaozhi.vo.MyAnswerVO;
import com.xiaozhi.vo.MyQuizVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * (Topic)表服务实现类
 *
 * @author makejava
 * @since 2020-11-09 13:52:27
 */
@Service("topicService")
@Transactional
public class TopicServiceImpl implements TopicService {

    @Resource
    private TopicDao topicDao;

    @Resource
    private CategoryDao categoryDao;
    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Subsystem queryById(int id) {
        return this.topicDao.queryById(id);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    @Override
    public List<Topic> queryAllTwo(String id) {
        return this.topicDao.queryAllTwo(id);
    }

    /**
     * 新增数据
     *
     * @param topic 实例对象
     * @return 实例对象
     */
    @Override
    public Subsystem insert(String title,String content,int category_id) {
//        Subsystem subsystem = this.categoryDao.queryByName(category_id);
        Subsystem subsystem = this.categoryDao.queryById(category_id);
        Subsystem subsystem1=new Subsystem();
        subsystem1.setName(content);
        subsystem1.setDescription(title);
        subsystem1.setIcon(subsystem.getIcon());
        subsystem1.setPid(category_id);
        subsystem1.setSeq(0);
        subsystem1.setStatus(1);
        int status = subsystem.getStatus();
        int ss=++status;
        subsystem1.setSys_level(ss);
        subsystem1.setCreate_time(new Date());

        this.topicDao.insert(subsystem1);
//        Category category = this.categoryDao.queryById(category_id);
//        Integer theme = category.getTheme();
//        category.setTheme(++theme);
//        this.categoryDao.update(category);
        return subsystem1;
    }

    /**
     * 修改数据
     *
     * @param topic 实例对象
     * @return 实例对象
     */
    @Override
    public Subsystem update(Subsystem subsystem) {
//        Integer prise = topic.getPrise();
//
//        topic.setPrise(++prise);
        this.topicDao.update(subsystem);
        return subsystem;
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(int id) {
        return this.topicDao.deleteById(id) > 0;
    }

    @Override
    public List<Topic> queryHot() {
        return this.topicDao.queryHot();
    }

    @Override
    public int insertQuiz(MyQuizVO quizVO) {
        int i = this.topicDao.insertQuiz(quizVO);
        return i;
    }

    @Override
    public int insertAns(MyAnswerVO answerVO) {
        int i = this.topicDao.insertAns(answerVO);
        return i;
    }

    @Override
    public Subsystem insertTheme(String title, String icon) {
          Subsystem subsystem=new Subsystem();
//        AddTheme addTheme=new AddTheme();
//        addTheme.setSectorDes(title);
        int i = selectSector();
        int a=++i;
        String sec="S0"+a;
        System.out.println(sec+"------");
//        addTheme.setSector(sec);

       subsystem.setName(sec);

        subsystem.setDescription(title);
//        subsystem1.setIcon(subsystem.getIcon());
        subsystem.setPid(0);
       subsystem.setSeq(0);
       subsystem.setIcon(icon);
       subsystem.setStatus(1);
//        int status = subsystem.getStatus();
//        int ss=++status;
       subsystem.setSys_level(0);
        subsystem.setCreate_time(new Date());
//
       this.topicDao.insertTheme(subsystem);

        return subsystem;
    }

    @Override
    public int selectSector() {
        return this.topicDao.selectSector();
    }

    @Override
    public Subsystem insertCate(String title,int user_id,String fatherName) {
        Subsystem subsystem1 = this.categoryDao.queryByName(fatherName);
        Subsystem subsystem=new Subsystem();
        subsystem.setName(title);
        subsystem.setDescription(title);
        subsystem.setIcon(subsystem1.getIcon());
        subsystem.setPid(subsystem1.getId());
        subsystem.setSeq(0);
        subsystem.setStatus(1);
        subsystem.setSys_level(1);
        subsystem.setCreate_time(new Date());
        int i = this.topicDao.insertCate(subsystem);
        return subsystem;
    }

    @Override
    public Subsystem queryThemeName(String icon) {
        return this.topicDao.queryThemeName(icon);
    }
}