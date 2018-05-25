package com.you.generator.core.util;

import java.io.*;
import java.util.Locale;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class Freemarker {

	public static void writeFile(String ftlPathAndName, Map<String, Object> root, String outFile) throws Exception {
		writeFile(ftlPathAndName,root,outFile,false);
	}
	public static void overWriteFile(String ftlPathAndName, Map<String, Object> root, String outFile) throws Exception {
		writeFile(ftlPathAndName,root,outFile,true);
	}

	private static void writeFile(String ftlPathAndName, Map<String, Object> root, String outFile, Boolean overWrite) throws Exception {
		Boolean flag = true;
		try {
			int index = ftlPathAndName.lastIndexOf("/");
			String ftlPath = ftlPathAndName.substring(0,index);
			String ftlName = ftlPathAndName.substring(index+1);
			File file = new File(outFile);
			if (!file.getParentFile().exists()) { // 判断有没有父路径，就是判断文件整个路径是否存在
				file.getParentFile().mkdirs(); // 不存在就全部创建
			}else if (file.exists() && file.isFile()){
				if (overWrite){
					flag = false;
					LogUtil.warn(outFile + " is overwrite.");
				}else {
					return;
				}
			}
			if (flag){
				LogUtil.info("create file:"+file.getAbsolutePath());
			}
			Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "utf-8"));
			Template template = getTemplate(ftlName, ftlPath);
			template.process(root, out); // 模版输出
			out.flush();
			out.close();
		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}



	public static Template getTemplate(String ftlName, String ftlPath) throws Exception {
		try {
			Configuration cfg = new Configuration(); // 通过Freemaker的Configuration读取相应的ftl
			cfg.setEncoding(Locale.CHINA, "utf-8");
			cfg.setClassForTemplateLoading(Freemarker.class,ftlPath); // 设定去哪里读取相应的ftl模板文件
			Template temp = cfg.getTemplate(ftlName); // 在模板文件目录中找到名称为name的文件
			return temp;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
