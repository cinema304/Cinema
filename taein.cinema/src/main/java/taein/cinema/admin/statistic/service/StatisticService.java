package taein.cinema.admin.statistic.service;

import java.util.List;

import taein.cinema.admin.statistic.domain.AgeReservations;
import taein.cinema.admin.statistic.domain.GradeReservations;
import taein.cinema.admin.statistic.domain.LocalReservations;
import taein.cinema.admin.statistic.domain.MovieReservations;
import taein.cinema.admin.statistic.domain.Search;
import taein.cinema.admin.statistic.domain.SexReservations;
import taein.cinema.admin.statistic.domain.TimeReservations;
import taein.cinema.admin.statistic.domain.UserReservations;

public interface StatisticService {
	List<SexReservations> getSexRes(Search search);    //성별 예매율 통계
	List<LocalReservations> getLocalRes(Search search);    //지역별 예매율 통계
	List<AgeReservations> getAgeRes(Search search);   //연령별 예매율 통계	
	List<AgeReservations> getAgeVolRes(Search search);   //연령별 예매율(각각)	
	List<TimeReservations> getTimeRes(Search search);  //시간별 예매율 통계
	List<MovieReservations> getMovieRes(Search search);  //영화별 예매율 통계
	List<UserReservations> getUserRes(Search search);  //예매 회원비율 통계
	List<GradeReservations> getGradeRes(Search search);  //영화별 평점 통계
}
