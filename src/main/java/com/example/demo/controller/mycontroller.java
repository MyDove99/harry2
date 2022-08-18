package com.example.demo.controller;

import com.example.demo.*;
import com.example.demo.handler.SocketHandler;
import com.example.demo.mapper.*;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.Banner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@MapperScan(basePackages = {"com.example.demo.mapper"})
@ComponentScan(basePackages = {"com.example.demo.config"})
@SpringBootApplication
@Controller
public class mycontroller {
    private usermapper usermapper;
    private boardmapper boardmapper;
    private domimapper domimapper;
    private catemapper catemapper;
    private commentmapper commentmapper;
    private textrpgmapper textrpgmapper;

    //----------------------------------------------------------
    private likedmapper likedmapper;
    SocketHandler socketHandler = new SocketHandler();

    public mycontroller(usermapper usermapper,boardmapper boardmapper,
                        domimapper domimapper,catemapper catemapper,
                        commentmapper commentmapper,textrpgmapper textrpgmapper,
                        SocketHandler socketHandler,likedmapper likedmapper){
        this.usermapper = usermapper;
        this.boardmapper = boardmapper;
        this.domimapper = domimapper;
        this.catemapper = catemapper;
        this.commentmapper = commentmapper;
        this.textrpgmapper = textrpgmapper;
        this.socketHandler = socketHandler;
        this.likedmapper = likedmapper;
    }
    SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date time = new Date();
    String times = format1.format(time);
    int UserCount=0;
    @RequestMapping("/")
    public String main(Model model,HttpSession session){
        List<board> boardList = boardmapper.getBoard();
        List<board> albumList = boardmapper.getAlbum();
        List<domitory> domRank = domimapper.domitoryrank();
        model.addAttribute("domrank", domRank);
        model.addAttribute("albumlist", albumList);
        model.addAttribute("boardlist", boardList);
        //--------------------------------------------------
        basic(model,session);
        return "main";
    }
    @RequestMapping(value = "/main")
    public String Main(Model model,HttpSession session){
        List<board> boardList = boardmapper.getBoard();
        List<board> albumList = boardmapper.getAlbum();
        List<domitory> domRank = domimapper.domitoryrank();
        model.addAttribute("domrank", domRank);
        model.addAttribute("albumlist", albumList);
        model.addAttribute("boardlist", boardList);
        //--------------------------------------------------
        basic(model,session);
        return "main";
    }
//회원가입-----------------------------------------------------------
    @RequestMapping(value = "/signin")
    public String Signin(){
        return "signin";
    }

    @RequestMapping(value = "/kakaosignin",method = RequestMethod.GET)
    public String Kakaosignin(@RequestParam String name,
                              @RequestParam String email,
                              Model model,HttpSession session){
        int kakaocheck = usermapper.kakaocheck(email);
        if(kakaocheck==0) {
            model.addAttribute("name", name);
            model.addAttribute("email", email);
            return "kakaosignin";
        } else{
            List<board> boardList = boardmapper.getBoard();
            List<board> albumList = boardmapper.getAlbum();
            List<domitory> domRank = domimapper.domitoryrank();
            model.addAttribute("domrank", domRank);
            model.addAttribute("albumlist", albumList);
            model.addAttribute("boardlist", boardList);
            session.setAttribute("user_check", 1);
            user userinfo = usermapper.kakaologin(email);
            int CountUserboard = boardmapper.CountUserboard(userinfo.getUserid());
            int CountUsercomment = commentmapper.UserCountComment(userinfo.getUserid());
            String UserDominame = domimapper.UserDominame(userinfo.getUserid());
            int userscore = usermapper.userscorekakao(email);
            session.setAttribute("CountUsercomment",CountUsercomment);
            session.setAttribute("CountUserboard",CountUserboard);
            session.setAttribute("UserDominame",UserDominame);
            session.setAttribute("userinfo", userinfo);
            session.setAttribute("Userscore",userscore);
            int userliked = boardmapper.userliked(userinfo.getNick());
            session.setAttribute("userliked",userliked);
            session.setAttribute("UserDominame",UserDominame);
            session.setAttribute("kakaocheck", 1);
            basic(model,session);
            int userNum = userinfo.getUsernum();
            session.setAttribute("userNum",userNum);
            return "main";
        }
    }
//-------------------------------------------------------------------

