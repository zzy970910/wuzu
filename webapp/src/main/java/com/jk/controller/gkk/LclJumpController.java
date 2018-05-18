package com.jk.controller.gkk;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("lclController")
public class LclJumpController {

    @RequestMapping("showEcharts")
    public String showEcharts(){
        return "WEB-INF/lcl/showEcharts";
    }
}
