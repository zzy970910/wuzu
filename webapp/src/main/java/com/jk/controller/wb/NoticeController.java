package com.jk.controller.wb;

import com.jk.bean.wb.Notice;
import com.jk.bean.wb.util.ExportExcel;
import com.jk.service.NoticeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("notice")
public class NoticeController {
    @Resource
    private NoticeService noticeService;
    //	查询分页数据
    @RequestMapping("querynotice")
    @ResponseBody
    public Map<String, Object> queryUsersPage(Integer page ,Integer rows,Notice notice){
        Map<String, Object> map = noticeService.queryUsersPage(page , rows,notice);
        return map;
    }


    //跳新增页面
    @RequestMapping("toaddnoticelist")
    public String toaddnoticelist(){

        return "/WEB-INF/notice/addnoticelist";
    }
    //跳
    @RequestMapping("topoidaoc")
    public String topoidaoc(){

        return "/WEB-INF/notice/poidaoc";
    }

  //新增
    @RequestMapping("addnotice")
    @ResponseBody
    public void addnotice(Notice notice){
        noticeService.addnotice(notice);
    }
    //修改
    @RequestMapping("querynoticeById")
    @ResponseBody
    public ModelAndView querynoticeById(Integer noticeid){
        ModelAndView mav=new ModelAndView();
        Notice notice=noticeService.querynoticeById(noticeid);
        mav.addObject("notice", notice);
        mav.setViewName("/WEB-INF/notice/updatenotice");
        return mav;
    }
    @RequestMapping("updatenotice")
    @ResponseBody
    public void updatenotice(Notice notice){
        noticeService.updatenotice(notice);
    }
    @RequestMapping("deletenotice")
    @ResponseBody
    public String deletenotice(Integer noticeid){
        noticeService.deletenotice(noticeid);
        return "deleteSuccess";
    }

    //删除

    //批量删除
    @RequestMapping("deleteall")
    @ResponseBody
    public void deleteall(String ids){
        noticeService.deleteall(ids);
    }
    @RequestMapping("exportXlsx")
    public  void  exportXlsx(HttpServletResponse response,HttpServletRequest request,String gonggao) throws UnsupportedEncodingException {
        gonggao = new String(gonggao.getBytes("iso-8859-1"),"utf-8");
        response.setContentType("application/msexcel;charset=UTF-8");
        String[] rowName = gonggao.split(",");
        String title = "公告列表";
        //= {"编号","姓名","年龄","生日","账号","密码"};
        List<Object[]>  datasList =new ArrayList<Object[]>();
        List<Notice> noticelist = noticeService.queryUserList();
        Object[] obj = null;
        for (int o = 0; o < noticelist.size(); o++) {
            obj = new Object[rowName.length];
            for (int i = 0; i < rowName.length; i++) {
                if(rowName[i].trim().equals("编号")){
                    obj[i]=noticelist.get(o).getNoticeid();
                }
                if(rowName[i].trim().equals("公告名称")){
                    obj[i]=noticelist.get(o).getNoticename();
                }
                if(rowName[i].trim().equals("公告发行时间")){
                    obj[i]=noticelist.get(o).getNoticedate();
                }
                if(rowName[i].trim().equals("公告内容")){
                    obj[i]=noticelist.get(o).getNoticebulletin();
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
