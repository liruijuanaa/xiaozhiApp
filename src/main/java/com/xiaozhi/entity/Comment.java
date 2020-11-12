package com.xiaozhi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * (Comment)实体类
 *
 * @author makejava
 * @since 2020-11-09 15:59:55
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comment implements Serializable {
    private static final long serialVersionUID = 279062915349552522L;

    private String id;

    private String content;

    private String userId;

    private String topicId;

    private Integer prise;


}