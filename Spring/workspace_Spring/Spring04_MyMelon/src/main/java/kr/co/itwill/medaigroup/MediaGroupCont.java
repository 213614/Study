package kr.co.itwill.medaigroup;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MediaGroupCont {
	
	// ↓ 이미 만들어진 객체를 끌어다 쓸때 필수로 적어야하는 어노테이션(없으면 찾지 못하므로 new로 새로 객체생성을 해야 사용가능하다)
	@Autowired
	private MediaGroupDAO dao;
	
	public MediaGroupCont() {
		System.out.println("--------MediaGroupCont() 객체 생성");
	}// default constructor
	
	
	// 미디어 그룹 쓰기 페이지 호출하는 명령어 등록
	// 결과 확인 http://localhost:9095/mediagroup/create.do
	@RequestMapping(value="/mediagroup/create.do", method = RequestMethod.GET)
	public String createForm() {
		return "/mediagroup/createForm";
	}//create() end
	
	
	// Post 방식의 /mediagroup/create.do : 전송 방식이 다르면 같은 이름의 명령어라도 각기 다른 명령어로 인식한다
	@RequestMapping(value="/mediagroup/create.do", method = RequestMethod.POST)
	public ModelAndView createProc(@ModelAttribute MediaGroupDTO dto) {
								// 받아야하는 양이 많으면 dto, 별로 없으면 request
		
		ModelAndView mav = new ModelAndView();
		
		int cnt = dao.create(dto);
		if (cnt == 0) {
			mav.setViewName("/mediagroup/msgView");
			
			String msg1 = "<p>미디어 그룹 등록 실패</p>";
			String img = "<img src='../images/fail.png'>";
			String link1 = "<input type='button' value='다시시도' onclick='javascript:history.back()'>";
			String link2 = "<input type='button' value='그룹목록' onclick=\"location.href='list.do'\">";
			
			mav.addObject("msg1", msg1);
			mav.addObject("img", img);	
			mav.addObject("link1", link1);
			mav.addObject("link2", link2);
			
		}else {
			mav.setViewName("redirect:/mediagroup/list.do");
		}//if end
		
		
		
		return mav;
	}//create() end
	
	/* ①. 페이징 없는 list
	// list.do 명령어 등록 
	@RequestMapping("/mediagroup/list.do")
	public ModelAndView list() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mediagroup/list");
		
		int totalRowCount = dao.totalRowCount(); 	// 총 글(행)개수 → rs.next처럼 쓰임 : count가 0이면 게시글없음/1이면 보여줌
		List<MediaGroupDTO> list = dao.list();		// 글 전체 목록
		
		mav.addObject("list", list);
		mav.addObject("count",totalRowCount);
		
		return mav;
	}//li() end
	*/
	
	// ②. 페이징 있는 list
	// 결과 확인 http://localhost:9095/mediagroup/list.do
	@RequestMapping("/mediagroup/list.do")
	public ModelAndView list(HttpServletRequest req) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mediagroup/list");
		int totalRowCount = dao.totalRowCount(); 	// 총 글(행)개수
		
		// 페이징
		int numPerPage = 5; 	// 한 페이지에 띄울 글 총 개수
		int pagePerBlock = 10; 	// 페이지 리스트 : 한줄에 페이지 1번~10번까지만 띄우겠다
		
		String pageNum = req.getParameter("pageNum");		// 현재 페이지값 받아오기 
		if(pageNum == null) { 
			pageNum = "1"; 		// 현재 페이지로 넘어오는 값이 없다면 = 1페이지를 띄운다 
		}//if end
		
		int currentPage = Integer.parseInt(pageNum);			// 현재 페이지
		int startRow 	= (currentPage-1) * numPerPage + 1;		// 한 페이지 글 목록에서 시작하는 행
		int endRow		= currentPage * numPerPage; 			// 한 페이지 글 목록에서 끝나는 행
		
		// 페이지 수 
		double totcnt = (double)totalRowCount/numPerPage;		// 전체 페이지 수 (전체글개수 / 5개)
		int totalPage = (int)Math.ceil(totcnt);					// Math.ceil : 소수점 올림
		
		double d_page = (double)currentPage/pagePerBlock;		// 현재 페이지 넘버 / 전체 페이지 수
		int Pages = (int)Math.ceil(d_page)-1;					// 페이지 목록을 하나로 묶음? (1-10 목록은 1, 11-20 목록은 2)
		int startPage = Pages*pagePerBlock;						// 페이지 목록(ex 1~10번페이지 / 11~20번 페이지)에서 시작하는 페이지 넘버 (10개씩이면 1,11,21···.)
		int endPage = startPage + pagePerBlock + 1 ;			// 페이지 목록에서 마지막 페이지 넘버 (10개씩이면 10,20,30···.)
		
		
		List<MediaGroupDTO> list = null;
		if(totalRowCount>0) {	
			list = dao.list(startRow, endRow);  // count가 0이면 게시글없음, 1 이상이면 목록 보여줌
		} else {
			list = Collections.EMPTY_LIST;		// 빈 list로 만들어주는 클래스 
		}//if end 
		
		
		// 주석은 불필요한 코드들
		//int number = 0;
		//number = totalRowCount - (currentPage-1) * numPerPage;
		
		//mav.addObject("number",  number);
		mav.addObject("pageNum",  pageNum);
		//mav.addObject("startRow", startRow);
		//mav.addObject("endRow",   endRow);
		mav.addObject("count",    totalRowCount);
		//mav.addObject("pageSize", pagePerBlock);
		mav.addObject("totalPage", totalPage);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage",   endPage);
		mav.addObject("list", list);
		
		
		return mav;		
	}//li() end
	
}//class end
