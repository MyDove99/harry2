package com.example.demo.mapper;

import com.example.demo.category;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface catemapper {
    @Select("select * from category")
    List<category> getCategory();
    @Select("select a.catename from category as a join board as b on a.category=b.category where b.boardnum=#{boardnum}")
    String getBoardcategory(@Param("boardnum")int boardnum);
    @Select("select * from category where category between 1 and 5 or category between 9 and 13")
    List<category> getCateGry();
    @Select("select * from category where category between 1 and 4 or category=6 or category between 9 and 13")
    List<category> getCateSly();
    @Select("select * from category where category between 1 and 4 or category=7 or category between 9 and 13")
    List<category> getCateRav();
    @Select("select * from category where category between 1 and 4 or category between 8 and 13")
    List<category> getCateHuf();
    @Select("select * from category")
    List<category> getCateTea();
}
