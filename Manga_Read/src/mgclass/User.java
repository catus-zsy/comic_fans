package mgclass;

public class User {
	int uid;
	String mail;
	String password;
	String name;
	String collect;
	String forbidden;
	
	public void setuid(int uid) {
		this.uid=uid;
	}
	public int getuid() {
		return uid;
	}
	
	public void setmail(String mail) {
		this.mail=mail;
	}
	public String getmail() {
		return mail;
	}
	
	public void setpassword(String password) {
		this.password=password;
	}
	public String getpassword() {
		return password;
	}
	
	public void setname(String name) {
		this.name=name;
	}
	public String getname() {
		return name;
	}
	
	public void setcollect(String collect) {
		this.collect=collect;
	}
	public String getcollect() {
		return collect;
	}
	
	public void setforbidden(String forbidden) {
		this.forbidden=forbidden;
	}
	public String getforbidden() {
		return forbidden;
	}
}
