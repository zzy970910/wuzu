package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.bean.ht.Batch;

public interface BatchService {


    JSONObject selectbatch(Batch batch, int page, int rows, String bname) ;

    void addBatchList(Batch batch);

    void deleteBatch(Integer id);

    void updateBatch(Batch batch);
}
