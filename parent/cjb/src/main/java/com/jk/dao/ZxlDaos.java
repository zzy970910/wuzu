package com.jk.dao;

import com.jk.pojo.User;
import com.jk.pojo.ZxlHouTaiDenglu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ZxlDaos {
    List<ZxlHouTaiDenglu> queryAllto();

    void addShow( @Param("unss")String unss,  @Param("pwdss")String pwdss,  @Param("dianhua")String dianhua,
                       @Param("zhenname") String zhenname, @Param("xuanz") String xuanz, @Param("shengfenz") String shengfenz);

    List<User> addqueryAllto(@Param("un")String un);

    List<User> querlto();
}
