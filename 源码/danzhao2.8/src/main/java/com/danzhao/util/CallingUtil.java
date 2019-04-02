package com.danzhao.util;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.danzhao.dto.StuInfoDto;

/**
 * 
 * <p>
 * Title:CallingUtil
 * </p>
 * <p>
 * Description: 呼叫工具
 * </p>
 * 
 * @author cx
 * @date 2018年11月14日
 *
 */
public class CallingUtil {

    /**
     * 
     * @Title: produceWar
     * @Description: (通过传过来的被呼叫的学生，转化成呼叫文本并生成音频 返回文件名)
     * @return fileName
     */
    public String produceWar(HttpServletRequest request, List<StuInfoDto> stus, int erid) {

        String text = "";
        if (stus.size() == 0) {
            return "";
        }

        // 生成呼叫文本
        for (StuInfoDto stu : stus) {
            char[] StuNumber = stu.getStunumber().toCharArray();
            char[] ErName = stu.getErname().toCharArray();
            String[] str = new String[] {"零", "一", "二", "三", "四", "五", "六", "七", "八", "九"};
            String StringStuNumber = "";
            String StringErName = "";
            for (int i = StuNumber.length - 4; i < StuNumber.length; i++)
                StringStuNumber += str[StuNumber[i] - '0'];
            for (int i = 0; i < ErName.length; i++)
                StringErName += str[ErName[i] - '0'];
            text += "请，考生号尾号为：" + StringStuNumber + "，" + stu.getStuname() + "同学，到考场" + StringErName + "参加考试。";

        }
        // System.out.println(text);
        String voicePath = "";
        MSTTSSpeech speech = new MSTTSSpeech();
        speech.setFormatType(4);
        // speech.speak(text);
        // speech.setRate(-1);
        /* 
         * 根据request获取项目全路径：request.getSession().getServletContext().getRealPath("/");
         *  */

        String filePath = request.getSession().getServletContext().getRealPath("/");
        File file = new File(filePath + "\\wav");
        if (!file.exists()) {// 如果文件夹不存在
            file.mkdir();// 创建文件夹
        }
        String voiceFileName = erid + "";
        for (StuInfoDto studentInfoDto : stus) {
            voiceFileName += "_" + studentInfoDto.getStuid(); // 文件名：候考室_被呼叫考生1_被呼叫考生2...
        }
        String nowTime = DatetimeUtil.getNowTimeInFile();
        voiceFileName += "_" + nowTime + ".wav";

        voicePath = file.getPath() + "\\" + voiceFileName;
        System.out.println("文件保存路径：" + voicePath);
        // 删除其他文件
        // try {
        // TestReadFileUtil.deleteFile(file.getPath() + "\\wav");
        // } catch (FileNotFoundException e) {
        // e.printStackTrace();
        // } catch (IOException e) {
        // e.printStackTrace();
        // }

        // speech.setRate(0);//在这设置声音速率
        // System.out.println("存储路径："+voicePath);
        // voicePath="D://MyEclipse安装包及tomocat//tomacat//apache-tomcat-7.0.81//webapps//danzhao2.4//wav//1.wav";
        speech.saveToWav(text, voicePath);// "e://test.wav");
        SoundUtil.wavToPcm(voicePath);
        speech.close();
        return voiceFileName;
    }

    public static void deleteWav(String filePath) {
        File file = new File(filePath);
        if (file.exists() && file.isFile()) {
            file.delete();
        }
    }

}
