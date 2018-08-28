package taein.cinema.admin.statistic.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import taein.cinema.admin.statistic.dao.mapper.StatisticMapper;
import taein.cinema.admin.statistic.domain.AgeReservations;
import taein.cinema.admin.statistic.domain.GradeReservations;
import taein.cinema.admin.statistic.domain.LocalReservations;
import taein.cinema.admin.statistic.domain.MovieReservations;
import taein.cinema.admin.statistic.domain.Search;
import taein.cinema.admin.statistic.domain.SexReservations;
import taein.cinema.admin.statistic.domain.TimeReservations;
import taein.cinema.admin.statistic.domain.UserReservations;

@Repository
public class StatisticDaoImpl implements StatisticDao{
	@Autowired private StatisticMapper statisticMapper;
	
	@Override
	public List<SexReservations> getUserSexRes(Search search){
		return statisticMapper.getUserSexRes(search);
	}
	@Override
	public List<SexReservations> getNotUserSexRes(Search search){
		return statisticMapper.getNotUserSexRes(search);
	}
	@Override
	public List<LocalReservations> getLocalRes(Search search){
		return statisticMapper.getLocalRes(search);
	}
	@Override
	public List<AgeReservations> getUserAgeRes(Search search){
		return statisticMapper.getUserAgeRes(search);
	}
	@Override
	public List<AgeReservations> getNotUserAgeRes(Search search){
		return statisticMapper.getNotUserAgeRes(search);
	}
	@Override
	public List<TimeReservations> getTimeRes(Search search){
		return statisticMapper.getTimeRes(search);
	}
	@Override
	public List<MovieReservations> getMovieRes(Search search){
		return statisticMapper.getMovieRes(search);
	}
	@Override
	public UserReservations getUserRes(Search search){
		return statisticMapper.getUserRes(search);
	}
	@Override
	public UserReservations getNotUserRes(Search search){
		return statisticMapper.getNotUserRes(search);
	}
	@Override
	public List<GradeReservations> getGradeRes(Search search){
		List<GradeReservations> tmp = statisticMapper.getGradeRes(search);
		System.out.println(tmp);
		return statisticMapper.getGradeRes(search);
	}
}
