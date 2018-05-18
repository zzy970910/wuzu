package com.jk.controller.wyc;

import com.jk.bean.aop.Logs;
import com.mongodb.WriteResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/LogController")
public class LogController {

    @Autowired
    private MongoTemplate mongoTemplate;

    @RequestMapping("/queryTiaoRiZhi")
    public  String queryTiaoRiZhi(){
        return "/WEB-INF/wyc/rizhi";
    }

    @RequestMapping("/queryRiZhi")
    @ResponseBody
    public Map<String,Object> queryBookList(Integer page, Integer rows, String timestart, String timeend,String classname){

        Map<String,Object> map = new HashMap<String, Object>();

        Criteria criteria = new Criteria();
//        if(classname!=null&&!"".equals(classname)){
//
//        }
        if(timestart!=null){
            if(timestart!=null&&!"".equals(timestart)){
                if(timeend!=null&&!"".equals(timeend)){
                    criteria.and("tiem").gte(timestart).lte(timeend);
                }else{
                    criteria.and("tiem").gte(timestart);
                }
            }else if(timeend!=null&&!"".equals(timeend)){
                criteria.and("tiem").lte(timeend);
            }

        }
        // Query query = new Query();
//        LogPojo logPojo=new LogPojo();
//        //查询总条数
//        long total = mongoTemplate.count(new Query(Criteria.where("methodname").regex(logPojo.getMethodname())), LogPojo.class);
//        Query query = new Query(Criteria.where("methodname").regex(logPojo.getMethodname()));
        Query query = new Query();
        query.skip(page).limit(rows);
        query.addCriteria(criteria);
        List<Logs> list = mongoTemplate.find(query, Logs.class,"logs");
        long count = mongoTemplate.count(query,Logs.class,"logs");

        map.put("total", count);
        map.put("rows", list);

        return map;
    }


    /**
     * 功能描述: 删除日志
     * @param: [ids]
     * @return: java.lang.String
     * @auther: 王博
     * @date: 2018/5/13 21:52
     */
    @RequestMapping("/deleterizhiwb")
    @ResponseBody
    public String deleteLogs(String ids){
        String message = "success";
        List<Logs> resultList = new ArrayList<Logs>();
        String length = ids;
        WriteResult writeResult;
        int deleteNum = 0;
        Query query = new Query();
        //删除之前在log中记录当前数据总数
        int count = 0;
        count = mongoTemplate.findAll(Logs.class).size();
        System.out.println("Batch delete sentences-->Before delete ,the collection of exampleSentence total number："+count);
        //Criteria.where("id").in(sentenceIdTemp)中的参数sentenceIdTemp必须是Object,否则出现警告
        String sentenceIdTemp = ids;
        query = Query.query(Criteria.where("logId").in(sentenceIdTemp));
        writeResult = mongoTemplate.remove(query, Logs.class);
        deleteNum = writeResult.getN();
        System.out.println("Batch delete sentences-->The collection of exampleSentence total numbers that have deleted："+deleteNum);
        /*if (deleteNum < length) {
            message = "notExist";
        }*/

        return message;
    }


}
