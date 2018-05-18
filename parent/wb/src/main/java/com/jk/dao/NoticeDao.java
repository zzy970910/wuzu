package com.jk.dao;

import com.jk.bean.wb.Notice;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NoticeDao {

    long queryUserCount();

    List<Notice> queryUsersPage(@Param("sti") int i, @Param("ro") int rows, @Param("notice") Notice notice);

    void addnotice(Notice notice);

    Notice querynoticeById(Integer noticeid);

    void updatenotice(Notice notice);

    void deletenotice(Integer noticeid);

    void deleteall(@Param("ids") String ids);

    List<Notice> queryUserList();

    List findEmpl();
}
