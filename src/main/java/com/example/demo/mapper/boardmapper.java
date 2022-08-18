package com.example.demo.mapper;

import com.example.demo.board;
import org.apache.ibatis.annotations.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Mapper
public interface boardmapper {
    @Select("select count(*) from board where writer=#{nick}")
    int CountUserboard(@Param("nick")String nick);

    @Select("select boardnum from board order by boardnum desc limit 1")
    int MaxBoardNum();

    @Select("select uu.usernum, bb.boardnum, cc.catename, bb.boardname, bb.writer, bb.writedate, bb.views from board as bb join category as cc on cc.category = bb.category join user as uu on bb.writer = uu.nick order by bb.writedate desc limit 12")
    List<board> getBoard();

    @Select("select bb.filename, bb.boardname, bb.writer, bb.boardnum, uu.usernum from board as bb join user as uu on bb.writer = uu.nick where filename like '%.jpg%' or filename like '%.png%' order by writedate desc limit 8")
    List<board> getAlbum();

    @Select("select bb.boardnum, cc.catename, bb.boardname, bb.content, bb.writer, bb.writedate, bb.views, bb.filename, bb.filepath from board as bb join category as cc on cc.category = bb.category where boardnum = #{boardnum}")
    board getSelectBoard(@Param("boardnum") int boardnum);

    @Update("update board set boardname=#{param1}, content=#{param2}, writer=#{param3} , writedate=#{param4}, category=#{param5}, filename=#{param6}, filepath=#{param7} where boardnum = #{param8}")
    int boardUpdate(@Param("boardname")String boardname,
                    @Param("content")String content,
                    @Param("writer")String writer,
                    @Param("times")String times,
                    @Param("boardcategory")int boardcategory,
                    @Param("filename")String fileName,
                    @Param("filepath")String filePath,
                    @Param("boardnum")int boardnum);

    @Insert("insert into board values(#{MaxBoardNum},#{boardname},#{content},#{writer},#{times},0,#{boardcategory},0,#{filename},#{filepath})")
    int boardinsert(@Param("MaxBoardNum")int MaxBoardNum,
                    @Param("boardname")String boardname,
                    @Param("content")String content,
                    @Param("writer")String writer,
                    @Param("times")String times,
                    @Param("boardcategory")int boardcategory,
                    @Param("filename")String fileName,
                    @Param("filepath")String filePath);

    @Select("select views from board where boardnum = #{boardnum}")
    int getViews(@Param("boardnum")int boardnum);

    @Update("update board set views = #{views} where boardnum = #{boardnum}")
    void updateviews(@Param("views")int views,@Param("boardnum")int boardnum);

    @Delete("delete from board where boardnum=#{param1}")
    void boardDelete(@Param("boardnum")int boardnum);
    //-------------------------그레이트홀(공지/자유)--------------------------------------------
    @Select("select bb.boardnum, cc.catename, bb.boardname, bb.writer, bb.writedate, bb.views, uu.usernum,bb.category,bb.paging from board as bb join category as cc on cc.category = bb.category join user as uu on bb.writer = uu.nick where bb.category=0 order by bb.writedate desc limit 22")
    List<board> getNotice();
    @Select("select bb.boardnum, cc.catename, bb.boardname, bb.writer, bb.writedate, bb.views, uu.usernum,bb.category,bb.paging from board as bb join category as cc on cc.category = bb.category join user as uu on bb.writer = uu.nick where bb.category=2 order by bb.writedate desc limit 22")
    List<board> getFree();
    @Select("select bb.boardnum, cc.catename, bb.boardname, bb.writer, bb.writedate, bb.views,bb.category,bb.paging, uu.usernum from board as bb join category as cc on cc.category = bb.category join user as uu on bb.writer = uu.nick where bb.category=3 order by bb.writedate desc limit 22")
    List<board> getTip();
    //--------------------------기숙사 입장(각 기숙사)-----------------------------------------
    @Select("select * from board as bb join user as uu on bb.writer = uu.nick where writer in (select nick from user where dominum=0) order by writedate desc")
    List<board> getGry();

    @Select("select * from board as bb join user as uu on bb.writer = uu.nick where writer in (select nick from user where dominum=1) order by writedate desc")
    List<board> getSly();

    @Select("select * from board as bb join user as uu on bb.writer = uu.nick where writer in (select nick from user where dominum=2) order by writedate desc")
    List<board> getRav();

    @Select("select * from board as bb join user as uu on bb.writer = uu.nick where writer in (select nick from user where dominum=3) order by writedate desc")
    List<board> getHuf();

