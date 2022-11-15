package kr.co.itwill.comment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

// ↓ 객체 생성 필수! 잊지말자!
@Repository
public class CommentDAO {

	public CommentDAO() {
		System.out.println("---------- CommentDAO() 객체 생성");
	}//end

	// ↓ 이미 선언된 객체를 끌어다 사용하기 
	@Autowired
	SqlSession sqlSession;
	

	public int commentInsert(CommentDTO comment) {
		return sqlSession.insert("comment.insert", comment);
	}//commentInsert() end

	
	public List<CommentDTO> commentlist(int pno){
		return sqlSession.selectList("comment.list", pno);
	}//list() end
	
	
	public int commentUpdate(CommentDTO comment) {
		return sqlSession.update("comment.update", comment);
	}//update() end
	
	
	public int commentDelete(int cno) throws Exception {
		return sqlSession.delete("comment.delete", cno);
	}//delete() end
	
}//DAO end