    @ResponseBody
    @RequestMapping("/idCheck")
    public int overlappedID(@RequestParam String id){
        usermapper.result(id);
        int result = usermapper.result(id);
        return result;
    }

    @ResponseBody
    @RequestMapping("/nickCheck")
    public int overlappedNick(@RequestParam String nick){
        usermapper.result(nick);
        int result2 = usermapper.result2(nick);
        return result2;
    }


//-----------------------------------------------------------------------
    @RequestMapping(value = "/domitorytest")
    public  String Domitest(@RequestParam String name,
                            @RequestParam String id,
                            @RequestParam String pwd,
                            @RequestParam String nick,
                            @RequestParam int mobile,
                            @RequestParam String email,
                            Model model){

        int Maxusernum = usermapper.Maxusernum();
        usermapper.user_sign_in(name, id, pwd, nick, mobile, email, Maxusernum+1);
        textrpgmapper.insertUser(nick);
        model.addAttribute("nick",nick);
        return  "domitorytest";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam String id,
                        @RequestParam String pw,
                        Model model, HttpServletRequest request,
                        HttpSession session){
        int user_check = usermapper.user_login_Check(id,pw);
        session.setAttribute("user_check", user_check);
        if(user_check==0){
            request.setAttribute("msg","아이디 / 비밀번호를 확인하세요.");
            request.setAttribute("url","/");
            return "alert";
        }else{
            List<board> boardList = boardmapper.getBoard();
            List<board> albumList = boardmapper.getAlbum();
            List<domitory> domRank = domimapper.domitoryrank();
            model.addAttribute("domrank", domRank);
            model.addAttribute("albumlist", albumList);
            model.addAttribute("boardlist", boardList);
            user userinfo = usermapper.user_login(id,pw);
            int CountUserboard = boardmapper.CountUserboard(userinfo.getNick());
            int CountUsercomment = commentmapper.UserCountComment(userinfo.getNick());
            String UserDominame = domimapper.UserDominame(userinfo.getUserid());
            int userscore = usermapper.userscoreid(id);

            session.setAttribute("CountUsercomment",CountUsercomment);
            session.setAttribute("CountUserboard",CountUserboard);
            session.setAttribute("UserDominame",UserDominame);
            session.setAttribute("userinfo", userinfo);
            session.setAttribute("Userscore",userscore);

            session = request.getSession();
            //---------------------------------------------------------------------
            int userliked = boardmapper.userliked(userinfo.getNick());
            session.setAttribute("userliked",userliked);
            //--------------------------------------------------
            session.setAttribute("kakaocheck", 0);
            int userNum = userinfo.getUsernum();
            session.setAttribute("userNum",userNum);
            basic(model,session);
            return "main";
        }
    }

    //--------------------------------------------------------------------------
    @RequestMapping(value = "/textrpg", method = RequestMethod.GET)
    public String textrpg(@RequestParam String nick,HttpServletRequest request,
                        HttpSession session,Model model){
        textrpg userscore = textrpgmapper.getUserRank(nick);
        List<textrpg> textrpgRanking = textrpgmapper.getRanking();
        model.addAttribute("rank",userscore);
        model.addAttribute("Ranking",textrpgRanking);
        return "textrpg";
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpSession session){
        session.removeAttribute("user_check");
        session.removeAttribute("userinfo");
        //--------------------------------------------------------------------
        session.removeAttribute("userliked");
        session.setAttribute("kakaocheck", 0);
        return "redirect:main";
    }

