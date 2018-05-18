package com.jk.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.jk.bean.ht.Label;
import com.jk.dao.LabelDao;
import com.jk.service.LabelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class LabelServiceImpl implements LabelService {

       @Autowired
       private LabelDao labelDao;


       @Override
       public JSONObject selectlabel(Label label, int page, int rows, String labelname) throws Exception{

              if(labelname!=null){
                     labelname="%"+labelname+"%";
              }
              // TODO Auto-generated method stub
              //查询总记录数
              long total=labelDao.labelCount(label,labelname);
              //计算开始条数和结束条数
              int start=(page-1)*rows;
              List<Label> stulist=labelDao.selectlabel(label,start,rows,labelname);

              JSONObject json=new JSONObject();
              json.put("total", total);
              json.put("rows", stulist);

              return json;
       }

       @Override
       public void addLabel(Label label) {
              labelDao.addLabel(label);
       }

       @Override
       public void deleteLabel(Integer labelid) {
              labelDao.deleteLabel(labelid);
       }

       @Override
       public void updateLabel(Label label) {
              labelDao.updateLabel(label);
       }
}
