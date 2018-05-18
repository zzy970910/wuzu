package com.jk.dao;

import com.jk.bean.ht.Label;
import com.jk.bean.lx.*;
import com.jk.bean.mn.News;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ZzyDao {


    List<Indent> getDingWhere( Indent indent);

    List<Indent> getDingPage(@Param("begin") Integer begin, @Param("end") Integer end, @Param("indent") Indent indent);

    void updateById(Integer id);

    List<Da> queryDalei();

    List queryXiao();

    List getGoodWhere(Goods good);

    List getGoodPage(@Param("begin") Integer begin, @Param("end") Integer end, @Param("good") Goods good);

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

    Goods queryShopsById(Integer id);
}
