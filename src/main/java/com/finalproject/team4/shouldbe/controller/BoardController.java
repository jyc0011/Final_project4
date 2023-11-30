package com.finalproject.team4.shouldbe.controller;

import com.finalproject.team4.shouldbe.vo.PagingVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class BoardController {

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
    @GetMapping("/board")
    public String freeBoard(Model model, @ModelAttribute("pVO") PagingVO pVO) {
        return "board/board_list";
    }

    @GetMapping("/board/notice")
    public String noticeBoard(Model model, @ModelAttribute("pVO") PagingVO pVO) {
        return "board/board_list";
    }

    @GetMapping("/board/resources")
    public String resourcesBoard(Model model, @ModelAttribute("pVO") PagingVO pVO) {
        return "board/board_list";
    }

    @GetMapping("/board/inquiries")
    public String inquiriesBoard(Model model, @ModelAttribute("pVO") PagingVO pVO) {
        return "board/board_list";
    }

    @GetMapping("/board/free/view")
    public String view() {
        return "board/board_view";
    }

    @GetMapping("/board/write")
    public String write() {
        return "board/board_write";
    }

    @GetMapping("/board/edit")
    public String edit() {
        return "board/board_edit";
    }

}
