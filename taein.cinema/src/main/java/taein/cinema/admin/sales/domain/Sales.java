package taein.cinema.admin.sales.domain;

public class Sales {
	private String movieName;
	private int sales;
	
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	
	@Override
	public String toString() {
		return String.format("%s %s", movieName, sales);
	}	
}
