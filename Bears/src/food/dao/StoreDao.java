package food.dao;

import java.util.List;
import com.ibatis.sqlmap.client.SqlMapClient;
import food.util.ServiceUtil;
import food.vo.StoreVo;

public class StoreDao {
	private static SqlMapClient sqlMapper;
	static {
		sqlMapper = ServiceUtil.getSqlMap();
	}
	// select * from store;
	public static List<StoreVo> selectStore() throws Exception{
		return sqlMapper.queryForList("store.selectStore");
	}
}
