package taein.cinema.admin.statistic.dao.mapper;

import java.util.List;

import taein.cinema.admin.statistic.domain.LocalReservations;
import taein.cinema.admin.statistic.domain.Search;
import taein.cinema.admin.statistic.domain.SexReservations;

public interface StatisticMapper {
	List<SexReservations> getUserSexRes(Search search);    //회원 성별 예매율 통계
	List<SexReservations> getNotUserSexRes(Search search); //비회원 성별 예매율 통계
	
	List<LocalReservations> getLocalRes(Search search);    //지역별 예매율 통계
}
