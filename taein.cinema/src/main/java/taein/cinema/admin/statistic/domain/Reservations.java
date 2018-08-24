package taein.cinema.admin.statistic.domain;

public class Reservations {
	private String sex;
	private Integer resCount;
	
	public String getSex() {
		return sex;
	}
	public Integer getResCount() {
		return resCount;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public void setResCount(Integer resCount) {
		this.resCount = resCount;
	}

	@Override
	public String toString() {
		return String.format("%s %s", sex, resCount);
	}	
}
