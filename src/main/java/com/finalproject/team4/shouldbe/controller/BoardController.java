package com.finalproject.team4.shouldbe.controller;

import com.finalproject.team4.shouldbe.service.BoardService;
import com.finalproject.team4.shouldbe.util.UriUtil;
import com.finalproject.team4.shouldbe.vo.BoardVO;
import com.finalproject.team4.shouldbe.vo.PagingVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class BoardController {
    @Autowired
    BoardService boardService;

/*    @Autowired
    BoardService service;
    @RequestMapping(value = "/board/free", method = RequestMethod.GET)
    public String freeBoard(Model model, @ModelAttribute("pVO") PagingVO pVO) { */
    //var temp = service.boardPageList();
    //System.out.println(temp);
        /*try {
            // Fetch the records based on the parameters in pVO
            pVO.setTotalRecord(service.totalRecordAuth(pVO));

            List<BoardVO> communityItems = service.boardPageList(pVO);
            model.addAttribute("list", communityItems);

            // Add all the search and sort parameters to the model to be used in the frontend
            model.addAttribute("page", pVO.getNowPage());
            model.addAttribute("searchKey", pVO.getSearchKey());
            model.addAttribute("searchWord", pVO.getSearchWord());
            model.addAttribute("category", pVO.getCategory());
            model.addAttribute("postSort", pVO.getPostSort());

            // Add the generated URI for search and sort to the model
            model.addAttribute("uri", getUri(pVO));
            model.addAttribute("pVO", pVO);

        } catch (Exception e) {
            // Optionally: Log the exception or handle it accordingly
            e.printStackTrace();
        }*/
        /*return "board/board_list";
    }*/

    private String getUri(PagingVO pVO) {
        int page = pVO.getNowPage();
        String searchType = pVO.getSearchKey();
        String keyword = pVO.getSearchWord();
        String category = pVO.getBoard_cat(); // Fetch category info
        String postSort = pVO.getPostSort(); // Fetch sort option

        return UriUtil.makeSearch(page, searchType, keyword, category, postSort);
    }

    @GetMapping({"/board/free", "/board/notice", "/board/inquiries"})
    public ModelAndView board(HttpServletRequest request, PagingVO pVO) {
        //System.out.println("before : "+ pVO);
        ModelAndView mav = new ModelAndView();
        var boardCat = parseCategory(request.getRequestURI());
        //board category setting
        pVO.setBoard_cat(boardCat);
        //총레코드 수
        pVO.setTotalRecord(boardService.totalRecord(pVO));
        //DB선택(page, 검색)
        List<BoardVO> list = boardService.boardPageList(pVO);
        mav.addObject("list", list);
        mav.addObject("pVO", pVO);
        mav.setViewName("board/board_list");
        return mav;
    }

    @GetMapping({"/board/free/write", "/board/notice/write", "/board/inquiries/write"})
    public ModelAndView write(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        var boardCat = parseCategory(request.getRequestURI());
        mav.setViewName("board/board_write");
        mav.addObject("category", boardCat);
        return mav;
    }

    @PostMapping({"/board/free/writeOk", "/board/notice/writeOk", "/board/inquiries/writeOk"})
    public String writeOk(HttpServletRequest request, HttpSession session, BoardVO bVO) {
        var boardCat = parseCategory(request.getRequestURI());
        bVO.setBoard_cat(boardCat);
        bVO.setUser_id((String) session.getAttribute("logId"));
        int result = boardService.boardInsert(bVO);
        System.out.println("result : " + result);
        return "redirect:/board/" + boardCat;

    }


    @GetMapping({"/board/free/view", "board/notice/view", "board/inquiries/view"})
    public ModelAndView view(int no) {
        ModelAndView mav = new ModelAndView();
        boardService.viewCount(no);
        var vo = boardService.boardSelect(no);
        mav.addObject("vo", vo);
        System.out.println(vo);
        //mav.addObject("pVO", pVO);
        mav.setViewName("board/board_view");

        return mav;
    }


    @GetMapping({"/board/free/edit", "/board/notice/edit", "/board/inquiries/edit"})
    public ModelAndView edit(int no) {
        ModelAndView mav = new ModelAndView();
        var vo = boardService.boardSelect(no);
        mav.addObject("vo", vo);
        mav.setViewName("board/board_edit");
        System.out.println();

        return mav;
    }

    public String parseCategory(String requestUri) {
        String[] params = requestUri.split("/");
        return params[2];
    }


}
