package com.example.demo.controller;

import com.example.demo.mapper.usermapper;
import com.example.demo.user;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@RestController
public class MailCertification {

    @Autowired
    private JavaMailSender javaMailSender;
    private usermapper usermapper;

    public MailCertification(usermapper usermapper){
        this.usermapper = usermapper;
    }

    @PostMapping("/CheckMail")
    public Map<String, Object> SendMail(String mail, HttpSession session){

        Map<String, Object> map = new HashMap<>();
        Random random = new Random();   //난수 생성을 위한 랜덤 클래스
        String key = ""; //인증번호

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(mail);    //스크립트에서 보낸 메일을 받을 사용자 이메일 주소
        //입력 키를 위한 코드
        for(int i=0; i<3; i++){
            int index = random.nextInt(25)+65;  //A~Z까지 랜덤 알파벳 생성
            key += (char)index;
        }
        int numIndex = random.nextInt(9999)+1000;    //4자리 랜덤 정수를 생성
        key += numIndex;
        message.setSubject("인증번호 입력을 위한 메일 전송");
        message.setText("인증번호 : "+ key);
        javaMailSender.send(message);
        map.put("key", key);
        return map;
    }

    @PostMapping(value = "/findid")
    public String findId(String mail){
        int usercheck = usermapper.usercheck2(mail);

        if(usercheck==1) {
            user userid = usermapper.findId(mail);
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(mail);
            message.setSubject("ID찾기");
            message.setText("님 ID : " + userid.getUserid());
            javaMailSender.send(message);
            return "1";
        } else {
            return "0";
        }
    }

    @PostMapping(value = "/findpw")
    public String findPw(String mail, String userid){
        int usercheck = usermapper.usercheck(mail, userid);

        if(usercheck==1){
            user userpw = usermapper.findPw(mail, userid);
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(mail);
            message.setSubject("PW찾기");
            message.setText("님 PW : "+ userpw.getPwd());
            javaMailSender.send(message);
            return "1";
        } else{
            return "0";
        }

    }
}
