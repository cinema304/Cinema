package taein.cinema.admin.statistic.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import taein.cinema.admin.statistic.domain.Search;
import taein.cinema.admin.statistic.dao.mapper.StatisticMapper;
import taein.cinema.admin.statistic.domain.Reservations;

@Repository
public class StatisticDaoImpl implements StatisticDao{
	@Autowired private StatisticMapper statisticMapper;
	
	@Override
	public List<Reservations> getUserSexRes(Search search){
		List<Reservations> tmp = statisticMapper.getUserSexRes(search);
		System.out.println(tmp);
		return statisticMapper.getUserSexRes(search);
	}
	@Override
	public List<Reservations> getNotUserSexRes(Search search){
		List<Reservations> tmp = statisticMapper.getNotUserSexRes(search);
		System.out.println(tmp);
		return statisticMapper.getNotUserSexRes(search);
	}
}
