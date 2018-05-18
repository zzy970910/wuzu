package com.jk.service.impl;

import com.jk.bean.lx.Da;
import com.jk.bean.lx.Goods;
import com.jk.bean.lx.Indent;
import com.jk.bean.lx.Xiao;
import com.jk.dao.EhartsDao;
import com.jk.service.EhartsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class EhartsServiceImpl implements EhartsService {
    @Autowired
    private EhartsDao ehartsDao;

    @Override
    public List<Indent> quertEcharts() {

        return ehartsDao.quertEcharts();
    }

    @Override
    public List<Da> daOption() {
        return ehartsDao.daOption();
    }

    @Override
    public List<Xiao> xiaoOption(Integer id) {
        return ehartsDao.xiaoOption(id);
    }

    @Override
    public String addShop(Goods goods) {
        int in = ehartsDao.addShop(goods);
        if (in == 1){
            return "1";
        }
        return "0";
    }

    @Override
    public String deleteShop(String strid) {
        String [] sss = strid.split(",");
        List<Integer> list = new ArrayList<Integer>();
        for(int i = 0;i<sss.length;i++){
            list.add(Integer.valueOf(sss[i]));
        }
        int in = ehartsDao.deleteShop(list);
        if (in != 0){
            return "1";
        }
        return "0";
    }
}
