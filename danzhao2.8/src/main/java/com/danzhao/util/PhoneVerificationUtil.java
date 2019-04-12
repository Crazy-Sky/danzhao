package com.danzhao.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.json.JSONObject;


/**
 * 发送手机验证码
 * @author Administrator
 *
 */
public class PhoneVerificationUtil {
	private static final String QUERY_PATH= "https://api.miaodiyun.com/20150822/industrySMS/sendSMS";
	private static final String ACCOUNT_SID= "b21f0f84bf2548de9fcf3779b95d7a6a";
	private static final String AUTH_TOKEN= "407eba2c011f4c58b10ce04fa767e703";
	
	//根据手机号码发送验证码
	public static String getCode(String phone){
		String random = smsCode();//验证码
		String timestamp = getTimestamp();//时间戳
		String sig = getMD5(ACCOUNT_SID, AUTH_TOKEN, timestamp);//签名
		String tamp = "【单独招生综合素质测试系统】尊敬的用户，您的验证码为" + random;//模版
		OutputStreamWriter out = null;
		BufferedReader in = null;
		StringBuilder result = new StringBuilder();
		try {
			URL realUrl = new URL(QUERY_PATH);
			URLConnection conn = realUrl.openConnection();

			// 设置连接参数
	
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded");//设置请求头信息
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setConnectTimeout(5000);
			conn.setReadTimeout(20000);

			// 提交数据
			out = new OutputStreamWriter(conn.getOutputStream(), "UTF-8");
			String body = getQueryArgs(ACCOUNT_SID, tamp, phone, timestamp, sig, "json");
			out.write(body);
			out.flush();

			// 读取返回数据
			in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			String line = "";
//			boolean firstLine = true; // 读第一行不加换行符
			while ((line = in.readLine()) != null)
			{
				result.append(line);
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		//判断是否发送成功
		JSONObject json = new JSONObject(result.toString());
		String respCode = json.getString("respCode");
		String defualtRespCode = "00000";
		if (respCode.equals(defualtRespCode)){
			return random;
		}else{
			return defualtRespCode;
		}
	}
	
	//参数拼接
	public static String getQueryArgs(String accountSid,String smsContent,String to,String timestamp,String sig,String respDataType){
		return "accountSid=" + accountSid + "&smsContent=" + smsContent + "&to=" + to + "&timestamp=" + timestamp + "&sig=" + sig + "&respDataType=" + respDataType;
	}
	
	//获取时间戳
	public static String getTimestamp(){
		return new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	}
	
	//获取sig签名
	public static String getMD5(String sid,String token,String timestamp){
		StringBuilder result = new StringBuilder();
		String source = sid + token + timestamp;
		try {
			MessageDigest digest = MessageDigest.getInstance("MD5");
			byte[] bytes = digest.digest(source.getBytes());
			for (byte b : bytes) {
				String hex = Integer.toHexString(b&0xff);
				if (hex.length() == 1){
					result.append("0" + hex);
				}else{
					result.append(hex);
				}
			}
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result.toString();
	}
	
	//创建验证码
	public static String smsCode(){
		String ran = new Random().nextInt(1000000) + "";
		if (ran.length() != 6){
			return smsCode();//递归
		}else{
			return ran;
		}
	}
}

