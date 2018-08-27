package taein.cinema.admin.statistic.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import taein.cinema.admin.statistic.domain.LocalReservations;
import taein.cinema.admin.statistic.domain.Search;
import taein.cinema.admin.statistic.dao.mapper.StatisticMapper;
import taein.cinema.admin.statistic.domain.SexReservations;

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
}
