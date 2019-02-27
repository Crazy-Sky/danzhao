package com.danzhao.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.io.PushbackInputStream;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import org.apache.poi.POIXMLDocument;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import freemarker.template.Configuration;
import freemarker.template.Template;

public class WordUtil {
	 
    private static Configuration configuration = null;
    private static Map<String,Template> allTemplate = null;

    static{
        configuration = new Configuration();
        configuration.setDefaultEncoding("UTF-8");
        configuration.setClassForTemplateLoading(WordUtil.class, "");
        allTemplate = new HashMap<String,Template>();
        try{
            //这里要加上你所有要初始化的.ftl文档，下面createDoc方法要引用此处的key才能找到模版
            allTemplate.put("DoorSticker", configuration.getTemplate("DoorSticker.ftl"));
        }catch(IOException e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    private WordUtil(){}

    public static File createDoc(Map<?, ?> dataMap,String type){
        String name = "temp"+(int)(Math.random()*100000)+".doc";
        File f = new File(name);
        //“test”为上面初始化的key值
        Template t = allTemplate.get("DoorSticker");
        try{
            //这个地方不能使用FileWriter因为需要指定编码类型否则声场的word文档会因为有无法识别的编码而无法打开
            Writer w = new OutputStreamWriter(new FileOutputStream(f),"utf-8");
            t.process(dataMap,w);
            w.close();
        }catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        return f;
    }
    
	public static Workbook createworkbook(InputStream inp) throws IOException,
			InvalidFormatException {
		if (!inp.markSupported()) {
			inp = new PushbackInputStream(inp, 8);
		}
		if (POIFSFileSystem.hasPOIFSHeader(inp)) {
			return new HSSFWorkbook(inp);
		}
		if (POIXMLDocument.hasOOXMLHeader(inp)) {
			return new XSSFWorkbook(OPCPackage.open(inp));
		}
		throw new IllegalArgumentException("你的excel版本目前poi解析不了");
	}

}