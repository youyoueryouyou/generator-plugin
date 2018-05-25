package com.you.generator.core.model;

/**
 * Created by shicz on 2018/5/24.
 */
public class FieldModel {
    private String jdbcName;
    private String jdbcType;
    private String javaName;
    private String upperName;
    private String javaType;
    private Boolean isPrimary;

    public Boolean getIsPrimary() {
        return isPrimary;
    }

    public void setIsPrimary(Boolean isPrimary) {
        this.isPrimary = isPrimary;
    }

    public String getJavaName() {
        return javaName;
    }

    public void setJavaName(String javaName) {
        this.javaName = javaName;
    }

    public String getJavaType() {
        return javaType;
    }

    public void setJavaType(String javaType) {
        this.javaType = javaType;
    }

    public String getJdbcName() {
        return jdbcName;
    }

    public void setJdbcName(String jdbcName) {
        this.jdbcName = jdbcName;
    }

    public String getJdbcType() {
        return jdbcType;
    }

    public void setJdbcType(String jdbcType) {
        this.jdbcType = jdbcType;
    }

    public String getUpperName() {
        return upperName;
    }

    public void setUpperName(String upperName) {
        this.upperName = upperName;
    }

    @Override
    public String toString() {
        return "FieldModel{" +
                "isPrimary=" + isPrimary +
                ", jdbcName='" + jdbcName + '\'' +
                ", jdbcType='" + jdbcType + '\'' +
                ", javaName='" + javaName + '\'' +
                ", upperName='" + upperName + '\'' +
                ", javaType='" + javaType + '\'' +
                '}';
    }
}
