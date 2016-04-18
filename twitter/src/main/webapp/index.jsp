
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ page import ="twitter4j.* " %>
<%@ page import ="twitter4j.auth.AccessToken"%>
<%@ page import ="twitter4j.auth.RequestToken"%>

<%
    String consumerKey = "2Z088a9h7ywCyWrs7iylv4nYY"; //"발급받은consumerKey "; 
    String consumerSecret = "YBKw9mMJOTNEb2WSFsnrIKNChrCSq29IGvhFR0g173TQmUmlK6"; //"발급받은consumeSecret"; 
    String oauth_token =  request.getParameter("oauth_token"); // 트위터에서 인증 후 넘어오면 이 파라미터에 값이 있다.
    String oauth_verifier = request.getParameter("oauth_verifier"); // 트위터에서 인증 후 넘어오면 이 파라미터에 값이 있다.
   
    
          // accessToken 을 발급받지 않았으면 발급을 받는다.
          if(oauth_verifier == null || oauth_verifier.equals("")) {   // 트위터 인증 후 넘어온 화면인가 판단. 최초 열린화면이라면
           //트위터인스턴스생성
           Twitter twitter = new TwitterFactory().getInstance();
           //키등록
           twitter.setOAuthConsumer(consumerKey, consumerSecret);
           //인증요청토큰생성
           RequestToken reqToken= null;
           reqToken= twitter.getOAuthRequestToken();
           String tokenSecret= reqToken.getTokenSecret();
           String token = reqToken.getToken();
           //세션에 토큰 저장
           session.setAttribute("reqkey", tokenSecret);
           session.setAttribute("req", token);
           
           response.sendRedirect(reqToken.getAuthorizationURL());
           System.out.println("=---------------------1");
            } else { // 인증받은 후 자동으로 넘어오면 여기로 온다..즉 인증후 주소창에 보면 oauth_verifier 변수에 값이 있다.
             
             try{
              
             //트위터인스턴스생성
             Twitter twitter = new TwitterFactory().getInstance();
             twitter.setOAuthConsumer(consumerKey,consumerSecret);
             //Access Token 설정
             AccessToken accessToken= null;
         	System.out.println("(String)session.getAttribute('reqkey'):"+(String)session.getAttribute("reqkey"));

             
                // accessToken 생성.
                accessToken = twitter.getOAuthAccessToken(oauth_token,(String)session.getAttribute("reqkey"));
            	System.out.println("accessToken"+accessToken);

             twitter.setOAuthAccessToken(accessToken);
             
             //간단하게 내 정보를 가져오자.
             //User statuses = twitter.getUserTimeline().get(0).getUser();
             //System.out.println(statuses);
             }catch(Exception e) 
             {
            	System.out.println("dd?");
                System.out.println(e+"=---------------------2");
             }
%>
                    AccessToken 발급성공.
<%
             }
%>
</body>
</html>
 