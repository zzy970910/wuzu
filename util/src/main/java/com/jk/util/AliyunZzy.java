package com.jk.util;


import com.aliyun.oss.OSSClient;
import org.springframework.web.multipart.commons.CommonsMultipartFile;



import java.io.FileInputStream;
import java.io.IOException;


import java.net.URL;
import java.util.Date;
import java.util.UUID;

public class AliyunZzy {

    public static String FileImg(CommonsMultipartFile file) throws IOException {

        System.out.println(file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")));
        FileInputStream fis = (FileInputStream) file.getInputStream();

        String newFileName = UUID.randomUUID().toString().replaceAll("-","")+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));

        String endpoint = "http://oss-cn-beijing.aliyuncs.com";

        String accessKeyId = "LTAI2ha4Zt6IKWfM";
        String accessKeySecret ="lY2MZJAi0HPyvtpVIoQqucwsvDXM1k";

        OSSClient client = new OSSClient(endpoint,accessKeyId,accessKeySecret);
        client.putObject("zzy970910","project/"+newFileName,fis);
        Date dates = new Date(System.currentTimeMillis() + 3600L * 1000 * 24 * 365 * 10);

        URL url = client.generatePresignedUrl("zzy970910","project/"+newFileName,dates);

        String fileurl = url.toString();

        client.shutdown();

        fis.close();

        return fileurl;
    }

}
