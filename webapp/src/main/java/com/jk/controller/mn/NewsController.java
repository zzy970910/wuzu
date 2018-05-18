package com.jk.controller.mn;

import com.jk.bean.wb.util.ExportExcel;
import com.jk.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.jk.bean.mn.News;
import com.alibaba.fastjson.JSON;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("news")
public class NewsController {

    @Autowired
    private NewsService newsService;

    //查询新闻(分页加条查)
    @RequestMapping("selectsnews")
    @ResponseBody
    public String queryNews(Integer page,Integer rows,News news){
        Map map = newsService.queryemp(page,rows,news);
        return JSON.toJSONString(map);
    }
    //新增
    @RequestMapping("addNews")
    @ResponseBody
    public void addNews(News news){
        newsService.addNews(news);
    }
    //删除
    @RequestMapping("deletenews")
    @ResponseBody
    public String deleteNews(Integer id){
        newsService.deleteNews(id);
        return "success";
    }
    //查询新闻根据ID
    @RequestMapping("queryNewsById")
    public String queryNewsById(Integer id,Model model){
        News news = newsService.queryNewsById(id);
        model.addAttribute("news", news);
        return "news/add";
    }
    //修改
    @RequestMapping("updateNews")
    @ResponseBody
    public String updateNews(News news){
        newsService.updateNews(news);
        return "success";
    }
    //poi
    @RequestMapping("exportXlsx")
    public  void  exportXlsx(HttpServletResponse response,HttpServletRequest request,String news) throws UnsupportedEncodingException {
        //news = new String(news.getBytes("iso-8859-1"),"utf-8");
       // response.setContentType("application/msexcel;charset=UTF-8");
        String[] rowName = news.split(",");
        String title = "新闻列表";
        List<Object[]>  datasList =new ArrayList<Object[]>();
        List<News> noticelist = newsService.queryNewsList();
        Object[] obj = null;
        for (int o = 0; o < noticelist.size(); o++) {
            obj = new Object[rowName.length];
            for (int i = 0; i < rowName.length; i++) {
                if(rowName[i].trim().equals("编号")){
                    obj[i]=noticelist.get(o).getNewsId();
                }
                if(rowName[i].trim().equals("新闻名称")){
                    obj[i]=noticelist.get(o).getNewsName();
                }
                if(rowName[i].trim().equals("发行时间")){
                    obj[i]=noticelist.get(o).getNewsTime();
                }
                if(rowName[i].trim().equals("相应内容")){
                    obj[i]=noticelist.get(o).getNewsNeirun();
                }
            }
            //System.out.println(rowName[i]);
            datasList.add(obj);
        }
        ExportExcel exportExcel=new ExportExcel(title, rowName, datasList,response);
        try {
            exportExcel.export();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
