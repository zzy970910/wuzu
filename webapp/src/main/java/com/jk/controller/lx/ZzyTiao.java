package com.jk.controller.lx;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("zzyTiao")
public class ZzyTiao {
    @RequestMapping("queryD")
    public  String queryD(){
        return "/WEB-INF/zzy/dalei";
    }
    @RequestMapping("queryX")
    public  String queryX(){
        return "/WEB-INF/zzy/xiaolei";
    }
    @RequestMapping("queryding")
    public  String queryding(){
        return "/WEB-INF/zzy/ding";
    }
    @RequestMapping("queryshang")
    public  String queryshang(){
        return "/WEB-INF/zzy/shang";
    }
}
