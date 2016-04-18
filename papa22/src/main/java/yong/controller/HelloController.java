package yong.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.User;
import twitter4j.auth.AccessToken;
import twitter4j.auth.RequestToken;


@Controller
public class HelloController {
	
	@RequestMapping("/hello.do")
	public ModelAndView hello() throws TwitterException, IOException{
		System.out.println("start log");
		{
		Twitter twitter = TwitterFactory.getSingleton();
		twitter.setOAuthConsumer("2Z088a9h7ywCyWrs7iylv4nYY", "YBKw9mMJOTNEb2WSFsnrIKNChrCSq29IGvhFR0g173TQmUmlK6");
		RequestToken requestToken = twitter.getOAuthRequestToken();
		AccessToken accessToken = null;
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		while (null == accessToken) {
		  System.out.println("Open the following URL and grant access to your account:");
		  System.out.println(requestToken.getAuthorizationURL());
		  System.out.print("Enter the PIN(if aviailable) or just hit enter.[PIN]:");
		  String pin = br.readLine();
		  try{
		     if(pin.length() > 0){
		       accessToken = twitter.getOAuthAccessToken(requestToken, pin);
		     }else{
		       accessToken = twitter.getOAuthAccessToken();
		     }
		  } catch (TwitterException te) {
		    if(401 == te.getStatusCode()){
		      System.out.println("Unable to get the access token.");
		    }else{
		      te.printStackTrace();
		    }
		  }
		}
		//향후에 참조용으로 accessToken 을 지속시킨다.
		storeAccessToken(twitter.verifyCredentials().getId() , accessToken);
		User statuses = twitter.getUserTimeline().get(0).getUser();
		System.out.println("statuses.getName()"+statuses.getName());
		System.out.println("statuses.getId()"+statuses.getId());
		System.out.println();
		System.out.println();
		//Status status = twitter.updateStatus(args[0]);
		System.out.println("");
		System.exit(0);
		}


		
		
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", "Spring FrameWork MVC");
		mav.setViewName("hello");
		return mav;
		
	}

	private void storeAccessToken(long id, AccessToken accessToken) {
		// TODO Auto-generated method stub
		
	}


}
