package com.spring.view.board;

import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.biz.board.BoardService;
import com.spring.biz.board.MovieBoardVO;
import com.spring.biz.util.PageDTO;
import com.spring.biz.util.SearchCriteria;
import com.spring.biz.movie.ContentsDetailVO;
import com.spring.biz.movie.ContentsVO;
import com.spring.biz.movie.SearchVO;
import com.spring.biz.util.getContentInfo;
import com.spring.biz.util.getInfoUtil;
import com.spring.biz.util.getSearchUtil;


@Controller
public class MovieController {
	
	@Autowired
	private BoardService boardService;
	
	
	
	public class SortByDate implements Comparator<ContentsVO> {
		@Override
		public int compare(ContentsVO o1, ContentsVO o2) {
			Date first = o1.getRelease_date();
			Date second = o2.getRelease_date();
			return second.compareTo(first);
		}
	}
	
	public class SortByLike implements Comparator<MovieBoardVO> {
		@Override
		public int compare(MovieBoardVO l1, MovieBoardVO l2) {
			Integer first = l1.getLike_num();
			Integer second = l2.getLike_num();
			return second.compareTo(first);
		}
	}
	
	public class SortByVote implements Comparator<SearchVO> {
		@Override
		public int compare(SearchVO o1, SearchVO o2) {
			Float first = o1.getPopularity();
			Float second = o2.getPopularity();
			return second.compareTo(first);
		}
	}
	
	@RequestMapping(value="testMovie.do")
	public String main(@RequestParam(value = "type", defaultValue = "movie") String contents_type, Model model, SearchCriteria cri) {

		// 영화 정보를 불러오는 클래스 (이전 글에서 설명한 데이터 파싱 전용 클래스)
		getInfoUtil util = new getInfoUtil();
        
		List<ContentsVO> release_date = util.getInfoList(contents_type);
 
		// List에 담긴 ContentsVO를 날짜 내림차순으로 정렬
//		Collections.sort(release_date,new SortByDate());

		
		model.addAttribute("release_date", release_date); // 최신 공개 순
		
		
		
		
//		if (cri.getSearchCondition() == null) {
//			cri.setSearchCondition("TITLE");
//		}
//		if (cri.getSearchKeyword() == null) {
//			cri.setSearchKeyword("");
//		}
		
//		System.out.println("TotalPage : " + pageMaker.getTotalPage());
//		System.out.println("StartPage : " + pageMaker.getStartPage());
//		System.out.println("EndPage : " + pageMaker.getEndPage());
		
		model.addAttribute("boardList", boardService.getBoardListMain(cri));	// Model 정보 저장
//		model.addAttribute("boardList", boardService.getBoardList(vo));	// Model 정보 저장
		
		return "index.jsp";
	}
	
	@RequestMapping(value = "ContentsDetail.do")
	public String Detail(@RequestParam(value = "type") String contents_type,Model mode,@RequestParam(value = "id") int contents_num,ContentsDetailVO vo) {
		getContentInfo info = new getContentInfo();
		
		mode.addAttribute("info",info.getjsonObjectInfo(contents_type, contents_num));
		return "testDetail.jsp";
	}
	
	@RequestMapping(value = "search.do")
	   public String searsch(@RequestParam(value = "SC")String searchCondition,Model model,String searchKeyword, MovieBoardVO vo) {
	    if(searchCondition.equals("review"))  {
	    	
	    	List<MovieBoardVO> result = boardService.getSearchReview(vo);
	    	Collections.sort(result, new SortByLike());
	    	model.addAttribute("result", result);
	    	return "searchReviewTest.jsp";
	    	
	    }else {
	    	
		getSearchUtil search = new getSearchUtil();
	         List<SearchVO> result = search.getInfoList(searchCondition, searchKeyword);
	         Collections.sort(result, new SortByVote());
	         model.addAttribute("result", result);
	    }
	      return "searchTest.jsp";
	   }
}
