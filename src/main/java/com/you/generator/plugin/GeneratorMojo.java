package com.you.generator.plugin;

/*
 * Copyright 2001-2005 The Apache Software Foundation.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import com.you.generator.core.service.GeneratorService;
import org.apache.maven.plugin.AbstractMojo;
import org.apache.maven.plugin.MojoExecutionException;

import com.you.generator.core.model.ConfigModel;
import com.you.generator.core.util.StringUtil;

import java.io.File;

/**
 * Goal which touches a timestamp file.
 *
 * @goal generator
 * 
 * @phase process-sources
 */
public class GeneratorMojo extends AbstractMojo
{
    /**
     * Location of the file.
     * 
     * @parameter expression="${project.build.directory}"
     * @required
     */
    private String dbConfig;
    /**
     * Location of the file.
     *
     * @parameter expression="${project.build.directory}"
     * @required
     */
    private String projectPath;
    /**
     * Location of the file.
     *
     * @parameter expression="${project.build.directory}"
     * @required
     */
    private String groupName;
    /**
     * Location of the file.
     *
     * @parameter expression="${project.build.directory}"
     * @required
     */
    private String tableName;
    /**
     * Location of the file.
     *
     * @parameter expression="${project.build.directory}"
     * @required
     */
    private String moduleName;
    /**
     * Location of the file.
     *
     * @parameter expression="${project.build.directory}"
     * @required
     */
    private String modelName;

    /**
     * Location of the file.
     *
     * @parameter expression="${project.build.directory}"
     * @required
     */
    private String author;

    /**
     * Location of the file.
     *
     * @parameter expression="${project.build.directory}"
     * @required
     */
    private String testValue;
    
    public void execute()
        throws MojoExecutionException
    {
        ConfigModel configModel = new ConfigModel();
        if (StringUtil.isEmpty(dbConfig) || testValue.equals(dbConfig))
        {
            throw new MojoExecutionException("dbConfig not exists.");
        }
        else
        {
            String[] dbConfs = dbConfig.split("#");
            if (dbConfs.length != 3)
            {
                throw new MojoExecutionException("dbConfig is error.");
            }
            configModel.setJdbcUrl(dbConfs[0]);
            configModel.setJdbcUser(dbConfs[1]);
            configModel.setJdbcPassword(dbConfs[2]);
        }
        if (StringUtil.isEmpty(projectPath) || testValue.equals(projectPath))
        {
            throw new MojoExecutionException("projectPath not exists.");
        }
        else
        {
            File file = new File(projectPath);
            if (!file.exists()){
                throw new MojoExecutionException("projectPath directory is not exists.");
            }
            int index = projectPath.lastIndexOf(File.separator);
            configModel.setProjectPath(projectPath);
            configModel.setModuleName(projectPath.substring(index+1));

        }
        if (StringUtil.isEmpty(groupName) || testValue.equals(groupName))
        {
            throw new MojoExecutionException("groupName not exists.");
        }
        else
        {
            configModel.setGroupName(groupName);
        }
        if (StringUtil.isEmpty(tableName) || testValue.equals(tableName))
        {
            throw new MojoExecutionException("tableName not exists.");
        }
        else
        {
            configModel.setTableName(tableName);
            String model_name = StringUtil.getModelNameByDb(tableName);
            configModel.setModelName(model_name);
        }
        if (StringUtil.isNotEmpty(moduleName) && ! testValue.equals(moduleName))
        {
            configModel.setModuleName(moduleName);
        }
        if (StringUtil.isNotEmpty(modelName) && !testValue.equals(modelName))
        {
            configModel.setModelName(modelName);
        }
        if (StringUtil.isNotEmpty(author) && !testValue.equals(author))
        {
            configModel.setAuthor(author);
        }else {
            configModel.setAuthor("generator");
        }
        try {
            GeneratorService.getInstnace().main(configModel);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
