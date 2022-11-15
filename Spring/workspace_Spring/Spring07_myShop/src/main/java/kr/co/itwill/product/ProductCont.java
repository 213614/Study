package kr.co.itwill.product;

import java.io.File;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/product")
public class ProductCont {

	public ProductCont() {
		System.out.println("---------- ProductCont() 객체 생성");
	}// end
	
	@Autowired
	ProductDAO produtcDAO;
	
	/* → HomeController에 동일한 내용이 있어서 주석처리 : 있으면 오류남
	@RequestMapping("/")
	public String home() {
		return "redirect:product/list";
	}//home() end
	*/
	
	// http://localhost:9095/product/list
	@RequestMapping("/list")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("product/list");
		mav.addObject("list", produtcDAO.list());
		
		return mav;
	}//list() end
	
	
	@RequestMapping("/write")
	public String write() {
		return "product/write";
	}//write() end
	
	@RequestMapping("/insert")
	public String insert (  @RequestParam Map<String, Object> map
			               ,@RequestParam MultipartFile img
			               ,HttpServletRequest req ) {
		
		// ※ 파일 업로드시 파일명 리네임 되지않음! 
		
		// 업로드된 파일을 /storage폴더에 물리적 저장
		String filename = "-";
		long filesize = 0;			// filesize 칼럼 추가
		
		if(img != null && !img.isEmpty()) {			// 첨부된 파일이 존재한다면
			filename = img.getOriginalFilename();
			filesize = img.getSize();
			
			try {
					ServletContext application = req.getSession().getServletContext();
					String path = application.getRealPath("/storage");	// 실제 물리적 경로
					//System.out.println(path);
					img.transferTo(new File(path + "\\" + filename));	// 파일 저장
					//								 ↑ 하나만 적으면 서식으로 인식하니까 두개 적어줘야 경로 역슬래쉬로 인식!
					
			}catch (Exception e) {
				e.printStackTrace();				// = System.out.println(e);
			}//try end
		}//if end
		
		map.put("filename", filename);
		map.put("filesize", filesize);
		
		produtcDAO.insert(map);
		
		return "redirect:/product/list";
	}//insert() end
	
	
	@RequestMapping("/search")
	public ModelAndView search(@RequestParam(defaultValue = "") String product_name) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("product/list");
		mav.addObject("list", produtcDAO.search(product_name));
		mav.addObject("product_name", product_name);
		
		return mav;
	}//search() end
	
	
	@RequestMapping("/detail/{product_code}")
	public ModelAndView detail (@PathVariable String product_code) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("product/detail");
		mav.addObject("product", produtcDAO.detail(product_code));
		
		return mav;
	}//detail() end
	
	
	
	@RequestMapping("/update")
	public String update (	@RequestParam Map<String, Object> map
						   ,@RequestParam MultipartFile img
						   ,HttpServletRequest req ) {
		
		String filename = "-";
		Long filesize = (long) 0;			// filesize 칼럼 추가
		
		if(img != null && !img.isEmpty()) {			// 첨부된 파일이 존재한다면
			filename = img.getOriginalFilename();
			filesize = img.getSize();
			
			try {
					ServletContext application = req.getSession().getServletContext();
					String path = application.getRealPath("/storage");	// 실제 물리적 경로
					//System.out.println(path);
					img.transferTo(new File(path + "\\" + filename));	// 파일 저장
					//								 ↑ 하나만 적으면 서식으로 인식하니까 두개 적어줘야 경로 역슬래쉬로 인식!
					
			}catch (Exception e) {
				e.printStackTrace();				// = System.out.println(e);
			}//try end
		} else {
					String product_code = map.get("product_code").toString();
					Map<String, Object> product = produtcDAO.detail(product_code);
					filename = product.get("FILENAME").toString();
					filesize = (Long) product.get("FILESIZE");
		}//if end
		
		map.put("filename", filename);
		map.put("filesize", filesize);
		
		produtcDAO.update(map);
		
		return "redirect:/product/list";		
	}//update() end
	
	
	@RequestMapping("/delete")
	public String delete(int product_code, HttpServletRequest req) {
		
		String filename = produtcDAO.filename(product_code);	// storage에서 파일 삭제
		if(filename != null && !filename.equals("-")) {
			ServletContext application = req.getSession().getServletContext();
			String path = application.getRealPath("/storage");	// 실제 물리적 경로
			
			File file = new File(path + "\\" + filename);
			if(file.exists()) {
				file.delete();
			}//if end
		}//if end
		
		produtcDAO.delete(product_code);	// DB에서 행 삭제
		
		return "redirect:/product/list";	
	}//delete() end
	
	
	
	
	
}// class end
