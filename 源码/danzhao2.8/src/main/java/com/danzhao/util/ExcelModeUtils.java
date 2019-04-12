package com.danzhao.util;


import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;

import javax.sound.midi.Soundbank;
import java.io.*;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Created by lzx on 2018/8/12
 */

public class ExcelModeUtils {

    // 模板路径
    private String fileLoaclPath = null;
    // 输入流
    private InputStream  inputStream = null;
    // 输入流
    private FileOutputStream outputStream = null;
    // 表格对象
    private Workbook wb = null;

    public ExcelModeUtils(){

    }
    public ExcelModeUtils(String fileLoaclPath){
        this.fileLoaclPath = fileLoaclPath;
    }

    public void setFileLoaclPath(String fileLoaclPath) {
        this.fileLoaclPath = fileLoaclPath;
    }

    /**
     *  初始化
     * @throws IOException
     */
    public void init() throws IOException {
        //inputStream =  ExcelReporter.class.getResourceAsStream("/model/" + this.fileLoaclPath);
        inputStream = new FileInputStream(new File(this.fileLoaclPath));
        if (this.fileLoaclPath.endsWith(".xlsx")){
            wb = new XSSFWorkbook(inputStream);
        }else if(this.fileLoaclPath.endsWith(".xls")){
            wb = new HSSFWorkbook(inputStream);
        }else
            throw new RuntimeException("model file format is not valid , this : " + this.fileLoaclPath + " , eg:.xlsx or xls");
    }

    /**
     *  导出excel表格
     * @param params
     * @param sheetName
     */
    public void export(List<Map<String,String>> params, String erName,String deptName,int lastIndex){
        this.insertValueToTable(wb,params,erName,deptName, lastIndex);
    }

    /**
     *  填充excel数据
     * @param wb
     * @param params
     * @param sheetName
     */
    private void insertValueToTable(Workbook wb,List<Map<String,String>> params,String erName,String deptName, int lastIndex) {
        // 获取模板中的sheet
        Sheet sheet = wb.getSheetAt(0);
        sheet.getRow(1).getCell(0).setCellValue(sheet.getRow(1).getCell(0).toString() + erName);
        sheet.getRow(2).getCell(0).setCellValue(sheet.getRow(2).getCell(0).toString() + deptName);
        for (int i = 0, len = params.size() / 50; i <= len; i++){
        	if (i * 50 == params.size() && params.size() != 0) break;
        	wb.cloneSheet(0);
        	// 设置模板页的名称
            wb.setSheetName(i + 1, erName + "(" + (i + 1) + ")");
        }
        //lastIndex = sheet.getLastRowNum();
        // 获得模板航
        Row tmpRow = sheet.getRow(lastIndex);
        // 循环遍历填充数据
        wb.removeSheetAt(0);
        sheet = wb.getSheetAt(0);
        for (int i = 0, len = params.size(); i < len; i++){
            // 获的开始填充的一行 就是模板的下一行
            int index = i+lastIndex;
            System.out.println(index);
            Map<String,String> map = params.get(i);
            // 创建新的一行
            Row row = sheet.getRow(index);
            if(row == null) {
                row = sheet.createRow(index);
            }
            // 循环便利模板行的列 获取${key}中的key
            for (int j = tmpRow.getFirstCellNum() ; j < tmpRow.getLastCellNum() ; j++){
                // 得到模板行的第j列单元格
                Cell tmpCell = tmpRow.getCell(j);
                // 获取key
                String key = tmpCell.getStringCellValue().replace("$", "").replace("{", "").replace("}", "");
                int columnindex = tmpCell.getColumnIndex();
                System.out.println(MessageFormat.format("这是第{0}行，第{1}列的key：{2}",index,columnindex,key));
                // 得到创建的一行的第j列单元格
                Cell c = row.getCell(j);
                if(c == null)
                    c = row.createCell(columnindex);
                // 填充单元格数据
                c.setCellValue(map.get(key));
            }
            if ((i +1) % 50 ==0 && (i +1) != params.size()) {
        		sheet = wb.getSheetAt((i + 1 )/ 50);
        		lastIndex -= 50;
        	}
        }
        // 删除模板行
//        sheet.shiftRows(lastIndex,tmpRow.getLastCellNum(),-1);

    }
    /**
     *  收尾方法
     * @param outDocPath
     * @return
     * @throws IOException
     */
    public boolean generate(String outDocPath) throws IOException{
        outputStream = new FileOutputStream(new File(outDocPath));
        wb.write(outputStream);
        this.close(wb);
        this.close(inputStream);
        this.close(outputStream);
        return true;
    }
    
