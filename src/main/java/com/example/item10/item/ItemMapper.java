package com.example.item10.item;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ItemMapper {

    public List<Map<String, Object>> getList(Map<String, Object> param) throws Exception;

    public Integer itemCount(Map<String, Object> param) throws Exception;

    public int postList(Map<String, Object> data) throws Exception;

    public Map<String, Object> detailList(Map<String, Object> param, int board_seq) throws Exception;

    public int updateList(Map<String, Object> param) throws Exception;

    public int deleteList(int board_seq) throws Exception;

}
