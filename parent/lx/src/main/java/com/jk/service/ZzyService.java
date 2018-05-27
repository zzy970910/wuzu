package com.jk.service;

import java.util.List;

import com.jk.bean.ht.Label;
import com.jk.bean.lx.*;
import com.jk.bean.mn.News;

import javax.servlet.http.HttpServletRequest;

public interface ZzyService {


    List<Indent> getDingWhere(Indent indent);

    List<Indent>  getDingPage(Integer page, Integer rows, Indent indent);

    void updateById(Integer id);

    List<Da> queryDalei();

    List queryXiao();

    List getGoodWhere(Goods good);

    List<Indent> getGoodPage(Integer page, Integer rows, Goods good);

    List<Da> selectda();

    List<Xiao> selectxiao();

    List<Goods> selectquanbu();

    List<News> queryXin();

    News xiangqing(Integer id);

    List<Goods> querytejia();

    List<Goods> selectFenid(Integer id);

    List<Label> querybianqian();

    List<Goods> selectreping();

    void updateremai(Integer reid);

    void updatetejia(Integer id);


    Goods selectxiang(Integer id);

    List<Miao> queryMiao();

    void addGoods(Miao miao);

    List<Miao> selectMiao();

    void updateKucun(Integer id);

    Goods querygoodsbyid(Integer gid);

    void addljgm(Indent indent,Goods goods, Integer uid);

    void addGou(Integer uid, Goods good, Gou gou);

    List selectGG(Integer id);

    void deleteGwc(Integer id);

    List<Dizhi> selectAdress(Integer id);

    void addDing(Integer[] sss2, Integer[] sss, Integer id, HttpServletRequest request);

    List selectindent(Integer id);
}
