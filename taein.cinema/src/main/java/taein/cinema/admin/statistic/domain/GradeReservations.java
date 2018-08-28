package taein.cinema.admin.statistic.domain;

public class GradeReservations {
	private String movie;
	private Integer grade;

	public String getMovie() {
		return movie;
	}
	public Integer getGrade() {
		return grade;
	}
	public void setMovie(String movie) {
		this.movie = movie;
	}
	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return String.format("%s %s", movie, grade);
	}	
}
