package taein.cinema.admin.sales.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import taein.cinema.admin.sales.dao.SalesDao;
import taein.cinema.admin.sales.domain.Sales;
import taein.cinema.admin.sales.domain.Search;

@Service
public class SalesServiceImpl implements SalesService{
	@Autowired private SalesDao salesDao;
	
	public List<Sales> getMovieSales(Search saerch){
		return salesDao.getMovieSales(saerch);
	}
	
	public List<Sales> getCinemaSales(Search saerch){
		return salesDao.getCinemaSales(saerch);
	}
}
