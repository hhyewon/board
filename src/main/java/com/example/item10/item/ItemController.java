package com.example.item10.item;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
//@RequestMapping("/item")
@RequestMapping("")
public class ItemController {

    protected static final Logger logger = LoggerFactory.getLogger(ItemController.class);

    @Autowired
    private ItemService itemService;

    @RequestMapping("/list")
    public String getList(HttpServletResponse response, HttpSession session, Model model, RedirectAttributes redirectAttributes
            , @RequestParam Map<String, Object> param,
                          @PathVariable(value = "pageNum", required = false) Integer pageNum) throws Exception {

        if (pageNum == null) pageNum = 1;

        model.addAttribute("param", param); //파라미터 전달
        model.addAttribute("columns", itemService.getPage(pageNum, param)); //select 요소 가져오기
        logger.error("columns: " + itemService.getPage(pageNum, param));
        logger.error("param: " + param);

        return "index/index";
    }

    @RequestMapping({"/list/page/{pageNum}", "/list/page/"})
    @ResponseBody
    public Map<String, Object> getPage(HttpServletResponse response, HttpSession session, Model model,
                                       @RequestParam Map<String, Object> param,
                                       @PathVariable(value = "pageNum", required = false) Integer pageNum) throws Exception {

        if (pageNum == null) pageNum = 1;
        logger.error("pageNum: " + pageNum);

        return itemService.getPage(pageNum, param);
    }

    @RequestMapping("/insert")
    public String postBoardForm(HttpServletResponse response, HttpSession session, Model model, RedirectAttributes redirectAttributes, @RequestParam Map<String, Object> param) throws Exception {
        return "index/post";
    }

    @RequestMapping("/insertProc")
    public String postBoard(HttpServletResponse response, HttpSession session, Model model, RedirectAttributes redirectAttributes, @RequestParam Map<String, Object> param) throws Exception {

        Map<String, Object> data = itemService.postList(param);
        model.addAttribute("data", data);
        logger.error("data: " + data);

        return "redirect:/list";
    }

    @RequestMapping("/detail/{board_seq}")
    public String detailList(HttpSession session, HttpServletRequest request, Model model, @RequestParam Map<String, Object> param,
                             @PathVariable(value = "board_seq", required = false) Integer board_seq) throws Exception {

        model.addAttribute("detail", itemService.detailList(param, board_seq));
        logger.error("detail.data:" + itemService.detailList(param, board_seq));

        return "index/detail";
    }

    @RequestMapping("/update/{board_seq}")
    public String updateListForm(HttpSession session, HttpServletRequest request, Model model, @RequestParam Map<String, Object> param,
                                 @PathVariable(value = "board_seq", required = false) Integer board_seq) throws Exception {
        model.addAttribute("detail", itemService.detailList(param, board_seq));
        return "index/update";
    }

    @RequestMapping("/updateProc")
    public String updateList(HttpServletRequest request, HttpSession session, Model model, RedirectAttributes redirectAttributes, @RequestParam Map<String, Object> param) throws Exception {
        Map<String, Object> data = itemService.updateList(param);
        model.addAttribute("data", data);
        return "redirect:/list";
    }

    @RequestMapping("/delete/{board_seq}")
    public String deleteList(HttpSession session, HttpServletRequest request, Model model, @RequestParam Map<String, Object> param,
                             @PathVariable(value = "board_seq", required = false) Integer board_seq) throws Exception {

        Map<String, Object> data = itemService.deleteList(board_seq);
        model.addAttribute("data", data);

        return "redirect:/list";
    }
}


    //        @RequestMapping({"/list/page/{pageNum}", "/list/page"})
//        @ResponseBody
//        public String getList(HttpServletResponse response, HttpSession session, Model model, RedirectAttributes redirectAttributes
//                , @RequestParam Map<String, Object> param
//                , @PathVariable(value = "pageNum", required = false) Integer pageNum) throws Exception {
//
//            if(pageNum == null){
//                pageNum = 1;
//            }
//
//            model.addAttribute("param", param); //파라미터 전달
//            model.addAttribute("columns", itemService.getList(pageNum,param)); //select 요소 가져오기
//            logger.error("param: " +param);
//            logger.error("columns: " + itemService.getList(pageNum,param));
//            logger.error("pageNum: "+ pageNum);
//            return "index/index";
//        }



