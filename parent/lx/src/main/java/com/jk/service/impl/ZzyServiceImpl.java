package com.jk.service.impl;

import com.jk.bean.ht.Label;
import com.jk.bean.lx.*;
import com.jk.bean.mn.News;
import com.jk.dao.LabelDao;
import com.jk.dao.ZzyDao;
import com.jk.service.ZzyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ZzyServiceImpl implements ZzyService {
    @Autowired
    private ZzyDao zzyDao;

    @Autowired
    private LabelDao labelDao;

    @Override
    public List<Indent> getDingWhere(Indent indent) {
        return zzyDao.getDingWhere(indent);
    }

    @Override
    public List<Indent> getDingPage(Integer page, Integer rows, Indent indent) {
        Integer begin = (page - 1) * rows;
        Integer end = rows;
        return zzyDao.getDingPage(begin,end,indent);
    }

    @Override
    public void updateById(Integer id) {
        zzyDao.updateById(id);
    }

    @Override
    public List<Da> queryDalei() {
        return zzyDao.queryDalei();
    }

    @Override
    public List queryXiao() {
        return zzyDao.queryXiao();
    }

    @Override
    public List getGoodWhere(Goods good) {
        return zzyDao.getGoodWhere(good);
    }

    @Override
    public List getGoodPage(Integer page, Integer rows, Goods good) {
        Integer begin = (page - 1) * rows;
        Integer end = rows;
        return zzyDao.getGoodPage(begin,end,good);
    }

    @Override
    public List<Da> selectda() {
        return zzyDao.selectda();
    }

    @Override
    public List<Xiao> selectxiao() {
        return zzyDao.selectxiao();
    }

    @Override
    public List<Goods> selectquanbu() {
        return zzyDao.selectquanbu();
    }

    @Override
    public List<News> queryXin() {
        return zzyDao.queryXin();
    }

    @Override
    public News xiangqing(Integer id) {
        return zzyDao.xiangqing(id);
    }

    @Override
    public List<Goods> querytejia() {
        return zzyDao.querytejia();
    }

    @Override
    public List<Goods> selectFenid(Integer id) {
        return zzyDao.selectFenid(id);
    }

    @Override
    public List<Label> querybianqian() {
        return zzyDao.querybianqian();
    }

    @Override
    public List<Goods> selectreping() {
        return zzyDao.selectreping();
    }

    @Override
    public void updateremai(Integer reid) {
        zzyDao.updateremai(reid);
    }

    @Override
    public void updatetejia(Integer id) {
        zzyDao.updatetejia(id);
    }

    @Override
    public Goods selectxiang(Integer id) {
        return zzyDao.selectxiang(id);
    }

    @Override
    public void addShop(Goods goods) {
           Integer id = goods.getId();
         Goods goods1 =  zzyDao.queryShopsById(id);
           Miao miao =new Miao();
        miao.setMimage(goods.getImage());
        miao.setId(goods1.getId());
        miao.setCount(goods1.getCount());
        miao.setMprice(goods1.getPrice());

    }


}
