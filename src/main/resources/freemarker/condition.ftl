package ${root.groupName}.condition;

import com.you.base.BaseCondition;
import ${root.groupName}.model.${root.modelUpperName}Model;
import java.util.Date;
import java.util.List;

/**
 * @author ${config.author}
 */
public class ${root.modelUpperName}Condition extends BaseCondition {
    public ${root.modelUpperName}Condition(${root.modelUpperName}Model model) throws Exception {
        super(model);
    }

    public ${root.modelUpperName}Condition createAnd()
    {
        setCurrentCriteria(super.and());
        return this;
    }

    public ${root.modelUpperName}Condition createOr()
    {
        setCurrentCriteria(super.or());
        return this;
    }

<#list root.fields as p>
    public ${root.modelUpperName}Condition and${p.upperName}IsNull()
    {
        getCriteria().andValueIsNull("`${p.jdbcName}`");
        return this;
    }
    
    public ${root.modelUpperName}Condition or${p.upperName}IsNull()
    {
        getCriteria().orValueIsNull("`${p.jdbcName}`");
        return this;
    }
    
    public ${root.modelUpperName}Condition and${p.upperName}IsNotNull()
    {
        getCriteria().andValueIsNotNull("`${p.jdbcName}`");
        return this;
    }
    
    public ${root.modelUpperName}Condition or${p.upperName}IsNotNull()
    {
        getCriteria().orValueIsNotNull("`${p.jdbcName}`");
        return this;
    }
    
    public ${root.modelUpperName}Condition and${p.upperName}EqualTo(${p.javaType} ${p.javaName})
    {
        getCriteria().andValueEqualTo("`${p.jdbcName}`", ${p.javaName});
        return this;
    }

    public ${root.modelUpperName}Condition or${p.upperName}EqualTo(${p.javaType} ${p.javaName})
    {
        getCriteria().orValueEqualTo("`${p.jdbcName}`", ${p.javaName});
        return this;
    }

    public ${root.modelUpperName}Condition and${p.upperName}NotEqualTo(${p.javaType} ${p.javaName})
    {
        getCriteria().andValueNotEqualTo("`${p.jdbcName}`", ${p.javaName});
        return this;
    }

    public ${root.modelUpperName}Condition or${p.upperName}NotEqualTo(${p.javaType} ${p.javaName})
    {
        getCriteria().orValueNotEqualTo("`${p.jdbcName}`", ${p.javaName});
        return this;
    }


    public ${root.modelUpperName}Condition and${p.upperName}Like(${p.javaType} ${p.javaName})
    {
        getCriteria().andValueLike("`${p.jdbcName}`", ${p.javaName});
        return this;
    }

    public ${root.modelUpperName}Condition or${p.upperName}Like(${p.javaType} ${p.javaName})
    {
        getCriteria().orValueLike("`${p.jdbcName}`", ${p.javaName});
        return this;
    }

    public ${root.modelUpperName}Condition and${p.upperName}NotLike(${p.javaType} ${p.javaName})
    {
        getCriteria().andValueNotLike("`${p.jdbcName}`", ${p.javaName});
        return this;
    }

    public ${root.modelUpperName}Condition or${p.upperName}NotLike(${p.javaType} ${p.javaName})
    {
        getCriteria().orValueNotLike("`${p.jdbcName}`", ${p.javaName});
        return this;
    }

    public ${root.modelUpperName}Condition and${p.upperName}GreaterThan(${p.javaType} ${p.javaName})
    {
        getCriteria().andValueGreaterThan("`${p.jdbcName}`", ${p.javaName});
        return this;
    }
    
    public ${root.modelUpperName}Condition or${p.upperName}GreaterThan(${p.javaType} ${p.javaName})
    {
        getCriteria().orValueGreaterThan("`${p.jdbcName}`", ${p.javaName});
        return this;
    }
    
    public ${root.modelUpperName}Condition and${p.upperName}GreaterThanOrEqualTo(${p.javaType} ${p.javaName})
    {
        getCriteria().andValueGreaterThanOrEqualTo("`${p.jdbcName}`", ${p.javaName});
        return this;
    }
    
    public ${root.modelUpperName}Condition or${p.upperName}GreaterThanOrEqualTo(${p.javaType} ${p.javaName})
    {
        getCriteria().orValueGreaterThanOrEqualTo("`${p.jdbcName}`", ${p.javaName});
        return this;
    }

    public ${root.modelUpperName}Condition and${p.upperName}LessThan(${p.javaType} ${p.javaName})
    {
        getCriteria().andValueLessThan("`${p.jdbcName}`", ${p.javaName});
        return this;
    }
    
    public ${root.modelUpperName}Condition or${p.upperName}LessThan(${p.javaType} ${p.javaName})
    {
        getCriteria().orValueLessThan("`${p.jdbcName}`", ${p.javaName});
        return this;
    }
    
    public ${root.modelUpperName}Condition and${p.upperName}LessThanOrEqualTo(${p.javaType} ${p.javaName})
    {
        getCriteria().andValueLessThanOrEqualTo("`${p.jdbcName}`", ${p.javaName});
        return this;
    }
    
    public ${root.modelUpperName}Condition or${p.upperName}LessThanOrEqualTo(${p.javaType} ${p.javaName})
    {
        getCriteria().orValueLessThanOrEqualTo("`${p.jdbcName}`", ${p.javaName});
        return this;
    }
    
    public ${root.modelUpperName}Condition and${p.upperName}ValueIn(List list)
    {
        getCriteria().andValueIn("`${p.jdbcName}`", list);
        return this;
    }
    
    public ${root.modelUpperName}Condition or${p.upperName}ValueIn(List list)
    {
        getCriteria().orValueIn("`${p.jdbcName}`", list);
        return this;
    }
    
    public ${root.modelUpperName}Condition and${p.upperName}NotIn(List list)
    {
        getCriteria().andValueNotIn("`${p.jdbcName}`", list);
        return this;
    }
    
    public ${root.modelUpperName}Condition or${p.upperName}NotIn(List list)
    {
        getCriteria().orValueNotIn("`${p.jdbcName}`", list);
        return this;
    }
    
    public ${root.modelUpperName}Condition and${p.upperName}Between(${p.javaType} value1, ${p.javaType} value2)
    {
        getCriteria().andValueBetween("`${p.jdbcName}`", value1, value2);
        return this;
    }
    
    public ${root.modelUpperName}Condition or${p.upperName}Between(${p.javaType} value1, ${p.javaType} value2)
    {
        getCriteria().orValueBetween("`${p.jdbcName}`", value1, value2);
        return this;
    }
    
    public ${root.modelUpperName}Condition and${p.upperName}NotBetween(${p.javaType} value1, ${p.javaType} value2)
    {
        getCriteria().andValueNotBetween("`${p.jdbcName}`", value1, value2);
        return this;
    }
    
    public ${root.modelUpperName}Condition or${p.upperName}NotBetween(${p.javaType} value1, ${p.javaType} value2)
    {
        getCriteria().orValueNotBetween("`${p.jdbcName}`", value1, value2);
        return this;
    }

</#list> 
}
