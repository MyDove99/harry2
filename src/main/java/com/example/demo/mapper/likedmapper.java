package com.example.demo.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface likedmapper {
    @Insert("insert into liked values(#{boardnum},#{nick},1)")
    void insertliked(@Param("boardnum")int boardnum,@Param("nick")String nick);
    @Select("select count(*) from liked where nick=#{nick} and boardnum=#{boardnum}")
    int searchliked(@Param("boardnum")int boardnum,@Param("nick")String nick);
    @Select("select count(*) from liked where boardnum=#{boardnum}")
    int countliked(@Param("boardnum")int boardnum);
}
