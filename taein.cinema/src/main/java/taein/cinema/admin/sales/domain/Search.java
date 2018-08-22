package taein.cinema.admin.sales.domain;

public class Search {
	private String movieName;
	private String timeStart;
	private String timeEnd;
	
	public String getMovieName() {
		return movieName;
	}
	public String getTimeStart() {
		return timeStart;
	}
	public String getTimeEnd() {
		return timeEnd;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public void setTimeStart(String timeStart) {
		this.timeStart = timeStart;
	}
	public void setTimeEnd(String timeEnd) {
		this.timeEnd = timeEnd;
	}
}
