package com.jk.service.impl;

import com.jk.bean.wb.Notice;
import com.jk.dao.NoticeDao;
import com.jk.service.NoticeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class NoticeServiceImpl implements NoticeService{
    @Resource
    private NoticeDao noticeDao;


    public Map<String, Object> queryUsersPage(Integer page, Integer rows,Notice notice) {

        long tot = noticeDao.queryUserCount();
        List<Notice> uss = noticeDao.queryUsersPage((page-1)*rows,rows,notice);

        Map<String, Object> map = new HashMap();
        map.put("total", tot);
        map.put("rows", uss);
        return map;
    }

    public void addnotice(Notice notice) {
        DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date =new Date();
        String noticedate=format.format(date);
        notice.setNoticedate(noticedate);
        noticeDao.addnotice(notice);
    }

    public Notice querynoticeById(Integer noticeid) {
        return noticeDao.querynoticeById(noticeid);
    }

    public void updatenotice(Notice notice) {
        noticeDao.updatenotice(notice);
    }

    public void deletenotice(Integer noticeid) {
        noticeDao.deletenotice(noticeid);
    }

    public void deleteall(String ids) {
        noticeDao.deleteall(ids);
    }

    public List<Notice> queryUserList() {

        return noticeDao.queryUserList();
    }

    public List findEmpl() {
        return noticeDao.findEmpl();
    }

}
