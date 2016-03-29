<%@page import="twitter4j.auth.AccessToken"%>
<%@page import="twitter4j.auth.RequestToken"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="twitter4j.*" %>
<%
final String CONSUMER_KEY = "2Z088a9h7ywCyWrs7iylv4nYY"; //APP등록 후 받은 consumer key
final String CONSUMER_SECRET = "YBKw9mMJOTNEb2WSFsnrIKNChrCSq29IGvhFR0g173TQmUmlK6"; //APP등록 후 받은 consumer secret
//트위터 인스턴스 생성
Twitter twitter = new TwitterFactory().getInstance();
//키 등록
twitter.setOAuthConsumer(CONSUMER_KEY, CONSUMER_SECRET);
//인증 요청 토큰 생성
RequestToken reqToken = null;
AccessToken accessToken;
reqToken = twitter.getOAuthRequestToken();
String tokenSecret = reqToken.getTokenSecret();
String token = reqToken.getToken();
//CallBack 페이지에서 이용하기 위하여 토큰 비밀번호를 세션에 저장한다.
session.setAttribute("tokenSecret",accessToken.getTokenSecret());
//인증 URL 생성 (이걸 클릭하면, 트위터 인증 페이지로 넘어간다.
out.write("<a href='" + reqToken.getAuthorizationURL() + "'>트위터인증하기</a>");
%>