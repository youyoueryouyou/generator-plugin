package com.you.generator.core.util;

/**
 * Created by shicz on 2018/5/22.
 */
public class StringUtil {
    public static Boolean isEmpty(String content){
        return content == null || content.length() == 0;
    }

    public static Boolean isNotEmpty(String content){
        return !isEmpty(content);
    }

    public static String getFirstUpperName(String content){
        char[] chars = content.toCharArray();
        StringBuffer buffer = new StringBuffer();
        buffer.append(String.valueOf(chars[0]).toUpperCase());
        for (int i=1; i< chars.length; i++){
            String c = String.valueOf(chars[i]);
            if (i == 1){
                buffer.append(c.toLowerCase());
            }else {
                if (String.valueOf(chars[i-1]).equals(String.valueOf(chars[i-1]).toUpperCase()) && c.equals(c.toUpperCase())){
                    buffer.append(c.toLowerCase());
                }else {
                    buffer.append(c);
                }
            }
        }
        return buffer.toString();
    }

    public static String getFirstLowerName(String content){
        char[] chars = content.toCharArray();
        StringBuffer buffer = new StringBuffer();
        buffer.append(String.valueOf(chars[0]).toLowerCase());
        for (int i=1; i< chars.length; i++){
            String c = String.valueOf(chars[i]);
            if (i == 1){
                buffer.append(c.toLowerCase());
            }else {
                if (String.valueOf(chars[i-1]).equals(String.valueOf(chars[i-1]).toUpperCase()) && c.equals(c.toUpperCase())){
                    buffer.append(c.toLowerCase());
                }else {
                    buffer.append(c);
                }
            }
        }
        return buffer.toString();
    }

    public static String getModelNameByDb(String content){
        String[] temps = content.replace("_","#").replace("-","#").split("#");
        StringBuffer buffer = new StringBuffer();
        for (String temp : temps){
            buffer.append(getFirstUpperName(temp));
        }
        return buffer.toString();
    }

    public static String getFieldNameByDb(String content){
        String[] temps = content.replace("_","#").replace("-","#").split("#");
        StringBuffer buffer = new StringBuffer();
        for (int i=0;i<temps.length;i++){
            if (i == 0){
                buffer.append(getFirstLowerName(temps[i]));
            }else {
                buffer.append(getFirstUpperName(temps[i]));
            }
        }
        return buffer.toString();
    }


    public static String dbTypeToJavaType(String dbType) {
        if (dbType.startsWith("varchar")||dbType.startsWith("text") || dbType.startsWith("longtext")) {
            return "String";
        } else if (dbType.startsWith("integer") || dbType.startsWith("bigint")|| dbType.startsWith("decimal") ) {
            return "Long";
        } else if (dbType.startsWith("tinyint") || dbType.startsWith("smallint")|| dbType.startsWith("mediumint")|| dbType.startsWith("int")) {
            return "Integer";
        }else if (dbType.startsWith("double")) {
            return "Double";
        } else if (dbType.startsWith("float")) {
            return "Float";
        }else if (dbType.startsWith("date") || dbType.startsWith("time")) {
            return "Date";
        }else {
            return "String";
        }
    }
}