    @RequestMapping(value = "/admission", method = RequestMethod.GET)
    public String textrpg(@RequestParam String nick,
                          @RequestParam int dominum,
                          HttpServletRequest request){
        usermapper.DominumUpdate(dominum,nick);
        return "redirect:main";
    }
    //----------------------------게시판---------------------------------------------------
    @RequestMapping(value= "/write")
    public String write1(Model model,HttpSession session){
        UserCount = socketHandler.getUsercount(UserCount);
        model.addAttribute("usercount",UserCount);
        List<category> categoryList = catemapper.getCategory();
        List<category> cateGryList = catemapper.getCateGry();
        List<category> cateSlyList = catemapper.getCateSly();
        List<category> cateRavList = catemapper.getCateRav();
        List<category> cateHufList = catemapper.getCateHuf();
        List<category> cateTeaList = catemapper.getCateTea();

        model.addAttribute("cateGryList", cateGryList);
        model.addAttribute("cateSlyList", cateSlyList);
        model.addAttribute("cateRavList", cateRavList);
        model.addAttribute("cateHufList", cateHufList);
        model.addAttribute("categoryList",categoryList);
        model.addAttribute("cateTeaList",cateTeaList);

        basic(model,session);
        return "writing";
    }

    @RequestMapping(value = "/update")
    public String write2(@RequestParam int boardnum, Model model,HttpSession session){
        UserCount = socketHandler.getUsercount(UserCount);
        model.addAttribute("usercount",UserCount);
        List<category> categoryList = catemapper.getCategory();
        List<category> cateGryList = catemapper.getCateGry();
        List<category> cateSlyList = catemapper.getCateSly();
        List<category> cateRavList = catemapper.getCateRav();
        List<category> cateHufList = catemapper.getCateHuf();
        List<category> cateTeaList = catemapper.getCateTea();

        model.addAttribute("cateGryList", cateGryList);
        model.addAttribute("cateSlyList", cateSlyList);
        model.addAttribute("cateRavList", cateRavList);
        model.addAttribute("cateHufList", cateHufList);
        model.addAttribute("categoryList",categoryList);
        model.addAttribute("cateTeaList",cateTeaList);

        board boardinfo = boardmapper.getSelectBoard(boardnum);
        model.addAttribute("boardinfo",boardinfo);
        model.addAttribute("categoryList",categoryList);
        basic(model,session);
        return "update";
    }

    @RequestMapping(value = "/updating")
    public String contentUpdate(@RequestParam String boardname,
                                @RequestParam String content,
                                @RequestParam String writer,
                                @RequestParam int boardcategory,
                                @RequestParam MultipartFile file,
                                @RequestParam int boardnum,
                                Model model,HttpSession session)throws Exception{

        String projectPath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\files" ;
        UUID uuid = UUID.randomUUID();
        String fileName = uuid + "_" + file.getOriginalFilename();
        File saveFile = new File(projectPath, fileName);
        file.transferTo(saveFile);
        String filePath = "/files/" + fileName;

        boardmapper.boardUpdate(boardname,content,writer,times,boardcategory,fileName,filePath,boardnum);
        basic(model,session);
        return "redirect:/";
    }

    @RequestMapping(value = "/frmwrite", method = RequestMethod.POST)
    public String boardWrite(@RequestParam String boardname,
                             @RequestParam int boardcategory,
                             @RequestParam String content,
                             @RequestParam String writer,
                             @RequestParam MultipartFile file,
                             Model model,HttpSession session) throws Exception{

        int MaxBoardNum = boardmapper.MaxBoardNum();
        String projectPath = System.getProperty("user.dir") + "/src/main/resources/static/files" ;
        UUID uuid = UUID.randomUUID();
        String fileName = uuid + "_" + file.getOriginalFilename();
        File saveFile = new File(projectPath, fileName);
        file.transferTo(saveFile);
        String filePath = "/files/" + fileName;

        boardmapper.boardinsert(MaxBoardNum+1,boardname,content,writer,times,boardcategory,fileName,filePath);

        //---------------------------------------------------------
        int userscore = usermapper.userscore(writer);
        usermapper.Updateuserscore(userscore+10,writer);
        int userdominum = usermapper.userdominum(writer);
        int Domisocre = usermapper.Domiscore(userdominum);
        domimapper.UpdateDomiscore(Domisocre,userdominum);
        //---------------------------------------------------------
        user userinfo = usermapper.info(writer);
        int CountUserboard = boardmapper.CountUserboard(userinfo.getNick());
        int CountUsercomment = commentmapper.UserCountComment(userinfo.getNick());
        session.setAttribute("CountUsercomment",CountUsercomment);
        session.setAttribute("CountUserboard",CountUserboard);
        session.setAttribute("userinfo", userinfo);
        session.setAttribute("Userscore",userscore+10);

        basic(model,session);
        return "redirect:main";
    }

