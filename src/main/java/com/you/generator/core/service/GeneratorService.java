package com.you.generator.core.service;

import com.you.generator.core.model.ConfigModel;
import com.you.generator.core.model.FieldModel;
import com.you.generator.core.model.GeneratorModel;
import com.you.generator.core.util.Freemarker;
import com.you.generator.core.util.JdbcUtil;
import com.you.generator.core.util.StringUtil;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by shicz on 2018/5/22.
 */
public class GeneratorService {
    private ConfigModel config;
    private Map<String,Object> rootMap = new HashMap<String, Object>();
    public static GeneratorService getInstnace(){
        return  new GeneratorService();
    }

    private void getTableInfo() throws Exception{
        JdbcUtil jdbcUtil = JdbcUtil.getInstance();
        jdbcUtil.getConnection(config.getJdbcUrl(), config.getJdbcUser(), config.getJdbcPassword());
        String sql = "DESCRIBE " + config.getTableName();
        List<Map<String, Object>> list = jdbcUtil.executeQuery(sql);
        jdbcUtil.closeConnection();
        GeneratorModel generatorModel = new GeneratorModel();
        List<FieldModel> fieldModels = new ArrayList<FieldModel>();
        for (Map<String, Object> map : list)
        {
            FieldModel model = new FieldModel();
            model.setJdbcName(map.get("COLUMN_NAME").toString());
            model.setJdbcType(map.get("COLUMN_TYPE").toString());
            String column_key = map.get("COLUMN_KEY").toString();
            model.setIsPrimary(StringUtil.isNotEmpty(column_key));
            model.setJavaName(StringUtil.getFieldNameByDb(model.getJdbcName()));
            model.setUpperName(StringUtil.getFirstUpperName(model.getJavaName()));
            model.setJavaType(StringUtil.dbTypeToJavaType(model.getJdbcType()));
            if (model.getIsPrimary()){
                generatorModel.setPrimaryId(model.getJdbcName());
                generatorModel.setPrimaryName(model.getJavaName());
                generatorModel.setPrimaryType(model.getJavaType());
                generatorModel.setPrimaryUpper(model.getUpperName());
            }
            fieldModels.add(model);
        }
        generatorModel.setFields(fieldModels);
        generatorModel.setModelUpperName(StringUtil.getFirstUpperName(config.getModelName()));
        generatorModel.setModelLowerName(StringUtil.getFirstLowerName(config.getModelName()));
        generatorModel.setTableName(config.getTableName());
        generatorModel.setGroupName(config.getGroupName());
        if (StringUtil.isEmpty(generatorModel.getPrimaryId()) || StringUtil.isEmpty(generatorModel.getPrimaryName())){
            throw new Exception("table:"+config.getTableName() + " primaryKey not exists.");
        }
        rootMap.put("root",generatorModel);
        rootMap.put("config",config);
    }
    private void generator() throws Exception{
        if (rootMap.size() == 0){
            throw new Exception("rootMap is empty.");
        }
        String ftlPath = "/freemarker/";
        String groupPath = "src"+File.separator+"main"+File.separator+"java"+File.separator+config.getGroupName().replace(".",File.separator);
        String resPath = "src"+File.separator+"main"+File.separator+File.separator+"resources";
        String api_path = config.getProjectPath() + File.separator + config.getModuleName() + "-api" + File.separator + groupPath + File.separator;
        String provider_path = config.getProjectPath() + File.separator + config.getModuleName() + "-provider" + File.separator + groupPath + File.separator;
        String resource_path = config.getProjectPath() + File.separator + config.getModuleName() + "-provider" + File.separator + resPath + File.separator;
        Freemarker.overWriteFile(ftlPath+"bean.ftl",rootMap,api_path+"bean"+File.separator+config.getModelName()+"Bean.java");
        Freemarker.writeFile(ftlPath+"model.ftl",rootMap,api_path+"model"+File.separator+config.getModelName()+"Model.java");
        Freemarker.writeFile(ftlPath+"api.ftl",rootMap,api_path+"api"+File.separator+config.getModelName()+"Api.java");
        Freemarker.writeFile(ftlPath+"hystric.ftl",rootMap,api_path+"hystric"+File.separator+config.getModelName()+"Hystric.java");
        Freemarker.overWriteFile(ftlPath+"condition.ftl",rootMap,provider_path+"condition"+File.separator+config.getModelName()+"Condition.java");
        Freemarker.writeFile(ftlPath+"serviceInter.ftl",rootMap,provider_path+"service"+File.separator+config.getModelName()+"Service.java");
        Freemarker.writeFile(ftlPath+"serviceImpl.ftl",rootMap,provider_path+"service"+File.separator+"impl"+File.separator+config.getModelName()+"ServiceImpl.java");
        Freemarker.writeFile(ftlPath+"controller.ftl",rootMap,provider_path+"controller"+File.separator+config.getModelName()+"Controller.java");
        Freemarker.writeFile(ftlPath+"mapper.ftl",rootMap,provider_path+"mapper"+File.separator+config.getModelName()+"Mapper.java");
        Freemarker.writeFile(ftlPath+"mybatis.ftl",rootMap,resource_path+"mybatis"+File.separator+config.getModelName()+"Mapper.xml");
      }
    public void main(ConfigModel config) throws Exception{
        this.config = config;
        getTableInfo();
        generator();
    }
}
