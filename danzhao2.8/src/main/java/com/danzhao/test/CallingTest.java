package com.danzhao.test;

import org.junit.Test;

import com.danzhao.util.CallingUtil;

public class CallingTest {

    @Test
    public void Test() {
        // 删除其他文件
        String deleteFileName = "*.wav";
        String deleteFilePath =
            "D:/MyEclipse安装包及tomocat/tomacat/apache-tomcat-7.0.81/webapps/danzhao2.5/wav" + "/" + deleteFileName;
        CallingUtil.deleteWav(deleteFilePath);
    }
}
