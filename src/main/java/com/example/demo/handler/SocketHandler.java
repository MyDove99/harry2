package com.example.demo.handler;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.*;
import java.util.stream.Collectors;

@Component
public class SocketHandler extends TextWebSocketHandler {
    public int usercount=0;
    public SocketHandler(){

    }
    HashMap<String, WebSocketSession> sessionMap = new HashMap<>(); //웹소켓 세션을 담아둘 맵
    List<String> userlist = new ArrayList<>(); // 유저닉네임 리스트
    ArrayList<User> Sessionlist = new ArrayList<>(); //객체 리스트
    String reallist;
    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) {
        //메시지 발송
        String msg = message.getPayload();
        String [] userinfo=msg.split(":"); //분리

        String [] username = userinfo[3].split(",");  //닉네임
        String [] usersession = userinfo[2].split(","); //세션
        userlist.add(username[0].substring(1,username[0].length()-1));

        User user = new User(); //객체 클래스 선언
        user.nick = username[0].substring(1,username[0].length()-1); //객체 닉네임추가
        user.session = usersession[0].substring(1,usersession[0].length()-1); //객체 세션추가
        Sessionlist.add(user); //객체리스트에 객체 추가
        List<String> set = userlist.stream().distinct().collect(Collectors.toList()); //닉네임 리스트 중복제거
        userlist = set; // 중복제거한거 다시 리스트에 넣기
        String sendlist = set.toString(); // 중복제거한거 문자열 변환
        reallist = sendlist.substring(1,sendlist.length()-1); // 문자열에서 앞뒤 [] 짜르기

        JSONObject obj = jsonToObjectParser(msg); //오브젝트 생성
        obj.put("userlist",reallist); // 오브젝트에 userlist라는 값으로 reallist 보내기
        for(String key : sessionMap.keySet()) {
            WebSocketSession wss = sessionMap.get(key);
            try {
                wss.sendMessage(new TextMessage(obj.toJSONString()));
            }catch(Exception e) {
                e.printStackTrace();
            }
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        //소켓 연결
        super.afterConnectionEstablished(session);
        sessionMap.put(session.getId(), session);
        JSONObject obj = new JSONObject();
        obj.put("type", "getId");
        obj.put("sessionId", session.getId());
        session.sendMessage(new TextMessage(obj.toJSONString()));
        usercount=usercount+1;
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        //소켓 종료
        String delete = session.getId(); //1.나간 사람 세션값 구하기
        String username =""; //2.지역변수로 문자열 선언

        for(User user1: Sessionlist){ //3.for문으로 객체리스트 전부다 돌리기
            if (delete.equals(user1.session)){ //돌리다가 1번에서 구한 세션과 for문에서 구한 세션값이 같은 거 찾기
                username = user1.nick; //객체의 닉네임 가져와서 2번에 값 넣기
                userlist.remove(user1.nick); // 닉네임리스트에서 나간 사람 닉네임 삭제
            }
        }

        sessionMap.remove(session.getId());

        Set<String> set = new HashSet<String>(userlist); // 1.닉네임 중복제거
        List<String> newlist = new ArrayList<String>(set); // 2.문자열변화
        userlist = newlist; //문자열 변환한거 다시 값 넣기
        String sendlist = newlist.toString(); // 2번값 문자열 변환
        reallist = sendlist.substring(1,sendlist.length()-1); // 앞뒤에서 "" 짜르기

        JSONObject obj = new JSONObject(); //jsp 넘겨줄 오브젝트 생성
        obj.put("userName",username); // 모?루
        obj.put("type","exit"); // 타입을 나간걸로 설정
        obj.put("userlist",reallist.toString()); // 유저리스트 보내기

        for(String key : sessionMap.keySet()) {
            WebSocketSession wss = sessionMap.get(key);
            try {
                wss.sendMessage(new TextMessage(obj.toJSONString()));
            }catch(Exception e) {
                e.printStackTrace();
            }
        }
        super.afterConnectionClosed(session, status);
        usercount=usercount-1;
    }
    class User{
        String nick;
        String session;
    }

    private static JSONObject jsonToObjectParser(String jsonStr) {
        JSONParser parser = new JSONParser();
        JSONObject obj = null;
        try {
            obj = (JSONObject) parser.parse(jsonStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return obj;
    }
    public int getUsercount(int Usercount){
        if(usercount<=0){
            int returncount=this.usercount+1;
            return returncount;
        }else {
            return this.usercount;
        }
    }
}