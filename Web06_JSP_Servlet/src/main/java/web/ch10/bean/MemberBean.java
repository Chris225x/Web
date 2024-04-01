package web.ch10.bean;

import java.io.Serializable;

public class MemberBean implements Serializable{
   
   // 아이디, 비밀번호, 이메일 수신여부, 이메일 자기소개 정보를 변수로 선언
   private String userId;
   private String password;
   private String email;
   private String emailAgree;
   private String introduce;
   
   // 기본 생성자
   public MemberBean() {
      System.out.println("MemberBean() 생성자.");
   }

   // getter / setter
   public String getUserId() {
      return userId;
   }

   public void setUserId(String userId) {
      this.userId = userId;
   }

   public String getPassword() {
      return password;
   }

   public void setPassword(String password) {
      this.password = password;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getEmailAgree() {
      return emailAgree;
   }

   public void setEmailAgree(String emailAgree) {
      this.emailAgree = emailAgree;
   }

   public String getIntroduce() {
      return introduce;
   }

   public void setIntroduce(String introduce) {
      this.introduce = introduce;
   }
   
   
   
}

