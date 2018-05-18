package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.bean.ht.Label;

public interface LabelService {


    JSONObject selectlabel(Label label, int page, int rows, String labelname) throws Exception;


    void addLabel(Label label);


    void deleteLabel(Integer labelid);

    void updateLabel(Label label);
}
