package yong.index;

import org.mybatis.spring.SqlSessionTemplate;

public class indexDAOImple implements indexDAO {
	
	//변수값설정해주고 
	SqlSessionTemplate sqlMap;
	
	public indexDAOImple(SqlSessionTemplate sqlMap){
		super();
		this.sqlMap=sqlMap;
	}
	

	@Override
	public int setDB(indexDTO dto) {
		
		int result = sqlMap.insert("add",dto);
		return result;
		
		
	}

}
