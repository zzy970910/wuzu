package com.jk.controller.cjb;

import com.jk.service.ZxlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping(value = "/zxluser")
public class ZxlController {
    @Autowired
    private ZxlService zxlService;

    //后台登陆
    @RequestMapping(value = "/toShow",produces="text/html;charset=UTF-8")
    @ResponseBody
    public String   toShow(String password,String username){
        //System.out.print("222ww"+password+"ww33"+username);
        String  fang = zxlService.queryAllto(password,username);

        return  fang;

    }

//前台注册
    @RequestMapping(value = "/addShow",produces="text/html;charset=UTF-8")
    @ResponseBody

    public String   addShow(String unss,String pwdss,String dianhua,
                            String zhenname,String xuanz,String shengfenz){


        String  fang = zxlService.addShow(unss,pwdss,dianhua,zhenname,xuanz,shengfenz);

        return  fang;

    }
    //前台登陆

    @RequestMapping(value = "/toShowlu",produces="text/html;charset=UTF-8")
    @ResponseBody
    public String   toShowlu(String un,String pwd){


        String  fang = zxlService.toShowlu(un,pwd);

        return  fang;

    }
}
