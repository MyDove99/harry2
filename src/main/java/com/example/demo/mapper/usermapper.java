package com.example.demo.mapper;

import com.example.demo.board;
import com.example.demo.user;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface usermapper {
    @Insert("insert into user values(#{Maxusernum},#{id},#{pwd},#{nick},6,#{mobile},#{email},0,#{username})")
    void user_sign_in(@Param("username") String username,
                     @Param("id") String id,
                     @Param("pwd") String pwd,
                     @Param("nick") String nick,
                     @Param("mobile") int mobile,
                     @Param("email") String email,
                     @Param("Maxusernum") int Maxusernum);

    @Select("select count(userid) from user where userid=#{id}")
    int result(@Param("id") String id);

    @Select("select count(nick) from user where nick=#{nick}")
    int result2(@Param("nick") String nick);
    @Select("select usernum from user order by usernum desc limit 1")
    int Maxusernum();

    @Select("select * from user where userid=#{userid} and pwd=#{pwd}")
    user user_login(@Param("userid")String userid, @Param("pwd")String pwd);

    @Select("select count(*) from user where userid=#{userid} and pwd=#{pwd}")
    int user_login_Check(@Param("userid")String userid, @Param("pwd")String pwd);

    @Update("update user set dominum=#{dominum} where nick=#{nick}")
    void DominumUpdate(@Param("dominum")int dominum,@Param("nick")String nick);
    @Select("select userscore from user where nick=#{nick}")
    int userscore(@Param("nick")String nick);
    @Select("select userscore from user where userid=#{id}")
    int userscoreid(@Param("id")String id);
    @Update("update user set userscore=#{score} where nick=#{nick}")
    void Updateuserscore(@Param("score")int score,@Param("nick")String nick);
    @Select("select sum(userscore) from user where dominum=#{dominum}")
    int Domiscore(@Param("dominum")int dominum);

    //<------------------------------------------------------------------------------------------->
    @Select("select * from user where dominum=0 order by userscore desc")
    List<user> GrifinRank();
    @Select("select * from user where dominum=1 order by userscore desc")
    List<user> SlyRank();
    @Select("select * from user where dominum=2 order by userscore desc")
    List<user> RavenRank();
    @Select("select * from user where dominum=3 order by userscore desc")
    List<user> HufleRank();
    //--------------------------------------------------------------------------------
    @Select("select * from user where nick=#{nick}")
    user info(@Param("nick")String nick);

    @Update("update user set pwd=#{param1}, nick=#{param2}, mobile=#{param3}, email=#{param4} where usernum=#{param5}")
    void infoupdate(@Param("pwd") String pwd,
                    @Param("nick") String nick,
                    @Param("mobile") int mobile,
                    @Param("email") String email,
                    @Param("usernum") int usernum);
    @Delete("delete from user where usernum=#{param1}")
    void userDelete(@Param("usernum")int user);
    //카카오---------------------------------------------------------------------------
    @Select("select count(*) from user where email=#{email}")
    int kakaocheck(@Param("email")String email);
    @Select("select * from user where email=#{email}")
    user kakaologin(@Param("email")String email);

    @Select("select userscore from user where email=#{email}")
    int userscorekakao(@Param("email")String email);

    //--------------------------------------------------------------------------------
    @Select("select dominum from user where nick=#{nick}")
    int userdominum(@Param("nick")String nick);
    //-------------------------------------------------------------------------------
    @Select("select userid from user where email=#{mail}")
    user findId(@Param("mail")String mail);

    @Select("select count(*) from user where email=#{mail}")
    int usercheck2(@Param("mail") String mail);

    @Select("select pwd from user where email=#{mail} and userid=#{userid}")
    user findPw(@Param("mail")String mail,
                @Param("userid")String userid);

    @Select("select count(*) from user where email=#{mail} and userid=#{userid}")
    int usercheck(@Param("mail")String mail,
                  @Param("userid")String userid);
    //-------------------다른유저정보-----------------------------
    @Select("select uu.nick, dd.dominame, uu.userscore, uu.usernum from user as uu join domitory as dd on uu.dominum = dd.dominum where usernum=#{usernum}")
    user userInfo(@Param("usernum")int usernum);

    @Select("select nick from user where usernum=#{usernum}")
    String searchUsernick(@Param("usernum")int usernum);

}

