package com.xiaozhi;

import com.xiaozhi.entity.Category;
import com.xiaozhi.entity.Topic;
import com.xiaozhi.service.CategoryService;
import com.xiaozhi.vo.CatAndTopVO;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import java.util.List;

@SpringBootTest(classes = XiaozhiApplication.class)
@Slf4j
public class CategoryTest {

    @Resource
    private CategoryService categoryService;

    @Test
    public void addTest(){
        Category category=new Category();
        category.setName("类别5");
        this.categoryService.insert(category);
    }

    @Test
    public void queryAll(){
        List<Category> categories = this.categoryService.queryAllByLimit(0, 2);
        for (Category category : categories) {
            System.out.println(category);
        }
    }

    @Test
    public void queryTwoCategoryTest(){
//        List<Topic> topicList = this.categoryService.queryTwoCategory("169fe3de-0596-49d0-b77a-01853bf211d5");
//        for (Topic topic : topicList) {
//            System.out.println(topic);
//        }
    }
}
