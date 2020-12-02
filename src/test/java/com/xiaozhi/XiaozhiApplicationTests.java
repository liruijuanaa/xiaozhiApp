package com.xiaozhi;

import com.xiaozhi.dao.CommentDao;
import com.xiaozhi.dao.TopicDao;
import com.xiaozhi.dao.UserDao;
import com.xiaozhi.entity.Comment;
import com.xiaozhi.entity.Topic;
import com.xiaozhi.entity.User;
import com.xiaozhi.service.TopicService;
import com.xiaozhi.vo.CommentVO;
import com.xiaozhi.vo.MyQuizVO;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@SpringBootTest(classes = XiaozhiApplication.class)
@Slf4j
class XiaozhiApplicationTests {

    @Autowired
    private UserDao userDao;

    @Autowired
    private TopicDao topicDao;

    @Autowired
    private TopicService topicService;

    @Autowired
    private CommentDao commentDao;

    @Test
    void contextLoads() {
//        User user=new User();
//        user.setUsername("li");
//        User users = this.userDao.queryByName("li");
//        if (users==null){
//            System.out.println("users");
//        }else {
//            System.out.println("aaa");
//        }
        User user=new User();
        user.setUsername("shilei");
        user.setPassword("shilei");
        userDao.insert(user);
    }
    @Test
    void queryHot() {
        List<Topic> topics = this.topicDao.queryHot();
        for (Topic topic : topics) {
            System.out.println(topic);
        }
    }
    @Test
    void queryComment() {
//        List<Comment> comments = this.commentDao.queryAllByLimit(0, 5);
//        for (Comment comment : comments) {
//            System.out.println(comment);
//        }
//        List<CommentVO> comments = this.commentDao.queryComment("4a6d5c78-8d5d-46ec-862f-369fae47c749",2);
//        System.out.println(comments.size());
    }
    @Test
    void updateTopic() {
//        Topic topic=new Topic();
//        topic.setId("2");
//        Integer comment = topic.getComment();
//        comment++;
//        this.topicDao.update(topic);
        log.info("---");
//        Topic cc = topicService.insert("北京2");
//        System.out.println(cc);
//        MyQuizVO quizVO=new MyQuizVO("111","1111");
//        int i = topicService.insertQuiz(quizVO);
//        System.out.println(i);
    }

    @Test
    void qq(){
        List<Comment> comments = this.commentDao.queryCom();
        for (Comment comment : comments) {
            System.out.println(comment);
        }
    }

    @Test
    void addDate(){
//        Topic topic = this.topicService.queryById("4a6d5c78-8d5d-46ec-862f-369fae47c749");
//        Date date=new Date();
//        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        String format = dateFormat.format(date);
//
//        System.out.println(format);

    }
}
