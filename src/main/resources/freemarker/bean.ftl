package ${root.groupName}.bean;

import com.you.base.BaseModel;
import com.you.base.Column;
import com.you.base.Table;
import java.util.Date;

/**
 * @author ${config.author}
 */
@Table("${root.tableName}")
public class ${root.modelUpperName}Bean extends BaseModel{
    <#list root.fields as p>
    <#if p.isPrimary && p.javaName == p.jdbcName>@Column(key = true)<#elseif p.isPrimary && p.javaName != p.jdbcName>@Column(value = "${p.jdbcName}", key = true)<#elseif !p.isPrimary && p.javaName == p.jdbcName>@Column<#elseif !p.isPrimary && p.javaName != p.jdbcName>@Column("${p.jdbcName}")</#if>
    private ${p.javaType} ${p.javaName};
    </#list>

    <#list root.fields as p>
    public void set${p.upperName}(${p.javaType} ${p.javaName}){
        this.${p.javaName} = ${p.javaName};
    }

    public ${p.javaType} get${p.upperName}(){
        return ${p.javaName};
    }

    </#list>

    @Override
    public String toString() {
        return "${root.modelUpperName}{" +
            <#list root.fields as p>
                <#if p_has_next == true>
                "${p.javaName}='" + ${p.javaName} + "'," +
                <#else>
                "${p.javaName}='" + ${p.javaName} + "'"
                </#if>
            </#list>
               + '}';
    }

}
