package food.dao;

import java.util.HashMap;
import java.util.List;
import com.ibatis.sqlmap.client.SqlMapClient;
import food.util.ServiceUtil;
import food.vo.MasterVo;
import food.vo.MasterVo;

public class MasterDao {
	private static SqlMapClient sqlMapper;
	static {
		sqlMapper = ServiceUtil.getSqlMap();
	}

	public static List<MasterVo> selectMaster() throws Exception {
		return sqlMapper.queryForList("master.selectMaster");
	}

	public static MasterVo selectOneMaster(String storename) throws Exception {
		return (MasterVo) sqlMapper.queryForObject("master.selectOneMaster", storename);
	}

	public static List<MasterVo> searchMaster(HashMap<String, Object> map) throws Exception {
		return sqlMapper.queryForList("master.searchMaster", map);
	}

	public static int getTotalRow(HashMap<String, Object> map) throws Exception {
		return (Integer) sqlMapper.queryForObject("master.getTotalRow", map);
	}

	public static void deleteMaster(String storename) throws Exception {
		sqlMapper.delete("master.deleteMaster", storename);
	}

	// insert
	public static void insertMaster(MasterVo Mastervo) throws Exception {
		sqlMapper.insert("master.insertMaster", Mastervo);
	}

	// update
	public static void updateMaster(MasterVo MasterVo) throws Exception {
		sqlMapper.update("master.updateMaster", MasterVo);
	}
	
	public static List<MasterVo> signUpRequest() throws Exception {
		return sqlMapper.queryForList("master.signUpRequest");
	}
	
	public MasterVo selectOne(String id) throws Exception {
		return (MasterVo)sqlMapper.queryForObject("master.selectOne",id);
	}
	
	public void denyMaster(String id) throws Exception {
		sqlMapper.delete("master.denyMaster", id);
	}
}
