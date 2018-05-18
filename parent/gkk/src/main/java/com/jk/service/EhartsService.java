package com.jk.service;

import java.util.List;

import com.jk.bean.lx.Da;
import com.jk.bean.lx.Goods;
import com.jk.bean.lx.Indent;
import com.jk.bean.lx.Xiao;

public interface EhartsService {

    List<Indent> quertEcharts();

    List<Da> daOption();

    List<Xiao> xiaoOption(Integer id);

    String addShop(Goods goods);

    String deleteShop(String strid);
}
