
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
    String consumerKey = "2Z088a9h7ywCyWrs7iylv4nYY"; //"�߱޹���consumerKey "; 
    String consumerSecret = "YBKw9mMJOTNEb2WSFsnrIKNChrCSq29IGvhFR0g173TQmUmlK6"; //"�߱޹���consumeSecret"; 
    String oauth_token =  request.getParameter("oauth_token"); // Ʈ���Ϳ��� ���� �� �Ѿ���� �� �Ķ���Ϳ� ���� �ִ�.
    String oauth_verifier = request.getParameter("oauth_verifier"); // Ʈ���Ϳ��� ���� �� �Ѿ���� �� �Ķ���Ϳ� ���� �ִ�.
   
    
          // accessToken �� �߱޹��� �ʾ����� �߱��� �޴´�.
          if(oauth_verifier == null || oauth_verifier.equals("")) {   // Ʈ���� ���� �� �Ѿ�� ȭ���ΰ� �Ǵ�. ���� ����ȭ���̶��
           //Ʈ�����ν��Ͻ�����
           Twitter twitter = new TwitterFactory().getInstance();
           //Ű���
           twitter.setOAuthConsumer(consumerKey, consumerSecret);
           //������û��ū����
           RequestToken reqToken= null;
           reqToken= twitter.getOAuthRequestToken();
           String tokenSecret= reqToken.getTokenSecret();
           String token = reqToken.getToken();
           //���ǿ� ��ū ����
           session.setAttribute("reqkey", tokenSecret);
           session.setAttribute("req", token);
           
           response.sendRedirect(reqToken.getAuthorizationURL());
           System.out.println("=---------------------1");
            } else { // �������� �� �ڵ����� �Ѿ���� ����� �´�..�� ������ �ּ�â�� ���� oauth_verifier ������ ���� �ִ�.
             
             try{
              
             //Ʈ�����ν��Ͻ�����
             Twitter twitter = new TwitterFactory().getInstance();
             twitter.setOAuthConsumer(consumerKey,consumerSecret);
             //Access Token ����
             AccessToken accessToken= null;
         	System.out.println("(String)session.getAttribute('reqkey'):"+(String)session.getAttribute("reqkey"));

             
                // accessToken ����.
                accessToken = twitter.getOAuthAccessToken(oauth_token,(String)session.getAttribute("reqkey"));
            	System.out.println("accessToken"+accessToken);

             twitter.setOAuthAccessToken(accessToken);
             
             //�����ϰ� �� ������ ��������.
             //User statuses = twitter.getUserTimeline().get(0).getUser();
             //System.out.println(statuses);
             }catch(Exception e) 
             {
            	System.out.println("dd?");
                System.out.println(e+"=---------------------2");
             }
%>
                    AccessToken �߱޼���.
<%
             }
%>
</body>
</html>
 