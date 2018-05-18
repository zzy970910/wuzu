package com.jk.controller.wb;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("dsztiao")
public class TiaoNoticeController {
    //跳转查询页面
    @RequestMapping("tiaonotice")
    public String tiaonotice(){
        return "WEB-INF/notice/noticelist2";
    }

}