    @RequestMapping("/read")
    public String readBoard(@RequestParam int boardnum, Model model,HttpSession session){
        board boardinfo = boardmapper.getSelectBoard(boardnum);
        model.addAttribute("boardinfo", boardinfo);

        int nowviews = boardmapper.getViews(boardnum);
        boardmapper.updateviews(nowviews+1,boardnum);
        //----------------------------------------------------------------------------------
        int commentcount = commentmapper.countcomment(boardnum);
        model.addAttribute("commentcount",commentcount);
        List<comment> listcomment = commentmapper.getSelectBoard(boardnum);
        model.addAttribute("comments",listcomment);
        int liked = likedmapper.countliked(boardnum);
        model.addAttribute("liked",liked);

        basic(model,session);
        return "read";
    }

    @RequestMapping("/delete")
    public String deleteBoard(@RequestParam int boardnum, Model model){

        boardmapper.boardDelete(boardnum);
        return "redirect:/";
    }
    //----------------오락실-----------------------------------------------------------------------
    @RequestMapping("/arcadegate")
    public String arcadeEntrance(){
        return "arcadegate";
    }

    @RequestMapping("/arcade")
    public String arcadePlay(){
        return "arcade";
    }
    //---------------기숙사게시판----------------------------------------------------------------------
    @RequestMapping("/gry")
    public String showGry(Model model,HttpSession session){
        List<board> gryList = boardmapper.getGry();
        model.addAttribute("gryList",gryList);
        basic(model,session);
        return "gryffindor";
    }

    @RequestMapping("/sly")
    public String showSly(Model model,HttpSession session){
        basic(model,session);
        List<board> slyList = boardmapper.getSly();
        model.addAttribute("slyList",slyList);
        return "slytherin";
    }

    @RequestMapping("/rav")
    public String showRav(Model model,HttpSession session){
        basic(model,session);
        List<board> ravList = boardmapper.getRav();
        model.addAttribute("ravList",ravList);
        return "ravenclaw";
    }

    @RequestMapping("/huf")
    public String showHuf(Model model,HttpSession session){
        basic(model,session);
        List<board> hufList = boardmapper.getHuf();
        model.addAttribute("hufList",hufList);
        return "hufflepuff";
    }
    //---------------------------------------------------------------------------------
    @RequestMapping(value = "/rank", method = RequestMethod.GET)
    public String rank(HttpServletRequest request,Model model,HttpSession session) {
        List<domitory> domRank = domimapper.domitoryrank();
        model.addAttribute("domrank", domRank);
        //------------------------------------------------------
        List<user> grirank = usermapper.GrifinRank();
        List<user> slyrank = usermapper.SlyRank();
        List<user> ravenrank = usermapper.RavenRank();
        List<user> huflerank = usermapper.HufleRank();
        model.addAttribute("grirank", grirank);
        model.addAttribute("slyrank", slyrank);
        model.addAttribute("ravenrank", ravenrank);
        model.addAttribute("huflerank", huflerank);
        //---------------------------------------------------------
        basic(model,session);
        int rankFirst = domimapper.rankFirst();
        model.addAttribute("rankFirst",rankFirst);
        return "rank";
    }
    //검색----------------------------------------------------------------------
    @RequestMapping(value = "/search",method = RequestMethod.GET)
    public String search (@RequestParam String search,Model model,HttpSession session){
        String search2 = '%'+search+'%';
        List<board> searchcontent = boardmapper.getSearchcontent(search2);
        List<board> searchwriter = boardmapper.getSearchwriter(search2);
        List<board> searchboardname = boardmapper.getSearchboardname(search2);
        model.addAttribute("searchcontent",searchcontent);
        model.addAttribute("searchwriter",searchwriter);
        model.addAttribute("searchboardname",searchboardname);
        basic(model,session);
        return "search";
    }
    //공지사항/자유게시판-------------------------------------------------------------------
    @RequestMapping(value = "/qnaboard")
    public String Qnaboard(Model model,HttpSession session) {
        basic(model,session);
        return "qnaboard";
    }

