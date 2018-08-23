package taein.cinema.admin.statistic.service;

import java.util.List;

import taein.cinema.admin.statistic.domain.Search;
import taein.cinema.admin.statistic.domain.Reservations;

public interface StatisticService {
	List<Reservations> getSexRes(Search search);    //성별 예매율 통계
}
