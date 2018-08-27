package taein.cinema.admin.statistic.domain;

public class Search {
	private String localSea;
	private String timeStart;
	private String timeEnd;
	
	public String getLocalSea() {
		return localSea;
	}
	public void setLocalSea(String localSea) {
		this.localSea = localSea;
	}
	public String getTimeStart() {
		return timeStart;
	}
	public String getTimeEnd() {
		return timeEnd;
	}
	public void setTimeStart(String timeStart) {
		this.timeStart = timeStart;
	}
	public void setTimeEnd(String timeEnd) {
		this.timeEnd = timeEnd;
	}
}
