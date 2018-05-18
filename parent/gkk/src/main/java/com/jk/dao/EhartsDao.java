package com.jk.dao;

import com.jk.bean.lx.Da;
import com.jk.bean.lx.Goods;
import com.jk.bean.lx.Indent;
import com.jk.bean.lx.Xiao;

import java.util.List;

public interface EhartsDao {
    List<Indent> quertEcharts();

    List<Da> daOption();

    List<Xiao> xiaoOption(Integer id);

    int addShop(Goods goods);

    int deleteShop(List<Integer> list);
}
