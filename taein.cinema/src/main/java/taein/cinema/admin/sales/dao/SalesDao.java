package taein.cinema.admin.sales.dao;

import java.util.List;

import taein.cinema.admin.sales.domain.Sales;
import taein.cinema.admin.sales.domain.Search;

public interface SalesDao {
	List<Sales> getMovieSales(Search saerch);
	List<Sales> getCinemaSales(Search saerch);
}
