package com.xiaozhi.vo;

import com.xiaozhi.entity.Topic;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AttentionVO {
    private int user_id;
    private int topic_id;
}
