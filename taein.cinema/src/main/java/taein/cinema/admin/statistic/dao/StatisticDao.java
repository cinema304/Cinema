package taein.cinema.admin.statistic.dao;

import java.util.List;

import taein.cinema.admin.statistic.domain.AgeReservations;
import taein.cinema.admin.statistic.domain.GradeReservations;
import taein.cinema.admin.statistic.domain.LocalReservations;
import taein.cinema.admin.statistic.domain.MovieReservations;
import taein.cinema.admin.statistic.domain.Search;
import taein.cinema.admin.statistic.domain.SexReservations;
import taein.cinema.admin.statistic.domain.TimeReservations;
import taein.cinema.admin.statistic.domain.UserReservations;

public interface StatisticDao {
	List<SexReservations> getUserSexRes(Search search);    //회원 성별 예매율 통계
	List<SexReservations> getNotUserSexRes(Search search); //비회원 성별 예매율 통계

	List<LocalReservations> getLocalRes(Search search);    //지역별 예매율 통계
	
	List<AgeReservations> getUserAgeRes(Search search);   //연령별 예매율 통계
	List<AgeReservations> getNotUserAgeRes(Search search);   //연령별 예매율 통계
	
	List<TimeReservations> getTimeRes(Search search);  //시간별 예매율 통계
	
	List<MovieReservations> getMovieRes(Search search);  //영화별 예매율 통계
	
	UserReservations getUserRes(Search search);  //예매 회원비율 회원 통계
	UserReservations getNotUserRes(Search search);  //예매 회원비율 비회원 통계
	
	List<GradeReservations> getGradeRes(Search search);  //영화별 평점 통계
}
