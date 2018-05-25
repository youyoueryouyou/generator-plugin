package com.you.generator.core.model;


import java.util.List;

/**
 * Created by shicz on 2018/5/24.
 */
public class GeneratorModel {
    private List<FieldModel> fields;
    private String primaryName;
    private String primaryType;
    private String primaryUpper;
    private String primaryId;
    private String modelUpperName;
    private String modelLowerName;
    private String tableName;
    private String groupName;

    public List<FieldModel> getFields() {
        return fields;
    }

    public void setFields(List<FieldModel> fields) {
        this.fields = fields;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getModelLowerName() {
        return modelLowerName;
    }

    public void setModelLowerName(String modelLowerName) {
        this.modelLowerName = modelLowerName;
    }

    public String getModelUpperName() {
        return modelUpperName;
    }

    public void setModelUpperName(String modelUpperName) {
        this.modelUpperName = modelUpperName;
    }

    public String getPrimaryId() {
        return primaryId;
    }

    public void setPrimaryId(String primaryId) {
        this.primaryId = primaryId;
    }

    public String getPrimaryName() {
        return primaryName;
    }

    public void setPrimaryName(String primaryName) {
        this.primaryName = primaryName;
    }

    public String getPrimaryType() {
        return primaryType;
    }

    public void setPrimaryType(String primaryType) {
        this.primaryType = primaryType;
    }

    public String getPrimaryUpper() {
        return primaryUpper;
    }

    public void setPrimaryUpper(String primaryUpper) {
        this.primaryUpper = primaryUpper;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    @Override
    public String toString() {
        return "GeneratorModel{" +
                "fields=" + fields +
                ", primaryName='" + primaryName + '\'' +
                ", primaryType='" + primaryType + '\'' +
                ", primaryUpper='" + primaryUpper + '\'' +
                ", primaryId='" + primaryId + '\'' +
                ", modelUpperName='" + modelUpperName + '\'' +
                ", modelLowerName='" + modelLowerName + '\'' +
                ", tableName='" + tableName + '\'' +
                ", groupName='" + groupName + '\'' +
                '}';
    }
}
