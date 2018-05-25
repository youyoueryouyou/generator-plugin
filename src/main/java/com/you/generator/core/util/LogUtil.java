package com.you.generator.core.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by shicz on 2017/12/13.
 */
public class LogUtil {
    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    public static void error(String message){
        printLog(LogLevel.ERROR,message);
    }

    public static void info(String message){
        printLog(LogLevel.INFO,message);
    }

    public static void warn(String message){
        printLog(LogLevel.WARN,message);
    }

    public static void debug(String message){
        printLog(LogLevel.DEBUG,message);
    }

    private static void printLog(LogLevel level,String message){
       String time = sdf.format(new Date());
       switch (level){
           case ERROR:
               System.err.println(time+"   ["+level.name()+"]  "+message);
               break;
           default:
               System.out.println(time+"   ["+level.name()+"]  "+message);
               break;
       }
    }

    private enum LogLevel{
        DEBUG,INFO,WARN,ERROR;
    }
}
