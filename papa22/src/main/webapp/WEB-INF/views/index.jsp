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


			System.out.println("처음입니당"+(String)session.getAttribute("reqkey"));

			//참조 :  http://m.blog.naver.com/ya1004ida/10104326195
		    String consumerKey = "2Z088a9h7ywCyWrs7iylv4nYY"; //"발급받은consumerKey "; 
		    String consumerSecret = "YBKw9mMJOTNEb2WSFsnrIKNChrCSq29IGvhFR0g173TQmUmlK6"; //"발급받은consumeSecret"; 
		    String oauth_token =  request.getParameter("oauth_token"); // 트위터에서 인증 후 넘어오면 이 파라미터에 값이 있다.
		    String oauth_verifier = request.getParameter("oauth_verifier"); // 트위터에서 인증 후 넘어오면 이 파라미터에 값이 있다.
		    AccessToken accessToken= null;
		    String name=null;
		    String tokenSecret=null;
		    long id=0;
    
           //accessToken 을 발급받지 않았으면 발급을 받는다.
           if(oauth_verifier == null || oauth_verifier.equals("")) {   // 트위터 인증 후 넘어온 화면인가 판단. 최초 열린화면이라면
           //트위터인스턴스생성
           Twitter twitter = new TwitterFactory().getInstance();
           //키등록
           twitter.setOAuthConsumer(consumerKey, consumerSecret);
           //인증요청토큰생성
           RequestToken reqToken= null;
           reqToken= twitter.getOAuthRequestToken();
           tokenSecret= reqToken.getTokenSecret();
           String token = reqToken.getToken();
           //세션에 토큰 저장
           if(tokenSecret!=null){
        	   System.out.println(" session.setAttribute('reqkey', tokenSecret)이 시작되었습니다.:"+tokenSecret);
           session.setAttribute("reqkey", tokenSecret);
    	   System.out.println("첫번째 세션완료");

           }
           if(token!=null){
        	   System.out.println(" session.setAttribute('req', token)이 시작되었습니다.:"+token);

           session.setAttribute("req", token);
    	   System.out.println("두번째 세션완료");

           }
           
           if(session.getAttribute("finish")==null){
           response.sendRedirect("index2.do?tokenSecret="+tokenSecret+"&token="+token);
           }else{
           response.sendRedirect(reqToken.getAuthorizationURL());
           }
           System.out.println("----------------------1");
           System.out.println("reqkey="+(String)session.getAttribute("reqkey"));
           System.out.println("req="+(String)session.getAttribute("req"));
            } else { // 인증받은 후 자동으로 넘어오면 여기로 온다..즉 인증후 주소창에 보면 oauth_verifier 변수에 값이 있다.
            	System.out.println("후반전시작 ㅇ ");
               oauth_token =  request.getParameter("oauth_token"); // 트위터에서 인증 후 넘어오면 이 파라미터에 값이 있다.
               oauth_verifier = request.getParameter("oauth_verifier"); // 트위터에서 인증 후 넘어오면 이 파라미터에 값이 있다.
             try{
              
             //트위터인스턴스생성
             Twitter twitter = new TwitterFactory().getInstance();
             twitter.setOAuthConsumer("2Z088a9h7ywCyWrs7iylv4nYY","YBKw9mMJOTNEb2WSFsnrIKNChrCSq29IGvhFR0g173TQmUmlK6");
             //Access Token 설정
             
           String tokenSecret2= request.getParameter("tokenSecret2");
             System.out.println("tokenSecret2:"+tokenSecret2);
             
             
                // accessToken 생성.
             //accessToken = twitter.getOAuthAccessToken(oauth_token,(String)session.getAttribute("reqkey"));
             accessToken = twitter.getOAuthAccessToken(oauth_token,tokenSecret2);
             System.out.println("accessToken:"+accessToken);
             twitter.setOAuthAccessToken(accessToken);
             
             //간단하게 내 정보를 가져오자.
 
             User statuses = twitter.getUserTimeline().get(0).getUser();
             name=statuses.getName();
             id=statuses.getId();
             System.out.println(statuses);
             }catch(Exception e) {
%>
                    AccessToken 발급성공.
                    이름: <%=name%><br>
                    고유아이디:<%=id%><br>
                    토큰:<%=oauth_token%><br>
                    토큰값: <%= oauth_verifier%><br>
                    accessToken:<%=accessToken %><br>
                   (String)session.getAttribute("reqkey")=<%= (String)session.getAttribute("reqkey")%><br>
                   tokenSecret=<%=tokenSecret%><br>
                    
<%
             }
            }
%>
</body>
</html>