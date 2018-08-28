package taein.cinema.admin.statistic.domain;

public class UserReservations {
	private String user;
	private String resCount;
	
	public String getUser() {
		return user;
	}
	public String getResCount() {
		return resCount;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public void setResCount(String resCount) {
		this.resCount = resCount;
	}

	@Override
	public String toString() {
		return String.format("%s %s", user, resCount);
	}	
}
