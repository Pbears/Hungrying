package food.dao;

import java.util.HashMap;
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
	// select * from store where storename=#storename#
	public static StoreVo selectOneStore(String storename) throws Exception{
		return (StoreVo)sqlMapper.queryForObject("store.selectOneStore", storename);
	}
	
	public static List<StoreVo> searchStore(HashMap<String,Object>map)throws Exception{
        return sqlMapper.queryForList("store.searchStore",map);
	}
	
	public static int getTotalRow(HashMap<String, Object>map) throws Exception{
	      return (Integer)sqlMapper.queryForObject("store.getTotalRow", map);
	   }
	public static void deleteStore(String storename) throws Exception{
		sqlMapper.delete("store.deleteStore",storename);
	}
	
	//insert 
	public static void insertStore(StoreVo storevo) throws Exception{
		sqlMapper.insert("store.insertStore",storevo);
	}
	
	//update
	public static void updateStore(StoreVo storeVo) throws Exception{
		sqlMapper.update("store.updateStore", storeVo);
	}
	
	public static List<StoreVo> unSelectedStore() throws Exception {
		return sqlMapper.queryForList("store.unSelectedStore");
	}
	
}
