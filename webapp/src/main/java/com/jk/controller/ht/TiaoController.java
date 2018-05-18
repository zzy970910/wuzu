package com.jk.controller.ht;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("tiao")
public class TiaoController {

    //跳转批次查询页面
    @RequestMapping("jumpShowBatch")
    public String jumpShowBatch(){
        return "WEB-INF/batch/Batch";
    }
    //跳转批次新增页面
    @RequestMapping("jumpAddBatch")
    public String jumpAddBatch(){
        return "WEB-INF/batch/addbatch";
    }
    //跳转批次修改页面
    @RequestMapping("jumpUpdateBatch")
    public String jumpUpdateBatch(){
        return "WEB-INF/batch/updatebatchlist";
    }
    //跳转标签查询页面
    @RequestMapping("jumpShowLabel")
    public String jumpShowLabel(){
        return "WEB-INF/label/label";
    }
    //跳转标签新增页面
    @RequestMapping("jumpAddLabel")
    public String jumpAddLabel(){
        return "WEB-INF/label/addlabel";
    }
    //跳转标签修改页面
    @RequestMapping("jumpUpdateLabel")
    public String jumpUpdateLabel(){
        return "WEB-INF/label/updatelabellist";
    }



}
