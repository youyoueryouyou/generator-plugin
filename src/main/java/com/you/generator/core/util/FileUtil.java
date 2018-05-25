package com.you.generator.core.util;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

/**
 * Created by shicz on 2017/12/15.
 */
public class FileUtil {

    public static boolean createDir(String destDirName) {
        File dir = new File(destDirName);
        if (dir.exists() && dir.isDirectory()) {
            return false;
        }
        if (dir.mkdirs()) {
            LogUtil.debug("create directory:" + destDirName);
            return true;
        } else {
            return false;
        }
    }

    public static void delFile(String filePath) {
        try {
            File myDelFile = new File(filePath);
            myDelFile.delete();

        } catch (Exception e) {
            LogUtil.error("delete file "+filePath + " error.");
            e.printStackTrace();

        }

    }

    public static void writeFile(String content, String fileName) {
        writeStrToFile(content,fileName,false);
    }
    public static void overWriteFile(String content, String fileName) {
        writeStrToFile(content,fileName,true);
    }

    private static void writeStrToFile(String content, String fileName, boolean flag) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(fileName, flag);
            if (flag){
                LogUtil.warn("overwrite " + fileName + "....");
            }
            writer.write(content);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if(writer != null){
                    writer.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
