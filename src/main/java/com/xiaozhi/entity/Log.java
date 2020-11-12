package com.xiaozhi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * (Log)实体类
 *
 * @author makejava
 * @since 2020-11-12 10:07:15
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Log implements Serializable {
    private static final long serialVersionUID = -53783947914512045L;

    private String id;

    private String username;

    private Object datetime;

    private String options;

    private String status;

}