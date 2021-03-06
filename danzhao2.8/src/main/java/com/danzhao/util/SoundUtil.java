package com.danzhao.util;

import java.io.File;
import java.io.IOException;

import javax.sound.sampled.AudioFileFormat;
import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.UnsupportedAudioFileException;

/** * �������йصĹ����� * * @author liqiang4j */
public class SoundUtil {
    /**
     * * 将WAV格式的音频文件转换为PCM格式的文件 * * @param wavFilePath * WAV文件路径 * @throws UnsupportedAudioFileException * @throws
     * IOException
     */
    public static void wavToPcm(String wavFilePath) {
        try {
            File wavFile = new File(wavFilePath);
            AudioInputStream sourceAudioInputStream = AudioSystem.getAudioInputStream(wavFile); // 此处的转换必需是16bit的音频文件
            AudioInputStream targetAudioInputStream =
                AudioSystem.getAudioInputStream(AudioFormat.Encoding.ULAW, sourceAudioInputStream);
            String newFilePath = wavFilePath.substring(0, wavFilePath.lastIndexOf(".") + 1) + "pcm";
            AudioSystem.write(targetAudioInputStream, AudioFileFormat.Type.WAVE, new File(newFilePath));
        } catch (UnsupportedAudioFileException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /** * 获取音频文件的编码格式 * * @param wavFilePath * 音频文件格式 * @return String */
    public static String getWavFormat(String wavFilePath) {
        File wavFile = new File(wavFilePath);
        AudioInputStream ais;
        String result = "";
        try {
            ais = AudioSystem.getAudioInputStream(wavFile);
            AudioFormat af = ais.getFormat();
            result = af.toString();
        } catch (UnsupportedAudioFileException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static void main(String[] args) {
        System.out.println(SoundUtil.getWavFormat("e://wav//test.wav"));
        SoundUtil.wavToPcm("e://wav//test.wav");
    }
}