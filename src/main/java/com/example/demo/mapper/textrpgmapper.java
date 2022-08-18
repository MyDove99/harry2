package com.example.demo.mapper;

import com.example.demo.textrpg;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface textrpgmapper {
    @Select("select * from textrpg order by score desc,stage desc limit 3")
    List<textrpg> getRanking();

    @Select("select * from textrpg where usernick=#{nick} order by score desc,stage desc limit 1")
    textrpg getUserRank(@Param("nick")String nick);

    @Insert("insert into textrpg values(#{nick},0,0,0)")
    void insertUser(@Param("nick")String nick);

    @Update("update textrpg set stage=#{stage},score=#{score},boss=#{boss} where usernick=#{nick}")
    void UpdateUser(@Param("stage")int stage,@Param("score")int score,@Param("boss")int boss,
                    @Param("nick")String nick);
    @Update("update textrpg set usernick=#{newnick} where usernick=#{nick}")
    void UpdateUserNick (@Param("newnick")String newnick,@Param("nick")String nick);

    @Delete("delete from textrpg where usernick=#{nick}")
    void userDelete(@Param("nick")String nick);
}
