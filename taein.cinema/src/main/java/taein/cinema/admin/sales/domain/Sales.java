package taein.cinema.admin.sales.domain;

public class Sales {
	private String movieName;
	private String cinemaName;
	private Integer sales;
	
	public String getMovieName() {
		return movieName;
	}
	public String getCinemaName() {
		return cinemaName;
	}
	public Integer getSales() {
		return sales;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public void setCinemaName(String cinemaName) {
		this.cinemaName = cinemaName;
	}
	public void setSales(Integer sales) {
		this.sales = sales;
	}

	@Override
	public String toString() {
		return String.format("%s %s", cinemaName, sales);
	}	
}
