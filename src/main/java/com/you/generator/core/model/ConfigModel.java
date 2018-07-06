package com.you.generator.core.model;

/**
 * Created by shicz on 2018/5/22.
 */
public class ConfigModel {
    private String jdbcUrl;
    private String jdbcUser;
    private String jdbcPassword;
    private String projectPath;
    private String groupName;
    private String moduleName;
    private String tableName;
    private String modelName;
    private String author;

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getJdbcPassword() {
        return jdbcPassword;
    }

    public void setJdbcPassword(String jdbcPassword) {
        this.jdbcPassword = jdbcPassword;
    }

    public String getJdbcUrl() {
        return jdbcUrl;
    }

    public void setJdbcUrl(String jdbcUrl) {
        this.jdbcUrl = jdbcUrl;
    }

    public String getJdbcUser() {
        return jdbcUser;
    }

    public void setJdbcUser(String jdbcUser) {
        this.jdbcUser = jdbcUser;
    }

    public String getModelName() {
        return modelName;
    }

    public void setModelName(String modelName) {
        this.modelName = modelName;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public String getProjectPath() {
        return projectPath;
    }

    public void setProjectPath(String projectPath) {
        this.projectPath = projectPath;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    @Override
    public String toString() {
        return "ConfigModel{" +
                "jdbcUrl='" + jdbcUrl + '\'' +
                ", jdbcUser='" + jdbcUser + '\'' +
                ", jdbcPassword='" + jdbcPassword + '\'' +
                ", projectPath='" + projectPath + '\'' +
                ", groupName='" + groupName + '\'' +
                ", moduleName='" + moduleName + '\'' +
                ", tableName='" + tableName + '\'' +
                ", modelName='" + modelName + '\'' +
                ", author='" + author + '\'' +
                '}';
    }
}
