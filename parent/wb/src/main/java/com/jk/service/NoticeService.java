package com.jk.service;

import com.jk.bean.wb.Notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {


    Map<String,Object> queryUsersPage(Integer page, Integer rows, Notice notice);

    void addnotice(Notice notice);

    Notice querynoticeById(Integer noticeid);

    void updatenotice(Notice notice);

    void deletenotice(Integer noticeid);

    void deleteall(String ids);

    List<Notice> queryUserList();

    List findEmpl();
}
