package com.xiaozhi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
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

//    private List<Comment> commentList;
}