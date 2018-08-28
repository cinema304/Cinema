package taein.cinema.admin.statistic.domain;

public class Search {
	private int ageSeaStart;
	private int ageSeaEnd;
	private String timeSea;
	private String movieSea;
	private String localSea;
	private String timeStart;
	private String timeEnd;
	
	public String getMovieSea() {
		return movieSea;
	}
	public void setMovieSea(String movieSea) {
		this.movieSea = movieSea;
	}
	public String getTimeSea() {
		return timeSea;
	}
	public void setTimeSea(String timeSea) {
		this.timeSea = timeSea;
	}
	public int getAgeSeaStart() {
		return ageSeaStart;
	}
	public int getAgeSeaEnd() {
		return ageSeaEnd;
	}
	public void setAgeSeaStart(int ageSeaStart) {
		this.ageSeaStart = ageSeaStart;
	}
	public void setAgeSeaEnd(int ageSeaEnd) {
		this.ageSeaEnd = ageSeaEnd;
	}
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
