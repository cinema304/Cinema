package taein.cinema.admin.statistic.domain;

public class MovieReservations {
	private String movie;
	private String resCount;
	
	public String getMovie() {
		return movie;
	}
	public String getResCount() {
		return resCount;
	}
	public void setMovie(String movie) {
		this.movie = movie;
	}
	public void setResCount(String resCount) {
		this.resCount = resCount;
	}
	
	@Override
	public String toString() {
		return String.format("%s %s", movie, resCount);
	}	
}
