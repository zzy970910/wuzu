package com.jk.dao;

import com.jk.bean.mn.LiuYan;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LiuYanDao {

    Integer queryTotal();

    List<LiuYan> selectsLiuYan(@Param("pages") Integer pages, @Param("rows") Integer rows);

    void deleteLiuYan(Integer id);
}
