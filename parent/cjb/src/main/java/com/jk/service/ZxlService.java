package com.jk.service;

public interface ZxlService {
    String queryAllto(String password, String username);
    
    String toShowlu(String un, String pwd);

    String addShow(String unss, String pwdss, String dianhua, String zhenname, String xuanz, String shengfenz);

    String adduserssv(String a);
}
