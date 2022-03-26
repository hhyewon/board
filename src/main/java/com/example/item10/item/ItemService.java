package com.example.item10.item;

import com.example.item10.util.paging.Criteria;
import com.example.item10.util.paging.PageMaker;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ItemService {

    protected static final Logger logger = LoggerFactory.getLogger(ItemService.class);

    @Autowired
    private ItemMapper itemMapper;

    public Map<String,Object> getPage(int pageNum,Map<String,Object> param) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();
        PageMaker paging = new PageMaker();
        Criteria criteria = new Criteria(pageNum,10);
        paging.setCriteria(criteria);
        paging.setTotalCount(itemMapper.itemCount(param));
        param.put("criteria", criteria);
        List<Map<String,Object>> contents = itemMapper.getList(param);
        resultMap.put("paging", paging);
        resultMap.put("page_info",paging.getPageInfo());
        resultMap.put("contents",contents);
        return resultMap;
    }

    public Map<String, Object> postList (Map<String, Object> param) throws Exception{
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("param",itemMapper.postList(param));

        return resultMap;
    }

    public Map<String, Object> detailList(Map<String, Object> param, int board_seq) throws Exception{
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("param",itemMapper.detailList(param,board_seq));

        return resultMap;
    }

    public Map<String, Object> updateList (Map<String, Object> param) throws Exception{
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("param",itemMapper.updateList(param));

        return resultMap;
    }

    public Map<String, Object> deleteList (int board_seq) throws Exception{
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("param",itemMapper.deleteList(board_seq));

        return resultMap;
    }

}
