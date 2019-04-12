package com.danzhao.util;

import java.util.Random;

public class CodeUtil {

	public static String createCode(){
    	Random rad=new Random();  
        String result  = rad.nextInt(1000000) +"";  
        if(result.length()!=6){  
            return createCode();  
        }
        return result;
    }
}
