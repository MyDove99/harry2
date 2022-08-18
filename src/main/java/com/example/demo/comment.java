package com.example.demo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class comment {
    int boardnum;
    int comnum;
    int topcum;
    String content;
    String writer;
    String writedate;
    int cdepth;
    String deleteyn;
    int comgroup;
}
