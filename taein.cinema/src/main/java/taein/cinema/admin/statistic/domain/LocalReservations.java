package taein.cinema.admin.statistic.domain;

public class LocalReservations {
	private String local;
	private String resCount;
	
	public String getLocal() {
		return local;
	}
	public String getResCount() {
		return resCount;
	}
	public void setLocal(String local) {
		this.local = local;
	}
	public void setResCount(String resCount) {
		this.resCount = resCount;
	}

	@Override
	public String toString() {
		return String.format("%s %s", local, resCount);
	}	
}
