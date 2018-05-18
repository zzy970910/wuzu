package com.jk.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.jk.bean.ht.Batch;
import com.jk.bean.ht.Label;
import com.jk.dao.BatchDao;
import com.jk.service.BatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BatchServiceImpl implements BatchService {


         @Autowired
         private BatchDao batchDao;


    @Override
    public JSONObject selectbatch(Batch batch, int page, int rows, String bname)  {
        if(bname!=null){
            bname="%"+bname+"%";
        }
        // TODO Auto-generated method stub
        //查询总记录数
        long total=batchDao.batchCount(batch,bname);
        //计算开始条数和结束条数
        int start=(page-1)*rows;
        List<Batch> stulist=batchDao.selectbatch(batch,start,rows,bname);

        JSONObject json=new JSONObject();
        json.put("total", total);
        json.put("rows", stulist);

        return json;
    }

    @Override
    public void addBatchList(Batch batch) {
        batchDao.addBatchList(batch);
    }

    @Override
    public void deleteBatch(Integer id) {
        batchDao.deleteBatch(id);
    }

    @Override
    public void updateBatch(Batch batch) {
        batchDao.updateBatch(batch);
    }
}
