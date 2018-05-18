package com.jk.service.impl;

import com.jk.dao.ZxlDaos;

import com.jk.pojo.User;
import com.jk.pojo.ZxlHouTaiDenglu;
import com.jk.service.ZxlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Service
public class ZxlServiceimpl implements ZxlService{

    @Autowired
    private ZxlDaos zxlDaos;


        //登陆
        public String queryAllto(String password, String username) {

            List<ZxlHouTaiDenglu> list;
            //查询用户信息
            list = zxlDaos.queryAllto();
            System.out.print("lkihhh2222"+list.toString());
            if(list.size() >0){
                for (int i = 0; i<list.size(); i++){
                    if(list.get(i).getHoutailonginname().equals(username)){
                        if(list.get(i).getHoutailonginpwd().equals(password)){

                            System.out.print("---"+list.get(i).getHoutailonginpwd()+"-----"+list.get(i).getHoutailonginname());
                            return "成功";
                        }else{
                            return "用户或密码错误";

                        }
                    }else if(list.get(i).getShoujihao().equals(username)){
                        if(list.get(i).getHoutailonginpwd().equals(password)){

                            System.out.print("---"+list.get(i).getHoutailonginpwd()+"-----"+list.get(i).getHoutailonginname());
                            return "成功";
                        }else{
                            return "用户或密码错误";

                        }
                    }
                }

            }
            return "用户或密码错误";
        }



    public String toShowlu(String un, String pwd) {

        RequestAttributes ra = RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = ((ServletRequestAttributes)ra).getRequest();

        List<User> list;
        list = zxlDaos.querlto();
        if(list.size() >0){
            for (int i = 0; i<list.size(); i++){
                if(list.get(i).getLoginname()!=null &&list.get(i).getLoginname().equals(un)){
                    System.out.print(list.get(i).getUserpwd());
                    if(list.get(i).getUserpwd()!=null &&list.get(i).getUserpwd().equals(pwd)){
                       request.getSession().setAttribute("user",list.get(i));
                        return "成功";
                    }else{
                        return "户名或密码错误";

                    }
                }else if(list.get(i).getTelphone()!=null &&list.get(i).getTelphone()!=null&&list.get(i).getTelphone().equals(un)){
                    if(list.get(i).getUserpwd().equals(pwd)){
                        request.getSession().setAttribute("id",list.get(i).getUserid());
                        return "成功";
                    }else{
                        return "用户或密码错误";

                    }
                }
            }

        }
        return "用户或密码错误";
    }

    public String addShow(String unss, String pwdss, String dianhua, String zhenname, String xuanz, String shengfenz) {
        List<User> list;
        //查询用户信息
        list = zxlDaos.addqueryAllto(unss);
        if(list.size()>0){
            return "用户名已存在";
        }else{
             zxlDaos.addShow(unss,pwdss,dianhua,zhenname,xuanz,shengfenz);
            return "成功";
        }
    }

}