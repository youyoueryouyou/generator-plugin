package com.you.generator.test;

import com.you.generator.core.model.ConfigModel;
import com.you.generator.core.service.GeneratorService;

public class Test {
    public static void main(String[] args) throws Exception{
        ConfigModel configModel = new ConfigModel();

        configModel.setJdbcUrl("jdbc:mysql://localhost:3306/mybatis");
        configModel.setJdbcUser("root");
        configModel.setJdbcPassword("root");
        configModel.setProjectPath("D:\\code\\myproject\\base-project");
        configModel.setModuleName("base");
        configModel.setModelName("User");
        configModel.setGroupName("com.you.boot.cloud");
        configModel.setTableName("user");
        GeneratorService.getInstnace().main(configModel);
    }
}
