package com.finalproject.team4.shouldbe.controller;

import com.finalproject.team4.shouldbe.service.BoardService;
import com.finalproject.team4.shouldbe.util.UriUtil;
import com.finalproject.team4.shouldbe.vo.BoardVO;
import com.finalproject.team4.shouldbe.vo.PagingVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

    @GetMapping({"/board/free", "/board/notice", "/board/resources", "/board/inquiries"})
    public ModelAndView board(HttpServletRequest request, PagingVO pVO) {
        ModelAndView mav = new ModelAndView();
        try {
            String[] params = request.getRequestURI().split("/");
            String boardType= params[2];
            switch (boardType) {
                case "notice":
                    pVO.setBoard_cat("notice");
                    break;
                case "free":
                    pVO.setBoard_cat("free");
                    break;
                case "resources":
                    pVO.setBoard_cat("resources");
                    break;
                case "inquiries":
                    pVO.setBoard_cat("inquiries");
                    break;
                default:
                    return null;
            }
        }catch(Exception e){
            return null;
        }

        //총레코드 수
        pVO.setTotalRecord(boardService.totalRecord(pVO));
        //DB선택(page, 검색)
        List<BoardVO> list = boardService.boardPageList(pVO);
        mav.addObject("list", list);
        mav.addObject("pVO", pVO);
        mav.setViewName("board/board_list");
        return mav;
    }

    @GetMapping({"/board/free/write", "/board/notice/write", "/board/resources/write", "/board/inquiries/write"})
    public String write(HttpServletRequest request) {
       return"board/board_write";
    }
    @PostMapping({"/board/free/writeOk", "/board/notice/writeOk", "/board/resources/writeOk", "/board/inquiries/writeOk"})
    public String writeOk(HttpServletRequest request, BoardVO bVO){
        try {
            String[] params = request.getRequestURI().split("/");
            String boardType= params[2];
            switch (boardType) {
                case "notice":
                    bVO.setBoard_cat("notice");
                    break;
                case "free":
                    bVO.setBoard_cat("free");
                    break;
                case "resources":
                    bVO.setBoard_cat("resources");
                    break;
                case "inquiries":
                    bVO.setBoard_cat("inquiries");
                    break;
                default:
                    return null;
            }
            boardService.boardInsert(bVO);
            return "redirect:/board/"+boardType;
        }catch(Exception e){
            return null;
        }
    }


    @GetMapping("/board/free/view")
    public String view() {
        return "board/board_view";
    }


    @GetMapping("/board/edit")
    public String edit() {
        return "board/board_edit";
    }

}