    @RequestMapping("/all")
    public String showAllBoard(Model model,HttpSession session){
        List<board> allList = boardmapper.getAll();
        int j=1;
        int z=0;
        for(int i=0; i<allList.size(); i++){
            if(z==0){
            }else if(z==22){
                j++;
                z=0;
            }
            z++;
            boardmapper.updatepaging(j,allList.get(i).getBoardnum());
        }
        List<board> allList2 = boardmapper.getAll();
        model.addAttribute("allList", allList2);

        int maxpaging = boardmapper.maxallpaging();
        model.addAttribute("maxpaging",maxpaging);
        basic(model,session);
        return "all";
    }

    @RequestMapping("/free")
    public String showFreeBoard(Model model,HttpSession session){
        List<board> freeList = boardmapper.getFree();
        int j=1;
        int z=0;
        for(int i=0; i<freeList.size(); i++){
            if(z==0){
            }else if(z==5){
                j++;
                z=0;
            }
            z++;
            boardmapper.updatepaging(j,freeList.get(i).getBoardnum());
        }
        List<board> freeList2 = boardmapper.getFree();
        model.addAttribute("freeList", freeList2);

        int maxpaging = boardmapper.maxpaging(2);
        model.addAttribute("maxpaging",maxpaging);
        basic(model,session);
        return "freeboard";
    }

    @RequestMapping("/notice")
    public String showNoticeBoard(Model model,HttpSession session){
        List<board> noticeList = boardmapper.getNotice();
        model.addAttribute("noticeList", noticeList);
        basic(model,session);
        return "noticeboard";
    }

    @RequestMapping("/tip")
    public String showTipBoard(Model model,HttpSession session){
        basic(model,session);
        List<board> tiplist = boardmapper.getTip();
        model.addAttribute("tiplist", tiplist);
        return "tip";
    }
    //정보수정--------------------------------------------------------------------------
    @RequestMapping(value = "/myinfo2")
    public String Myinfo2() {
        return "myinfo";
    }

    @RequestMapping(value = "/myinfo", method = RequestMethod.GET)
    public String Myinfo(HttpSession session,
                         @RequestParam String nick,
                         Model model) {

        user info = usermapper.info(nick);
        model.addAttribute("user", info);
        basic(model,session);

        return "myinfo";
    }

