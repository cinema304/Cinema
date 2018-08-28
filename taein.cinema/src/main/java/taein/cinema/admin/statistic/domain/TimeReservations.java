package taein.cinema.admin.statistic.domain;

public class TimeReservations {
	private String time;
	private String resCount;
	
	public String getTime() {
		return time;
	}
	public String getResCount() {
		return resCount;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public void setResCount(String resCount) {
		this.resCount = resCount;
	}
	
	@Override
	public String toString() {
		return String.format("%s %s", time, resCount);
	}	
}
