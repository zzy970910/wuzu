package com.jk.dao;

import com.jk.bean.lx.Da;
import com.jk.bean.lx.Xiao;

import java.util.List;

public interface ShopLeiDao {

    void addDaLei(Da da);

    void deleteDaLei(Integer id);

    Da queryDaById(Integer id);

    void updateDa(Da da);

    List<Da> queryda();

    void addXiaoLei(Xiao xiao);

    void deleteXiaoLei(Integer id);

    Xiao queryXiaoById(Integer id);

    void updateXiao(Xiao xiao);
}
