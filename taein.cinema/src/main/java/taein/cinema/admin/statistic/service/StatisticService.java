package taein.cinema.admin.statistic.service;

import java.util.List;

import taein.cinema.admin.statistic.domain.LocalReservations;
import taein.cinema.admin.statistic.domain.Search;
import taein.cinema.admin.statistic.domain.SexReservations;

public interface StatisticService {
	List<SexReservations> getSexRes(Search search);    //성별 예매율 통계
	List<LocalReservations> getLocalRes(Search search);    //지역별 예매율 통계
}
