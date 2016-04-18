package yong.index;

public class indexDTO {
	String tokenSecret;
	String token;
	
	
	
	
	public indexDTO() {
		super();
	}
	
	public indexDTO(String tokenSecret, String token) {
		super();
		this.tokenSecret = tokenSecret;
		this.token = token;
	}
	public String getTokenSecret() {
		return tokenSecret;
	}
	public void setTokenSecret(String tokenSecret) {
		this.tokenSecret = tokenSecret;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	
	

}
