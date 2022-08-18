package com.example.demo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class board {
    private int usernum;
    private int boardnum;
    private int dominum;
    private String boardname;
    private String catename;
    private String content;
    private String writer;
    private String writedate;
    private String filename;
    private String filepath;
    private int views;
    private int category;
    private int paging;
    private int liked;
    private String dominame;
}
