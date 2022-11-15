package kr.co.itwill.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/comment")
public class CommentCont {

	public CommentCont() {
		System.out.println("---------- CommentCont() 객체 생성");
	}//end
	
	@Autowired
	CommentDAO commentDAO;
	

	@ResponseBody
	@RequestMapping("/insert")
	private int mCommentServiceInsert( @RequestParam int pno
									  ,@RequestParam String content) {
									  // ↑ 내용이 많지 않아서 DTO로 받아와도됨
		CommentDTO comment = new CommentDTO();
		comment.setPno(pno);
		comment.setContent(content);
		// 로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용(session.getAttribute("s_id");)
		// 여기선 따로 폼을 구현 안했기때문에 임시로 "Test"설정 
		comment.setWname("Test");
		
		return commentDAO.commentInsert(comment);
	}//Insert() end
	
	
	@ResponseBody		// = 리턴값 그대로 반환해주세요
	@RequestMapping("/list")
	private List<CommentDTO> mCommentServiceList( @RequestParam int pno,
												  Model model) throws Exception{
												// ↑ 모델은 안써도 문제되지않는다 (ModelAndView의 부모)
		return commentDAO.commentlist(pno);
	}//mCommentServiceList() End

	
	@ResponseBody
	@RequestMapping("/update")
	private int mCommentServiceUpdateProc ( @RequestParam int cno
										   ,@RequestParam String content) throws Exception {
		CommentDTO comment = new CommentDTO();
		comment.setCno(cno);
		comment.setContent(content);
		
		return commentDAO.commentUpdate(comment);
	}//mCommentServiceUpdateProc() end
	
	@ResponseBody
	@RequestMapping("/delete/{cno}")
	private int mCommentServiceDelete (@PathVariable int cno) throws Exception {
		return commentDAO.commentDelete(cno);
	}//mCommentServiceDelete() end
	
}//class end
