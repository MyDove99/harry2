package com.example.demo.mapper;

import com.example.demo.comment;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface commentmapper {
    @Select("select comnum from comment order by comnum desc limit 1")
    int MaxComNum();
    @Select("select * from comment where boardnum=#{boardnum} order by comgroup,comnum")
    List<comment> getSelectBoard(@Param("boardnum")int boardnum);
    @Insert("insert into comment values(#{boardnum},#{comnum},0,#{content},#{writer}," +
            "#{writedate},0,'n',#{comnum})")
    void insertComment(@Param("boardnum")int boardnum,@Param("comnum")int comnum,
                      @Param("content")String content,@Param("writer")String writer,
                      @Param("writedate")String writedate);
    @Select("select count(*) from comment where boardnum=#{boardnum}")
    int countcomment(@Param("boardnum")int boardnum);

    @Insert("insert into comment values(#{boardnum},#{comnum},#{topcum},#{content},#{writer}," +
            "#{writedate},1,'n',#{comgroup})")
    void inserttoComment(@Param("boardnum")int boardnum,@Param("comnum")int comnum,
                       @Param("topcum")int topcum,@Param("content")String content,
                       @Param("writer")String writer,@Param("writedate")String writedate,
                       @Param("comgroup")int comgroup);
    @Select("select count(*) from comment where writer=#{nick}")
    int UserCountComment(@Param("nick")String nick);

    @Update("update comment set writer=#{newnick} where writer=#{nick}")
    void UpdateWriter (@Param("newnick")String newnick,@Param("nick")String nick);
    @Update("update comment set content='삭제된 댓글입니다.',deleteyn='y' where comnum=#{comnum}")
    void DeleteComment(@Param("comnum")int comnum);
    @Delete("delete from comment where comnum=#{comnum}")
    void DeletetoComment(@Param("comnum")int comnum);
}
