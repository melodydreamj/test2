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


			System.out.println("ó���Դϴ�"+(String)session.getAttribute("reqkey"));

			//���� :  http://m.blog.naver.com/ya1004ida/10104326195
		    String consumerKey = "2Z088a9h7ywCyWrs7iylv4nYY"; //"�߱޹���consumerKey "; 
		    String consumerSecret = "YBKw9mMJOTNEb2WSFsnrIKNChrCSq29IGvhFR0g173TQmUmlK6"; //"�߱޹���consumeSecret"; 
		    String oauth_token =  request.getParameter("oauth_token"); // Ʈ���Ϳ��� ���� �� �Ѿ���� �� �Ķ���Ϳ� ���� �ִ�.
		    String oauth_verifier = request.getParameter("oauth_verifier"); // Ʈ���Ϳ��� ���� �� �Ѿ���� �� �Ķ���Ϳ� ���� �ִ�.
		    AccessToken accessToken= null;
		    String name=null;
		    String tokenSecret=null;
		    long id=0;
    
           //accessToken �� �߱޹��� �ʾ����� �߱��� �޴´�.
           if(session.getAttribute("reqkey") == null ||session.getAttribute("reqkey").equals("")) {   // Ʈ���� ���� �� �Ѿ�� ȭ���ΰ� �Ǵ�. ���� ����ȭ���̶��
           //Ʈ�����ν��Ͻ�����
           Twitter twitter = new TwitterFactory().getInstance();
           //Ű���
           twitter.setOAuthConsumer(consumerKey, consumerSecret);
           //������û��ū����
           RequestToken reqToken= null;
           reqToken= twitter.getOAuthRequestToken();
           tokenSecret= reqToken.getTokenSecret();
           String token = reqToken.getToken();
           //���ǿ� ��ū ����
           if(tokenSecret!=null){
        	   System.out.println(" session.setAttribute('reqkey', tokenSecret)�� ���۵Ǿ����ϴ�.:"+tokenSecret);
           session.setAttribute("reqkey", tokenSecret);
    	   System.out.println("ù��° ���ǿϷ�");

           }
           if(token!=null){
        	   System.out.println(" session.setAttribute('req', token)�� ���۵Ǿ����ϴ�.:"+token);

           session.setAttribute("req", token);
    	   System.out.println("�ι�° ���ǿϷ�");

           }
           
  //         if(session.getAttribute("finish")==null){
  //         response.sendRedirect("index2.do?tokenSecret="+tokenSecret+"&token="+token);
   //        }else{
        
        System.out.println("session.getAttribute('reqkey')"+session.getAttribute("reqkey"));
        	   
           response.sendRedirect(reqToken.getAuthorizationURL());
     //      }
           System.out.println("----------------------1");
           System.out.println("reqkey="+(String)session.getAttribute("reqkey"));
           System.out.println("req="+(String)session.getAttribute("req"));
            } else { // �������� �� �ڵ����� �Ѿ���� ����� �´�..�� ������ �ּ�â�� ���� oauth_verifier ������ ���� �ִ�.
            	System.out.println("�Ĺ������� �� ");
               oauth_token =  request.getParameter("oauth_token"); // Ʈ���Ϳ��� ���� �� �Ѿ���� �� �Ķ���Ϳ� ���� �ִ�.
               oauth_verifier = request.getParameter("oauth_verifier"); // Ʈ���Ϳ��� ���� �� �Ѿ���� �� �Ķ���Ϳ� ���� �ִ�.
               System.out.println("oauth_token: "+oauth_token);
               System.out.println("oauth_verifier: "+oauth_verifier);
               
               try{
              
             //Ʈ�����ν��Ͻ�����
             Twitter twitter = new TwitterFactory().getInstance();
             twitter.setOAuthConsumer("2Z088a9h7ywCyWrs7iylv4nYY","YBKw9mMJOTNEb2WSFsnrIKNChrCSq29IGvhFR0g173TQmUmlK6");
            System.out.println("twitter:"+twitter);
             //Access Token ����
             
          // tokenSecret= request.getParameter("tokenSecret");
            tokenSecret=(String)session.getAttribute("reqkey");
             System.out.println("tokenSecret:"+tokenSecret);
             
             
                // accessToken ����.
             //accessToken = twitter.getOAuthAccessToken(oauth_token,(String)session.getAttribute("reqkey"));
             accessToken = twitter.getOAuthAccessToken(oauth_token,tokenSecret);
             System.out.println("accessToken:"+accessToken);
             twitter.setOAuthAccessToken(accessToken);
             
             //�����ϰ� �� ������ ��������.
 
             User statuses = twitter.getUserTimeline().get(0).getUser();
             name=statuses.getName();
             id=statuses.getId();
             System.out.println(statuses);
             }catch(Exception e) {
            	System.out.println("������:"+e); 
            	%>
            	������ ����:<%=e%><br>
            	
            	<% 
            	 
             }
%>
                    AccessToken �߱޼���.
                    �̸�: <%=name%><br>
                    �������̵�:<%=id%><br>
                    ��ū:<%=oauth_token%><br>
                    ��ū��: <%= oauth_verifier%><br>
                    accessToken:<%=accessToken %><br>
                   (String)session.getAttribute("reqkey")=<%= (String)session.getAttribute("reqkey")%><br>
                   tokenSecret=<%=tokenSecret%><br>
                    
<%
             }
            
%>
</body>
</html>