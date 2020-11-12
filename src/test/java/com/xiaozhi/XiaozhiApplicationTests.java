package com.xiaozhi;

import com.xiaozhi.dao.CommentDao;
import com.xiaozhi.dao.TopicDao;
import com.xiaozhi.dao.UserDao;
import com.xiaozhi.entity.Topic;
import com.xiaozhi.entity.User;
import com.xiaozhi.vo.CommentVO;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest(classes = XiaozhiApplication.class)
@Slf4j
class XiaozhiApplicationTests {

    @Autowired
    private UserDao userDao;

    @Autowired
    private TopicDao topicDao;

    @Autowired
    private CommentDao commentDao;

    @Test
    void contextLoads() {
//        User user=new User();
//        user.setUsername("li");
        User users = this.userDao.queryByName("li");
        if (users==null){
            System.out.println("users");
        }else {
            System.out.println("aaa");
        }
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
        List<CommentVO> comments = this.commentDao.queryComment("1",2);
        System.out.println(comments.size());
    }
    @Test
    void updateTopic() {
//        Topic topic=new Topic();
//        topic.setId("2");
//        Integer comment = topic.getComment();
//        comment++;
//        this.topicDao.update(topic);
        log.info("---");
    }
}
