package taein.cinema.admin.statistic.dao.mapper;

import java.util.List;

import taein.cinema.admin.statistic.domain.Search;
import taein.cinema.admin.statistic.domain.Reservations;

public interface StatisticMapper {
	List<Reservations> getUserSexRes(Search search);    //회원 성별 예매율 통계
	List<Reservations> getNotUserSexRes(Search search); //비회원 성별 예매율 통계
}
