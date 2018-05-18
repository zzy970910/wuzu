package com.jk.service;

import com.jk.bean.mn.News;

import java.util.List;
import java.util.Map;

public interface NewsService {
    //条件分页查询
    Map queryemp(Integer page, Integer rows, News news);
    //新增
    void addNews(News news);
    //删除
    void deleteNews(Integer id);
    //查询新闻根据ID
    News queryNewsById(Integer id);
    //修改
    void updateNews(News news);
    //poi
    List<News> queryNewsList();
}
