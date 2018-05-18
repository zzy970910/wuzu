package com.jk.service.impl;

import com.jk.bean.mn.News;
import com.jk.dao.NewsDao;
import com.jk.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class NewsServiceImpl implements NewsService {
    @Autowired
    private NewsDao newsDao;
    //条件加分页查询
    @Override
    public Map queryemp(Integer page, Integer rows, News news) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        Integer total = newsDao.queryTotal(news);
        Integer pages = (page-1) * rows;
        List<News> list = newsDao.queryNews(pages,rows,news);
        map.put("total", total);
        map.put("rows", list);
        return map;
    }
    //新增新闻
    @Override
    public void addNews(News news) {
        newsDao.addNews(news);
    }
    //删除
    @Override
    public void deleteNews(Integer id) {
        newsDao.deleteNews(id);
    }
    //查询新闻根据ID
    @Override
    public News queryNewsById(Integer id) {
        return newsDao.queryNewsById(id);
    }
    //修改
    @Override
    public void updateNews(News news) {
        newsDao.updateNews(news);
    }
    //poi
    @Override
    public List<News> queryNewsList() {
        return newsDao.queryNewsList();
    }


}
