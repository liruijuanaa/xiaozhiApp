package com.xiaozhi.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentVO {
    private String id;

    private String content;

    private String userId;

    private String topicId;

    private Integer prise;


    private String username;

    private String photo;
}
