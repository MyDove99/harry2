package com.example.demo.mapper;

import com.example.demo.domitory;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface domimapper {
    @Select("select domiscore from domitory where dominum=2")
    int ravenSelect();

    @Select("select * from domitory where dominum in (0,1,2,3) order by domiscore desc")
    List<domitory> domitoryrank();

    @Select("select b.dominame from user as a join domitory as b on a.dominum = b.dominum where a.userid=#{nick}")
    String UserDominame(@Param("nick")String nick);

    @Update("update domitory set domiscore=#{domiscore} where dominum=#{dominum}")
    void UpdateDomiscore(@Param("domiscore")int domisocre,@Param("dominum")int dominum);

    @Select("select dominum from domitory order by domiscore desc limit 1")
    int rankFirst();
}
