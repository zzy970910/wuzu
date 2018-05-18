package com.jk.service;

import java.util.Map;

public interface LiuYanService {

    Map selectsLiuYan(Integer page, Integer rows);

    void deleteLiuYan(Integer id);
}
