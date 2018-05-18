package com.jk.service.impl;

import com.jk.bean.mn.LiuYan;
import com.jk.dao.LiuYanDao;
import com.jk.service.LiuYanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class LiuYanServiceImpl implements LiuYanService {
    @Autowired
    private LiuYanDao liuYanDao;

    @Override
    public Map selectsLiuYan(Integer page, Integer rows) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        Integer total = liuYanDao.queryTotal();
        Integer pages = (page-1) * rows;
        List<LiuYan> list = liuYanDao.selectsLiuYan(pages,rows);
        map.put("total", total);
        map.put("rows", list);
        return map;
    }

    @Override
    public void deleteLiuYan(Integer id) {
        liuYanDao.deleteLiuYan(id);
    }
}
