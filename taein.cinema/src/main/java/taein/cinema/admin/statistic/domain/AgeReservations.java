package taein.cinema.admin.statistic.domain;

public class AgeReservations {
	private String age;
	private Integer resCount;
	
	public String getAge() {
		return age;
	}
	public Integer getResCount() {
		return resCount;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public void setResCount(Integer resCount) {
		this.resCount = resCount;
	}

	@Override
	public String toString() {
		return String.format("%s %s", age, resCount);
	}	
}
