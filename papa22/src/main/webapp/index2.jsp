<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import ="twitter4j.* " %>
<%@ page import ="twitter4j.auth.AccessToken"%>
<%@ page import ="twitter4j.auth.RequestToken"%>
<% 
//참조 :  http://m.blog.naver.com/ya1004ida/10104326195
String consumerKey = "lqXJCLo9kxFA3rDiQZtqTJIgt"; //"발급받은consumerKey "; 
String consumerSecret = "n1TaRZnzDNVvEdsm2f5UpaXbBllCERuC9AGL78nA9a44T58LTK"; //"발급받은consumeSecret"; 
String oauth_token =  request.getParameter("oauth_token"); // 트위터에서 인증 후 넘어오면 이 파라미터에 값이 있다.
String oauth_verifier = request.getParameter("oauth_verifier"); // 트위터에서 인증 후 넘어오면 이 파라미터에 값이 있다.

String name=null;
String tokenSecret=null;

            	System.out.println("후반전시작 ㅇ ");
               oauth_token =  request.getParameter("oauth_token"); // 트위터에서 인증 후 넘어오면 이 파라미터에 값이 있다.
               oauth_verifier = request.getParameter("oauth_verifier"); // 트위터에서 인증 후 넘어오면 이 파라미터에 값이 있다.
               System.out.println("oauth_token: "+oauth_token);
               System.out.println("oauth_verifier: "+oauth_verifier);
               System.out.println("(String)session.getAttribute('tokenSecret'" +(String)session.getAttribute("tokenSecret"));
               AccessToken accessToken = null;
               long id=0;
               try{
              
             //트위터인스턴스생성
            Twitter twitter = new TwitterFactory().getInstance();			
			twitter.setOAuthConsumer("lqXJCLo9kxFA3rDiQZtqTJIgt", "n1TaRZnzDNVvEdsm2f5UpaXbBllCERuC9AGL78nA9a44T58LTK"); //저장된 consumerKey, consumerSecret
			
            System.out.println("twitter2:"+twitter);
             //Access Token 설정
             
          // tokenSecret= request.getParameter("tokenSecret");
            tokenSecret=(String)session.getAttribute("tokenSecret");
             System.out.println("tokenSecret:"+tokenSecret);
             
             RequestToken requestToken=(RequestToken)session.getAttribute("reqToken");
                // accessToken 생성.
             //accessToken = twitter2.getOAuthAccessToken(oauth_token,(String)session.getAttribute("tokenSecret"));
                
                System.out.println("accessToken 생성직전");
                System.out.println("oauth_token:"+oauth_token);
                System.out.println("tokenSecret:"+tokenSecret);
                System.out.println("requestToken:"+requestToken);
             accessToken = twitter.getOAuthAccessToken(requestToken,oauth_verifier);
             //accessToken = twitter.getOAuthAccessToken(requestToken,oauth_verifier);

             
             
             
             System.out.println("accessToken:"+accessToken);
             twitter.setOAuthAccessToken(accessToken);
             
             //간단하게 내 정보를 가져오자.
 
             User statuses = twitter.getUserTimeline().get(0).getUser();
             name=statuses.getName();
             id=statuses.getId();
             System.out.println(statuses);
             }catch(Exception e) {
            	System.out.println("에러남:"+e); 
            	%>
            	에러남 ㅇㅇ:<%=e%><br>
            	
            	<% 
            	 
             }
               
%>
                    AccessToken 발급성공.
                    이름: <%=name%><br>
                    고유아이디:<%=id%><br>
                    토큰:<%=oauth_token%><br>
                    토큰값: <%= oauth_verifier%><br>
                    accessToken:<%=accessToken %><br>
                   (String)session.getAttribute("tokenSecret")=<%= (String)session.getAttribute("tokenSecret")%><br>
                   tokenSecret=<%=tokenSecret%><br>
                    
<%

            
%>
</body>
</html>