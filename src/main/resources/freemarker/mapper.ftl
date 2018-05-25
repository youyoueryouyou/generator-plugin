package ${root.groupName}.mapper;

import com.you.base.BaseMapper;
import ${root.groupName}.condition.${root.modelUpperName}Condition;
import ${root.groupName}.model.${root.modelUpperName}Model;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ${root.modelUpperName}Mapper extends BaseMapper<${root.modelUpperName}Model,${root.modelUpperName}Condition> {

}
