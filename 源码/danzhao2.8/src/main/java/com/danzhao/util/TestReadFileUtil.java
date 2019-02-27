package com.danzhao.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

public class TestReadFileUtil {
	/**
	 * 获取工程的WebRoot的绝对路径
	 * @return
	 */
	String getProjectPath(){
		//得到形如"/d:/${workspace}/${projectName}/WebRoot/WEB-INF/classes/"的 路径
        String path=this.getClass().getResource("/").getPath();
        //从路径字符串中取出工程路径
        path=path.substring(1, path.indexOf("WEB-INF/classes"));
        System.out.println("工程路径："+path);
        return path;
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
//		TestReadFileUtil trf=new TestReadFileUtil();
		String xmlPath =  "D:/MyEclipse安装包及tomocat/tomacat/apache-tomcat-7.0.81/webapps/danzhao2.5/wav";
		try {
			deleteFile(xmlPath);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 读取指定路径文件夹下的所有文件
	 * @param filepath
	 * @return
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	public static boolean readAllFile(String filepath)
			throws FileNotFoundException, IOException {
		try {
			File file = new File(filepath);
			if (!file.isDirectory()) {
				System.out.println("\n文件信息：");
				System.out.println("\t相对路径=" + file.getPath());
				System.out.println("\t绝对路径=" + file.getAbsolutePath());
				System.out.println("\t文件全名=" + file.getName());
 
			} else if (file.isDirectory()) {
				System.out.println("\n文件夹内文件列表信息：");
				File[] fileList = file.listFiles();
				for (int i = 0; i < fileList.length; i++) {
					File readfile = fileList[i];
					if (!readfile.isDirectory()) {
						System.out.println("\n\t相对路径=" + readfile.getPath());
						System.out.println("\t绝对路径=" + readfile.getAbsolutePath());
						System.out.println("\t文件全名=" + readfile.getName());
					} else if (readfile.isDirectory()) {
						readAllFile(fileList[i].getPath());
					}
				}
			}
		} catch (FileNotFoundException e) {
			System.out.println("readfile()   Exception:" + e.getMessage());
		}
		return true;
	}
 
	/**
	 * 删除某个文件夹下的所有文件夹和文件
	 * @param delpath
	 * @return
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	public static boolean deleteFile(String delpath)
			throws FileNotFoundException, IOException {
		try {
			File file = new File(delpath);
			if (!file.isDirectory()) {
//				System.out.println("1");
				file.delete();
			} else if (file.isDirectory()) {
//				System.out.println("2");
				File[] fileList = file.listFiles();
				for (int i = 0; i < fileList.length; i++) {
					File delfile = fileList[i];
					if (!delfile.isDirectory()) {
//						System.out.println("相对路径=" + delfile.getPath());
//						System.out.println("绝对路径=" + delfile.getAbsolutePath());
//						System.out.println("文件全名=" + delfile.getName());
						delfile.delete();
//						System.out.println("删除文件成功");
					} else if (delfile.isDirectory()) {
						deleteFile(fileList[i].getPath());
					}
				}
//				file.delete();
			}
		} catch (FileNotFoundException e) {
			System.out.println("deletefile()   Exception:" + e.getMessage());
		}
		return true;
	}
}