    //-------------------------------------------------------------------------------------------------
    @Select("select a.writer, count(*) as liked from board as a join liked as b on a.boardnum=b.boardnum group by a.writer")
    List<board> getlikeRank();
    @Select("select bb.boardnum, cc.catename, bb.boardname, bb.writer, bb.writedate, bb.views from board as bb join category as cc on cc.category = bb.category where bb.content like #{content} order by bb.writedate desc")
    List<board> getSearchcontent(@Param("content")String content);
    @Select("select bb.boardnum, cc.catename, bb.boardname, bb.writer, bb.writedate, bb.views from board as bb join category as cc on cc.category = bb.category where bb.writer like #{writer} order by bb.writedate desc")
    List<board> getSearchwriter(@Param("writer")String writer);
    @Select("select bb.boardnum, cc.catename, bb.boardname, bb.writer, bb.writedate, bb.views from board as bb join category as cc on cc.category = bb.category where bb.boardname like #{boardname} order by bb.writedate desc")
    List<board> getSearchboardname(@Param("boardname")String boardname);

    //-------------------------------------------------------------------------------------------------
    @Select("select count(*) as liked from board as a join liked as b on a.boardnum=b.boardnum where writer=#{nick}")
    int userliked(@Param("nick")String nick);
    //------------------------------------------------------------------------------------------------------------------
    @Select("select bb.boardnum, cc.catename, bb.boardname, bb.writer, bb.writedate, bb.views, uu.usernum from board as bb join category as cc on cc.category = bb.category join user as uu on bb.writer = uu.nick where bb.category=12 order by bb.writedate desc limit 22")
    List<board> getfanfic();
    @Select("select bb.boardnum, cc.catename, bb.boardname, bb.writer, bb.writedate, bb.views, uu.usernum from board as bb join category as cc on cc.category = bb.category join user as uu on bb.writer = uu.nick where bb.category=13 order by bb.writedate desc limit 22")
    List<board> getmusic();
    @Select("select bb.boardnum, cc.catename, bb.boardname, bb.writer, bb.writedate, bb.views, uu.usernum from board as bb join category as cc on cc.category = bb.category join user as uu on bb.writer = uu.nick where bb.category=4 order by bb.writedate desc limit 22")
    List<board> getart();
    //페이징----------------------------------------------------------------------
    @Update("update board set paging=#{paging} where boardnum=#{boardnum}")
    void updatepaging(@Param("paging")int paging,@Param("boardnum")int boardnum);
    @Select("select paging from board where category=#{category} order by paging desc limit 1;")
    int maxpaging(@Param("category")int category);
    @Select("select paging from board order by paging desc limit 1;")
    int maxallpaging();
    @Select("select bb.boardnum, cc.catename, bb.boardname, bb.writer, bb.writedate, bb.views,bb.category,bb.paging from board as bb join category as cc on cc.category = bb.category where bb.category=#{category} and bb.paging=#{page} order by bb.writedate desc limit 22")
    List<board> getpaging(@Param("category")int cate,@Param("page")int page);
    @Select("select * from board as bb join user as uu on bb.writer=uu.nick join category as cc on cc.category = bb.category where paging=#{page} order by bb.writedate desc")
    List<board> getallpaging(@Param("page")int page);
    //----------------------------문의/요청 사이드(문의,건의,신고)--------------------------------------------
    @Select("select * from board as bb join user as uu on bb.writer=uu.nick join category as cc on cc.category = bb.category order by bb.writedate desc")
    List<board> getAll();

    @Select("select bb.boardnum, cc.catename, bb.boardname, bb.writer, bb.writedate, bb.views, uu.usernum from board as bb join category as cc on cc.category = bb.category join user as uu on bb.writer = uu.nick where bb.category=11 order by bb.writedate desc limit 22")
    List<board> getNotify();

    @Select("select bb.boardnum, cc.catename, bb.boardname, bb.writer, bb.writedate, bb.views, uu.usernum from board as bb join category as cc on cc.category = bb.category join user as uu on bb.writer = uu.nick where bb.category=9 order by bb.writedate desc limit 22")
    List<board> getInquiry();

    @Select("select bb.boardnum, cc.catename, bb.boardname, bb.writer, bb.writedate, bb.views, uu.usernum from board as bb join category as cc on cc.category = bb.category join user as uu on bb.writer = uu.nick where bb.category=10 order by bb.writedate desc limit 22")
    List<board> getGun();
    //--------------------------다른 유저 정보창----------------------------------------------
    @Select("select * from board as bb join user as uu on bb.writer = uu.nick join category as cc on cc.category = bb.category where uu.usernum=#{usernum} order by bb.writedate desc")
    List<board> getOtherPost(@Param("usernum")int usernum);
    @Select("select * from board as bb join category as cc on bb.category = cc.category where boardnum IN (select boardnum from comment where writer=#{nick} group by boardnum) order by bb.writedate desc")
    List<board> getOtherReply(@Param("nick")String nick);
    @Update("update board set writer=#{newnick} where writer=#{nick}")
    void UpdateWriter (@Param("newnick")String newnick,@Param("nick")String nick);
}