    /**
     *  收尾方法
     * @param outDocPath
     * @return
     * @throws IOException
     */
    public Workbook getWorkbook() throws IOException{
        this.close(inputStream);
        return wb;
    }

    /**
     *  关闭Workbook
     * @param wb
     */
    private void close(Workbook wb) {
        if (wb != null) {
            try {
                wb.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    /**
     *  关闭输入流
     * @param is
     */
    private void close(InputStream is) {
        if (is != null) {
            try {
                is.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     *  关闭输出流
     * @param os
     */
    private void close(OutputStream os) {
        if (os != null) {
            try {
                os.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    
    public static void main(String[] args) throws IOException {
        // 添加假数据 这里你也可以从数据库里获取数据
    	List<Map<String, String>> list = new ArrayList<Map<String, String>>();
        for (int i =1;i <= 100; i++){
            Map<String,String> map = new HashMap<String, String>();
            map.put("id", i+"");
            map.put("prof","软件技术");
            map.put("number", "123456789"+i);
            map.put("name", "张三"+i);
            //面试
            map.put("a1", 45.5 + "");
            map.put("b1", 45.5 + "");
            map.put("c1", 45.5 + "");
            map.put("d1", 45.5 + "");
            map.put("e1", 45.5 + "");
            map.put("a2", 45.5 + "");
            map.put("b2", 45.5 + "");
            map.put("c2", 45.5 + "");
            map.put("d2", 45.5 + "");
            map.put("e2", 45.5 + "");
            map.put("a3", 45.5 + "");
            map.put("b3", 45.5 + "");
            map.put("c3", 45.5 + "");
            map.put("d3", 45.5 + "");
            map.put("e3", 45.5 + "");
            map.put("g1", 45.5 + "");
            map.put("g2", 45.5 + "");
            map.put("g3", 45.5 + "");
            map.put("gavg", 45.5 + "");
            //职业技能测试
            map.put("A1", 45.5 + "");
            map.put("B1", 45.5 + "");
            map.put("C1", 45.5 + "");
            map.put("D1", 45.5 + "");
            map.put("E1", 45.5 + "");
            map.put("A2", 45.5 + "");
            map.put("B2", 45.5 + "");
            map.put("C2", 45.5 + "");
            map.put("D2", 45.5 + "");
            map.put("E2", 45.5 + "");
            map.put("A3", 45.5 + "");
            map.put("B3", 45.5 + "");
            map.put("C3", 45.5 + "");
            map.put("D3", 45.5 + "");
            map.put("E3", 45.5 + "");
            map.put("G1", 45.5 + "");
            map.put("G2", 45.5 + "");
            map.put("G3", 45.5 + "");
            map.put("Gavg", 45.5 + "");
            //总分
            map.put("grade", 182 + "");
            list.add(map);
        }
        // 模板文件输入输出地址
        String filePath = "src/main/resources/dome.xlsx";//"E:\\项目\\danzhao\\dome.xlsx";
        String outPath = "src/main/resources/deme1.xlsx";
        // 开始导出
        ExcelModeUtils excelReporter = new ExcelModeUtils();
        excelReporter.setFileLoaclPath(filePath);
        excelReporter.init();
        excelReporter.export(list,"1504","信息技术",6);
        excelReporter.generate(outPath);

    }

}