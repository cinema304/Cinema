package taein.cinema.admin.sales.service;

import java.util.List;

import taein.cinema.admin.sales.domain.Sales;
import taein.cinema.admin.sales.domain.Search;

public interface SalesService {
	List<Sales> getMovieSales(Search saerch);
}
