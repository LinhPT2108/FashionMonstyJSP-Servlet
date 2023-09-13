package MailService;

public class MainMessage {
	private String from;
	private String reciver;
	private String subject;
	private String body;

	public MainMessage() {
		super();
	}

	public MainMessage(String from, String reciver, String subject, String body) {
		super();
		this.from = from;
		this.reciver = reciver;
		this.subject = subject;
		this.body = body;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	

	public String getReciver() {
		return reciver;
	}

	public void setReciver(String reciver) {
		this.reciver = reciver;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	@Override
	public String toString() {
		return "from=" + getFrom() +", "+ "to=" + getReciver() +", " +"subject=" + getSubject() +", "+ "body=" + getBody(); 
	}
}
