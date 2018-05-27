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
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;

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
                            RequestAttributes ra = RequestContextHolder.getRequestAttributes();
                            HttpServletRequest request = ((ServletRequestAttributes)ra).getRequest();
                            request.getSession().setAttribute("user1",list.get(i));
                            System.out.print("---"+list.get(i).getHoutailonginpwd()+"-----"+list.get(i).getHoutailonginname());
                            return "成功";
                        }else{
                            return "用户或密码错误";

                        }
                    }else if(list.get(i).getShoujihao().equals(username)){
                        if(list.get(i).getHoutailonginpwd().equals(password)){
                            RequestAttributes ra = RequestContextHolder.getRequestAttributes();
                            HttpServletRequest request = ((ServletRequestAttributes)ra).getRequest();
                            request.getSession().setAttribute("user1",list.get(i));
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
    //手机验证
    public String adduserssv(String a) {
        int a1 = (int) (((Math.random() * 9 + 1) * 100000));
        String fang = a1 + "";
        String phonenum = a;// 手机号

        String drugname = String.valueOf(fang);// 验证码

        System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
        System.setProperty("sun.net.client.defaultReadTimeout", "10000");
        // 初始化ascClient需要的几个参数
        final String product = "Dysmsapi";// 短信API产品名称（短信产品名固定，无需修改）
        final String domain = "dysmsapi.aliyuncs.com";// 短信API产品域名（接口地址固定，无需修改）
        // 替换成你的AK
        final String accessKeyId = "LTAIpEie8vCBdwW8";// 你的accessKeyId,参考本文档步骤2
        final String accessKeySecret = "Y8RRwR1kl1WGZ0XsjBjjggTXwboYej";// 你的accessKeySecret，参考本文档步骤2
        // 初始化ascClient,暂时不支持多region（请勿修改）
        IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId, accessKeySecret);
        try {

            DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);

        } catch (ClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        IAcsClient acsClient = new DefaultAcsClient(profile);
        // 组装请求对象
        SendSmsRequest request = new SendSmsRequest();
        // 使用post提交
        request.setMethod(MethodType.POST);
        // 必填:待发送手机号。支持以逗号分隔的形式进行批量调用，批量上限为1000个手机号码,批量调用相对于单条调用及时性稍有延迟,验证码类型的短信推荐使用单条调用的方式
        request.setPhoneNumbers(phonenum);
        // 必填:短信签名-可在短信控制台中找到
        // request.setSignName("1711");
        request.setSignName("韩苏雨");
        // 必填:短信模板-可在短信控制台中找到
        // request.setTemplateCode("SMS_128535228");
        request.setTemplateCode("SMS_128535228");
        // 可选:模板中的变量替换JSON串,如模板内容为"亲爱的${name},您的验证码为${code}"时,此处的值为
        // 友情提示:如果JSON中需要带换行符,请参照标准的JSON协议对换行符的要求,比如短信内容中包含\r\n的情况在JSON中需要表示成\\r\\n,否则会导致JSON在服务端解析失败
        request.setTemplateParam("{\"code\":\'" + fang + "\'}");
        // 可选-上行短信扩展码(扩展码字段控制在7位或以下，无特殊需求用户请忽略此字段)
        // request.setSmsUpExtendCode("90997");
        // 可选:outId为提供给业务方扩展字段,最终在短信回执消息中将此值带回给调用者
        request.setOutId("yourOutId");
        // 请求失败这里会抛ClientException异常
        SendSmsResponse sendSmsResponse = null;
        try {
            sendSmsResponse = acsClient.getAcsResponse(request);
        } catch (ServerException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        System.out.println(sendSmsResponse.getCode());
        if (sendSmsResponse.getCode() != null && sendSmsResponse.getCode().equals("OK")) {
            // 请求成功
            System.out.println("11111111111111111111111111111111111111111111111111");
        }

        return fang;


    }


}