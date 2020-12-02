package com.xiaozhi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AddTheme implements Serializable {
    private int id;
    private String system;
    private String systemDes;
    private String subSystem;
    private String subSystemDes;
    private String  sector;
    private String  sectorDes;
    private String  subSector;
    private String  subSectorDes;
    private int  mccStatus;
    private int  commissioningStatus;
    private String  remark;
}
