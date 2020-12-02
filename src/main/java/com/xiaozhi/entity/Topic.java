package com.xiaozhi.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * (Topic)实体类
 *
 * @author makejava
 * @since 2020-11-09 13:52:25
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Topic implements Serializable {
    private static final long serialVersionUID = -76240592466058280L;

    private String id;

    private String title;

    private Integer prise;

    private Integer comment;

    private String content;

    private Integer status;

    private Integer category_id;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date publish_date;
//    private List<Comment> commentList;
}