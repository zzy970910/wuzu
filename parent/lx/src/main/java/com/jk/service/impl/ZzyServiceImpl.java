package com.jk.service.impl;

import com.jk.bean.ht.Label;
import com.jk.bean.lx.*;
import com.jk.pojo.User;
import com.jk.bean.mn.News;
import com.jk.dao.LabelDao;
import com.jk.dao.ZzyDao;
import com.jk.service.ZzyService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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
    public List<Miao> queryMiao() {
        return zzyDao.queryMiao();
    }

    @Override
    public void addGoods(Miao miao) {
       Goods goods1 = zzyDao.queryShopsById(miao.getGoodid());
       miao.setGoodimage(goods1.getImage());
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        try {
            miao.setBegintime(sdf.parse(miao.getBegintimeStr()));
            miao.setEndtime(sdf.parse(miao.getEndtimeStr()));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if(miao.getBegintime().getTime() > new Date().getTime()){
            miao.setStatus("0");//未生效
        }else{
            if(miao.getEndtime().getTime() > new Date().getTime()){
                miao.setStatus("1");//生效中
            }else{
                miao.setStatus("2");//已失效
            }
        }
        zzyDao.deleteAll();
        zzyDao.addMiao(miao);
        Integer a =miao.getGoodid();
        Integer b =miao.getCount();
          zzyDao.updateId(a);
        zzyDao.updatekucun22(a,b);
    }

    @Override
    public List<Miao> selectMiao() {
        return zzyDao.selectMiao();
    }

    @Override
    public void updateKucun(Integer id) {
        zzyDao.updateKucun(id);
    }

    @Override
    public Goods querygoodsbyid(Integer gid) {
        return zzyDao.querygoodsbyid(gid);
    }


    @Override
    public void addljgm(Indent indent,Goods goods, Integer uid) {
     String uname = zzyDao.selectName(uid);
        zzyDao.addljgm(indent,goods,uid,uname);
    }

    @Override
    public void addGou(Integer uid, Goods good, Gou gou) {
        zzyDao.addGou(uid,good,gou);
    }

    @Override
    public List selectGG(Integer id) {
        return zzyDao.selectGG(id);
    }

    @Override
    public void deleteGwc(Integer id) {
        zzyDao.deleteGwc(id);
    }

    @Override
    public List<Dizhi> selectAdress(Integer id) {
        return zzyDao.selectAdress(id);
    }

    @Override
    public void addDing(Integer[] sss2, Integer[] sss, Integer id,HttpServletRequest request) {
        List<Indent> list = new ArrayList<Indent>();
        User user =(User) request.getSession().getAttribute("user");
        Date data = new Date();
        for (int i = 0;i<sss.length;i++){

            Goods goods = zzyDao.querygoodsbyid(sss[i]);
            Indent ind = new Indent();
            ind.setIndentcode(UUID.randomUUID().toString().replaceAll("-",""));
            ind.setAllprice(goods.getPrice() * sss2[i]);
            ind.setCreatetime(new SimpleDateFormat("yyyy-MM-dd").format(data).toString());
            ind.setGoodscount(sss2[i]);
            ind.setGoodsid(goods.getId());
            ind.setUserid(Integer.valueOf(user.getUserid()));
            ind.setUsername(user.getLoginname());
            ind.setDid(id);
            list.add(ind);
        }
        //购物车订单购买以后
        zzyDao.addIndentList(list);
        //删除购物车购买的商品
       //Indent indent =new Indent();
       //zzyDao.deletegwc(sss[i]);
    }


}
