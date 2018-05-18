package com.jk.dao;

import com.jk.bean.ht.Label;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LabelDao {


    long labelCount(@Param("label")Label label,@Param("labelname") String labelname) throws Exception;

    List<Label> selectlabel(@Param("label")Label label, @Param("start")int start, @Param("rows")int rows, @Param("labelname")String labelname) throws Exception;

    void addLabel(Label label);

    void deleteLabel(Integer labelid);

    void updateLabel(Label label);
}
