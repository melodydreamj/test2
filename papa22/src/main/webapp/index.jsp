<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
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


			System.out.println("ó���Դϴ�"+(String)session.getAttribute("tokenSecret"));

			//���� :  http://m.blog.naver.com/ya1004ida/10104326195
		    String consumerKey = "lqXJCLo9kxFA3rDiQZtqTJIgt"; //"�߱޹���consumerKey "; 
		    String consumerSecret = "n1TaRZnzDNVvEdsm2f5UpaXbBllCERuC9AGL78nA9a44T58LTK"; //"�߱޹���consumeSecret"; 
		    String oauth_token =  request.getParameter("oauth_token"); // Ʈ���Ϳ��� ���� �� �Ѿ���� �� �Ķ���Ϳ� ���� �ִ�.
		    String oauth_verifier = request.getParameter("oauth_verifier"); // Ʈ���Ϳ��� ���� �� �Ѿ���� �� �Ķ���Ϳ� ���� �ִ�.
		    
		    String name=null;
		    String tokenSecret=null;
		    long id=0;
    
           //accessToken �� �߱޹��� �ʾ����� �߱��� �޴´�.
           //if(session.getAttribute("tokenSecret") == null ||session.getAttribute("tokenSecret").equals("")) {   // Ʈ���� ���� �� �Ѿ�� ȭ���ΰ� �Ǵ�. ���� ����ȭ���̶��
          if(oauth_verifier == null ||oauth_verifier.equals("")) {   // Ʈ���� ���� �� �Ѿ�� ȭ���ΰ� �Ǵ�. ���� ����ȭ���̶��

        	   //Ʈ�����ν��Ͻ�����
          Twitter twitter = new TwitterFactory().getInstance();
           //Ű���
           twitter.setOAuthConsumer("lqXJCLo9kxFA3rDiQZtqTJIgt", "n1TaRZnzDNVvEdsm2f5UpaXbBllCERuC9AGL78nA9a44T58LTK");
           //������û��ū����
           RequestToken reqToken= null;
           reqToken= twitter.getOAuthRequestToken();
           
           String token = reqToken.getToken();
           tokenSecret= reqToken.getTokenSecret();
    	   System.out.println(" reqToken:"+reqToken);
    	   System.out.println(" twitter:"+twitter);
    	   System.out.println(" consumerKey:"+consumerKey);
    	   System.out.println(" consumerSecret:"+consumerSecret);

           //���ǿ� ��ū ����

           if(token!=null&&consumerKey!=null&&reqToken!=null&&twitter!=null){
        	   System.out.println("��� ������ �����߽��ϴ�.");

        	   
        System.out.println(" session.setAttribute('req', token)�� ���۵Ǿ����ϴ�.:"+token);
           session.setAttribute("req", token);
    	   System.out.println("�ι�° ���ǿϷ�");

    	   request.setAttribute("reqToken", reqToken);
           
  //         if(session.getAttribute("finish")==null){
  //         response.sendRedirect("index2.do?tokenSecret="+tokenSecret+"&token="+token);
   //        }else{
        
        System.out.println("session.getAttribute('tokenSecret'):"+session.getAttribute("tokenSecret"));
        	   
     	   System.out.println(" session.setAttribute('tokenSecret', tokenSecret)�� ���۵Ǿ����ϴ�.:"+tokenSecret);
        session.setAttribute("tokenSecret", tokenSecret);
        System.out.println("session.getAttribute('tokenSecret'):"+session.getAttribute("tokenSecret"));

 	   System.out.println("ù��° ���ǿϷ�");

 	   try {
 	      Thread.sleep(1000);
 	    } catch (InterruptedException e) { }
 	   
           response.sendRedirect(reqToken.getAuthorizationURL());
     ///     }
           System.out.println("----------------------1");
           System.out.println("tokenSecret="+(String)session.getAttribute("tokenSecret"));
           System.out.println("req="+(String)session.getAttribute("req"));
           }else{
               response.sendRedirect("/index.jsp");

           }
            } else { // �������� �� �ڵ����� �Ѿ���� ����� �´�..�� ������ �ּ�â�� ���� oauth_verifier ������ ���� �ִ�.
            	System.out.println("�Ĺ������� �� ");
               oauth_token =  request.getParameter("oauth_token"); // Ʈ���Ϳ��� ���� �� �Ѿ���� �� �Ķ���Ϳ� ���� �ִ�.
               oauth_verifier = request.getParameter("oauth_verifier"); // Ʈ���Ϳ��� ���� �� �Ѿ���� �� �Ķ���Ϳ� ���� �ִ�.
               System.out.println("oauth_token: "+oauth_token);
               System.out.println("oauth_verifier: "+oauth_verifier);
               System.out.println("(String)session.getAttribute('tokenSecret'" +(String)session.getAttribute("tokenSecret"));
               AccessToken accessToken = null;
               try{
              
             //Ʈ�����ν��Ͻ�����
            Twitter twitter = new TwitterFactory().getInstance();			
			twitter.setOAuthConsumer("lqXJCLo9kxFA3rDiQZtqTJIgt", "n1TaRZnzDNVvEdsm2f5UpaXbBllCERuC9AGL78nA9a44T58LTK"); //����� consumerKey, consumerSecret
			
            System.out.println("twitter2:"+twitter);
             //Access Token ����
             
          // tokenSecret= request.getParameter("tokenSecret");
            tokenSecret=(String)session.getAttribute("tokenSecret");
             System.out.println("tokenSecret:"+tokenSecret);
             
             RequestToken requestToken=(RequestToken)session.getAttribute("reqToken");
                // accessToken ����.
             //accessToken = twitter2.getOAuthAccessToken(oauth_token,(String)session.getAttribute("tokenSecret"));
                
                System.out.println("accessToken ��������");
                System.out.println("oauth_token:"+oauth_token);
                System.out.println("tokenSecret:"+tokenSecret);
                System.out.println("requestToken:"+requestToken);
             accessToken = twitter.getOAuthAccessToken(requestToken,oauth_verifier);
             //accessToken = twitter.getOAuthAccessToken(requestToken,oauth_verifier);

             
             
             
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
                   (String)session.getAttribute("tokenSecret")=<%= (String)session.getAttribute("tokenSecret")%><br>
                   tokenSecret=<%=tokenSecret%><br>
                    
<%
             }
            
%>
</body>
</html>