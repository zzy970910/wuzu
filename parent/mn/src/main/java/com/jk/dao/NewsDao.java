package com.jk.dao;

import com.jk.bean.mn.News;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NewsDao {
    //查询总条数
    Integer queryTotal(News news);
    //分页条件查询
    List<News> queryNews(@Param("pages") Integer pages, @Param("rows")Integer rows, @Param("news")News news);
    //新增新闻
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
