<%@page import="twitter4j.auth.AccessToken"%>
<%@page import="twitter4j.auth.RequestToken"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="twitter4j.*" %>
<%
final String CONSUMER_KEY = "2Z088a9h7ywCyWrs7iylv4nYY"; //APP��� �� ���� consumer key
final String CONSUMER_SECRET = "YBKw9mMJOTNEb2WSFsnrIKNChrCSq29IGvhFR0g173TQmUmlK6"; //APP��� �� ���� consumer secret
//Ʈ���� �ν��Ͻ� ����
Twitter twitter = new TwitterFactory().getInstance();
//Ű ���
twitter.setOAuthConsumer(CONSUMER_KEY, CONSUMER_SECRET);
//���� ��û ��ū ����
RequestToken reqToken = null;
AccessToken accessToken;
reqToken = twitter.getOAuthRequestToken();
String tokenSecret = reqToken.getTokenSecret();
String token = reqToken.getToken();
//CallBack ���������� �̿��ϱ� ���Ͽ� ��ū ��й�ȣ�� ���ǿ� �����Ѵ�.
session.setAttribute("tokenSecret",accessToken.getTokenSecret());
//���� URL ���� (�̰� Ŭ���ϸ�, Ʈ���� ���� �������� �Ѿ��.
out.write("<a href='" + reqToken.getAuthorizationURL() + "'>Ʈ���������ϱ�</a>");
%>