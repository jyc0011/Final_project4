package com.finalproject.team4.shouldbe.controller;


import com.finalproject.team4.shouldbe.service.ReplyService;
import com.finalproject.team4.shouldbe.vo.BoardReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BoardReplyController {
    @Autowired
    ReplyService replyService;

    @GetMapping("/boardReply/list")
    @ResponseBody
    public List<BoardReplyVO> replyList(int no){
        //댓글 데이터
        var rVOList = replyService.replyList(no);

        //System.out.println(rVOList);
        return rVOList;
    }
    @PostMapping("/boardReply/add")
    @ResponseBody
    public Map<String, Object> addReply(HttpSession session, BoardReplyVO rVO){
        System.out.println(rVO);
        var map = new HashMap<String, Object>();
        if("Y".equals((String)session.getAttribute("logStatus"))){
            var id = (String)session.getAttribute("logId");
            rVO.setWriter(id);
            System.out.println(rVO);
            rVO.setDepth(0);
            int result = replyService.addReply(rVO);
            if(result>0) {

                map.put("result", true);
                return map;
            }


        }
        map.put("result", false);
        return map;
    }
    @PostMapping("/boardReply/delete")
    @ResponseBody
    public Map<String, Object> deleteReply(HttpSession session, int replyNo, int postNo){

        var map = new HashMap<String, Object>();
        var reply = replyService.selectReply(postNo, replyNo);
        if(reply.getWriter().equals((String)session.getAttribute("logId"))){
            int result = replyService.deleteReply(postNo, replyNo);
            if(result>0) {
                map.put("result", true);
                return map;
            }
        }
        map.put("result", false);
        return map;
    }
    @PostMapping("/boardReply/report")
    @ResponseBody
    public Map<String, Object> report(HttpSession session, int no){
        var map = new HashMap<String, Object>();
        if("Y".equals((String)session.getAttribute("logStatus"))){
            var id = (String)session.getAttribute("logId");

            int result = replyService.report(no, id);
            if(result>0){
                map.put("result", true);
                return map;
            }
            map.put("result", false);
            map.put("msg", "db오류");

        }
        map.put("result", false);
        map.put("message", "로그인해주세요.");
        return map;
    }

    @PostMapping("/boardReply/like")
    @ResponseBody
    public Map<String, Object> like(HttpSession session, int no){
        var map = new HashMap<String, Object>();
        if("Y".equals((String)session.getAttribute("logStatus"))){
            var id = (String)session.getAttribute("logId");

            int result = replyService.like(no, id);
            if(result>0){
                map.put("result", true);
                return map;
            }
            map.put("result", false);
            map.put("msg", "db오류");

        }
        map.put("result", false);
        map.put("message", "로그인해주세요.");
        return map;
    }
}