    @RequestMapping(value = "/infoupdate")
    public String Infoupdate(@RequestParam String pwd,
                             @RequestParam String nick,
                             @RequestParam int mobile,
                             @RequestParam String email,
                             @RequestParam int usernum,
                             @RequestParam String memo, HttpSession session) {
        usermapper.infoupdate(pwd, nick, mobile, email, usernum);
        boardmapper.UpdateWriter(nick,memo);
        commentmapper.UpdateWriter(nick,memo);
        textrpgmapper.UpdateUserNick(nick,memo);

        user updateuserinfo = usermapper.info(nick);
        session.setAttribute("user",updateuserinfo);
        session.setAttribute("userinfo",updateuserinfo);
        return "redirect:/myinfo2";
    }
    @RequestMapping(value = "/deleteuser")
    public String deleteUser(@RequestParam int usernum,
                             HttpSession session){
        String usernick = usermapper.searchUsernick(usernum);
        usermapper.userDelete(usernum);
        textrpgmapper.userDelete(usernick);
        session.removeAttribute("user_check");
        session.removeAttribute("userinfo");
        //--------------------------------------------------------------------
        session.removeAttribute("userliked");
        return "redirect:/main";
    }
    //창작마당-----------------------------------------------------------
    @RequestMapping("/fanfic")
    public String showFanficBoard(Model model,HttpSession session){
        basic(model,session);
        List<board> fanficlist = boardmapper.getfanfic();
        model.addAttribute("fanficlist", fanficlist);
        return "fanfic";
    }
    @RequestMapping("/music")
    public String showMusicBoard(Model model,HttpSession session){
        basic(model,session);
        List<board> musiclist = boardmapper.getmusic();
        model.addAttribute("musiclist", musiclist);
        return "music";
    }
    @RequestMapping("/art")
    public String showArtBoard(Model model,HttpSession session){
        basic(model,session);

        List<board> artlist = boardmapper.getart();
        model.addAttribute("artlist", artlist);
        return "art";
    }
    //------------------------------------------------------------------------------
    @RequestMapping(value = "/find")
    public String findInfo(){
        return "find";
    }
    @RequestMapping(value = "/complete")
    public String findComplete(){
        return "complete";
    }
    @RequestMapping(value = "/fail")
    public String findFail(){
        return "fail";
    }
    //문의/요청 사이드(문의,건의,신고)------------------------------------------------------------------
    @RequestMapping("/notify")
    public String showNotifyBoard(Model model,HttpSession session){
        basic(model,session);
        List<board> notifyList = boardmapper.getNotify();
        model.addAttribute("notifyList", notifyList);
        return "notify";
    }

    @RequestMapping("/inquiry")
    public String showInquiryBoard(Model model,HttpSession session){
        basic(model,session);
        List<board> inquiryList = boardmapper.getInquiry();
        model.addAttribute("inquiryList", inquiryList);
        return "inquiry";
    }

    @RequestMapping("/gun")
    public String showGunBoard(Model model,HttpSession session){
        basic(model,session);
        List<board> gunList = boardmapper.getGun();
        model.addAttribute("gunList", gunList);
        return "gun";
    }
    //--------------------다른유저정보-----------------------------------------
    @RequestMapping(value = "/userinfo")
    public String showUserInfo(@RequestParam int usernum,
                               @RequestParam String nick,
                               Model model,HttpSession session){
        basic(model,session);
        user showInfo = usermapper.userInfo(usernum);
        List<board> postList = boardmapper.getOtherPost(usernum);
        List<board> replyList = boardmapper.getOtherReply(nick);
        model.addAttribute("showInfo", showInfo);

        int CountUserboard = boardmapper.CountUserboard(showInfo.getNick());
        int CountUsercomment = commentmapper.UserCountComment(showInfo.getNick());
        int userliked = boardmapper.userliked(showInfo.getNick());

        model.addAttribute("CountUsercomment",CountUsercomment);
        model.addAttribute("CountUserboard",CountUserboard);
        model.addAttribute("userliked", userliked);
        model.addAttribute("postList",postList);
        model.addAttribute("replyList",replyList);
        return "otheruser";
    }
    //상점-----------------------------------------------------------------------
    @RequestMapping(value = "/store")
    public String Store(){ return "store"; }

    void basic(Model model,HttpSession session) {
        UserCount = socketHandler.getUsercount(UserCount);
        model.addAttribute("usercount",UserCount);
        //기본값---------------------------------------
        List<board> likerank = boardmapper.getlikeRank();
        for(int i=0; i<likerank.size(); i++){
            for(int j=i+1; j<likerank.size(); j++){
                board firstinfo = likerank.get(i);
                board secondinfo = likerank.get(j);
                if (firstinfo.getLiked()<secondinfo.getLiked()){
                    board temp = firstinfo;
                    likerank.set(i,secondinfo);
                    likerank.set(j,temp);
                }
            }
        }
        session.setAttribute("likerank",likerank);
    }
}
