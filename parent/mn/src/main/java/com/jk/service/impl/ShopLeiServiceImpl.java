package com.jk.service.impl;

import com.jk.bean.lx.Da;
import com.jk.bean.lx.Xiao;
import com.jk.dao.ShopLeiDao;
import com.jk.service.ShopLeiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShopLeiServiceImpl implements ShopLeiService {
    @Autowired
    private ShopLeiDao shopLeiDao;

    @Override
    public void addDaLei(Da da) {
        shopLeiDao.addDaLei(da);
    }

    @Override
    public void deleteDaLei(Integer id) {
        shopLeiDao.deleteDaLei(id);
    }

    @Override
    public Da queryDaById(Integer id) {

        return shopLeiDao.queryDaById(id);
    }

    @Override
    public void updateDa(Da da) {
        shopLeiDao.updateDa(da);
    }

    @Override
    public List<Da> queryda() {

        return  shopLeiDao.queryda();
    }

    @Override
    public void addXiaoLei(Xiao xiao) {
        shopLeiDao.addXiaoLei(xiao);
    }

    @Override
    public void deleteXiaoLei(Integer id) {
        shopLeiDao.deleteXiaoLei(id);
    }

    @Override
    public Xiao queryXiaoById(Integer id) {

        return shopLeiDao.queryXiaoById(id);
    }

    @Override
    public void updateXiao(Xiao xiao) {
        shopLeiDao.updateXiao(xiao);
    }
}
