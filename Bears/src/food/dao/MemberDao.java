package food.dao;

import java.util.HashMap;
import java.util.List;
import com.ibatis.sqlmap.client.SqlMapClient;
import food.util.ServiceUtil;
import food.vo.MemberVo;
import food.vo.StoreVo;

public class MemberDao {
	private static SqlMapClient sqlMapper;
	static {
		sqlMapper = ServiceUtil.getSqlMap();
	}
	
	public static List<MemberVo> selectMember() throws Exception{
		return sqlMapper.queryForList("member.selectMember");
	}
	public static List<MemberVo> searchMember(HashMap<String,Object>map)throws Exception{
        return sqlMapper.queryForList("member.searchMember",map);
	}
	public static Object selectOneMember(String membername) throws Exception{
		return sqlMapper.queryForObject("member.selectOneMember", membername);
	}
	public static void deleteMember(String memberid) throws Exception{
		sqlMapper.delete("member.deleteMember", memberid);
	}
	public static int getTotalRow(HashMap<String, Object>map) throws Exception{
	      return (Integer)sqlMapper.queryForObject("member.getTotalRow", map);
	   }
}
