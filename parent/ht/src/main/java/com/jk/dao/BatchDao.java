package com.jk.dao;

import com.jk.bean.ht.Batch;
import com.jk.bean.ht.Label;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BatchDao {


    long batchCount(@Param("batch")Batch batch, @Param("bname")String bname);

    List<Batch> selectbatch(@Param("batch")Batch batch, @Param("start")int start, @Param("rows")int rows, @Param("bname")String bname);

    void addBatchList(Batch batch);

    void deleteBatch(Integer id);

    void updateBatch(Batch batch);
}
