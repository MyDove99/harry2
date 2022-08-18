package com.example.demo.controller;

import com.example.demo.*;
import com.example.demo.mapper.*;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@MapperScan(basePackages = {"com.example.demo.mapper"})
@ComponentScan(basePackages = {"com.example.demo.config"})
@RestController
public class ajaxcontroller {
    private commentmapper commentmapper;
    private boardmapper boardmapper;
    private likedmapper likedmapper;
    private textrpgmapper textrpgmapper;
    private usermapper usermapper;
    private domimapper domimapper;
    public ajaxcontroller(commentmapper commentmapper,
                          boardmapper boardmapper,
                          likedmapper likedmapper,
                          textrpgmapper textrpgmapper,
                          usermapper usermapper,
                          domimapper domimapper){
        this.commentmapper = commentmapper;
        this.boardmapper = boardmapper;
        this.likedmapper = likedmapper;
        this.textrpgmapper = textrpgmapper;
        this.usermapper = usermapper;
        this.domimapper = domimapper;
    }
    @RequestMapping(value = "/commentwrite",method = RequestMethod.POST)
    public List<comment> commentwrite(@RequestParam int boardnum,
                           @RequestParam String content,
                           @RequestParam String writer,@RequestParam String times,Model model,
                                      HttpSession session) {
        int MaxComNum = commentmapper.MaxComNum();
        commentmapper.insertComment(boardnum,MaxComNum+1,content,writer,times);
        List<comment> commentList = commentmapper.getSelectBoard(boardnum);

        //---------------------------------------------------------
        int userscore = usermapper.userscore(writer);
        usermapper.Updateuserscore(userscore+3,writer);
        int userdominum = usermapper.userdominum(writer);
        int Domisocre = usermapper.Domiscore(userdominum);
        domimapper.UpdateDomiscore(Domisocre,userdominum);
        //---------------------------------------------------------
        user userinfo = usermapper.info(writer);
        int CountUserboard = boardmapper.CountUserboard(userinfo.getNick());
        int CountUsercomment = commentmapper.UserCountComment(userinfo.getNick());
        String UserDominame = domimapper.UserDominame(userinfo.getUserid());

        session.setAttribute("CountUsercomment",CountUsercomment);
        session.setAttribute("CountUserboard",CountUserboard);
        session.setAttribute("UserDominame",UserDominame);
        session.setAttribute("userinfo", userinfo);
        session.setAttribute("Userscore",userscore+3);

        return commentList;
    }
    @RequestMapping(value = "/tocommentwrite",method = RequestMethod.POST)
    public List<comment> tocommentwrite(@RequestParam int boardnum,
                                        @RequestParam String content,
                                        @RequestParam String writer,
                                        @RequestParam int comgroup,
                                        @RequestParam int topcum,@RequestParam String times,Model model,
                                        HttpSession session) {
        int MaxComNum = commentmapper.MaxComNum();
        commentmapper.inserttoComment(boardnum,MaxComNum+1,topcum,content,writer,times,comgroup);
        List<comment> commentList = commentmapper.getSelectBoard(boardnum);

        //---------------------------------------------------------
        int userscore = usermapper.userscore(writer);
        usermapper.Updateuserscore(userscore+3,writer);
        int userdominum = usermapper.userdominum(writer);
        int Domisocre = usermapper.Domiscore(userdominum);
        domimapper.UpdateDomiscore(Domisocre,userdominum);
        //---------------------------------------------------------
        user userinfo = usermapper.info(writer);
        int CountUserboard = boardmapper.CountUserboard(userinfo.getNick());
        int CountUsercomment = commentmapper.UserCountComment(userinfo.getNick());
        String UserDominame = domimapper.UserDominame(userinfo.getUserid());

        session.setAttribute("CountUsercomment",CountUsercomment);
        session.setAttribute("CountUserboard",CountUserboard);
        session.setAttribute("UserDominame",UserDominame);
        session.setAttribute("userinfo", userinfo);
        session.setAttribute("Userscore",userscore+3);

        return commentList;
    }
    @RequestMapping(value = "/onliked",method = RequestMethod.POST)
    public int[] onliked(@RequestParam int boardnum,
                               @RequestParam String nick) {
        int onliked = likedmapper.searchliked(boardnum,nick);
        if(onliked==0){
            likedmapper.insertliked(boardnum,nick);
        }
        int countliked = likedmapper.countliked(boardnum);
        int[] liked = {onliked,countliked};
        return liked;
    }

    @RequestMapping(value = "/endtextrpg",method = RequestMethod.POST)
    public String endtextrpg(@RequestParam String nick,
                             @RequestParam int stage,
                             @RequestParam int score,
                             @RequestParam int boss,
                             @RequestParam int dominum,
                             HttpSession session){
        String result="";
        textrpg gamescore = textrpgmapper.getUserRank(nick);
        if(score<gamescore.getScore()){
            result ="원래 기록을 넘지 못하였습니다.";
        }else{
            textrpgmapper.UpdateUser(stage,score,boss,nick);
            result ="당신의 최고 기록을 넘었습니다!";
        }
        int userscore = usermapper.userscore(nick);
        userscore =userscore + score;
        usermapper.Updateuserscore(userscore,nick);
        int Domisocre = usermapper.Domiscore(dominum);
        domimapper.UpdateDomiscore(Domisocre,dominum);
        session.setAttribute("Userscore",userscore);
        return result;
    }
    @RequestMapping(value = "/paging",method = RequestMethod.POST)
    public List<board> paging(@RequestParam String paging,
                              @RequestParam String category) {
        int page = Integer.parseInt(paging);
        int cate = Integer.parseInt(category);
        List<board> pagelist= boardmapper.getpaging(cate,page);

        return pagelist;
    }
    @RequestMapping(value = "/allpaging",method = RequestMethod.POST)
    public List<board> allpaging(@RequestParam String paging) {
        int page = Integer.parseInt(paging);
        List<board> pagelist= boardmapper.getallpaging(page);


        return pagelist;
    }
    @RequestMapping(value = "/comdelete",method = RequestMethod.POST)
    public List<comment> comdel(@RequestParam int comnum,
                                @RequestParam int boardnum,
                                Model model,HttpSession session) {
        commentmapper.DeleteComment(comnum);
        List<comment> commentList = commentmapper.getSelectBoard(boardnum);

        return commentList;
    }
    @RequestMapping(value = "/tocomdelete",method = RequestMethod.POST)
    public List<comment> tocomdel(@RequestParam int comnum,
                                @RequestParam int boardnum,
                                Model model,HttpSession session) {
        commentmapper.DeletetoComment(comnum);
        List<comment> commentList = commentmapper.getSelectBoard(boardnum);

        return commentList;
    }
}
