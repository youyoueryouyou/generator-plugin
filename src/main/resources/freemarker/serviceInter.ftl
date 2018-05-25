package ${root.groupName}.service;

import com.you.base.Page;
import ${root.groupName}.model.${root.modelUpperName}Model;

import java.util.List;


public interface ${root.modelUpperName}Service {
    public ${root.modelUpperName}Model queryById(${root.primaryType} ${root.primaryName}) throws Exception;

    public ${root.modelUpperName}Model queryOne(${root.modelUpperName}Model model) throws Exception;

    public List<${root.modelUpperName}Model> queryList(${root.modelUpperName}Model model) throws Exception;

    public Page<${root.modelUpperName}Model> queryPage(${root.modelUpperName}Model model) throws Exception;

    public Integer queryCount(${root.modelUpperName}Model model) throws Exception;

    public Boolean insert(${root.modelUpperName}Model model) throws Exception;

    public Boolean insertBatch(List<${root.modelUpperName}Model> list) throws Exception;

    public Boolean update(${root.modelUpperName}Model model) throws Exception;

    public Boolean updateBatch(List<${root.modelUpperName}Model> list) throws Exception;

    public Boolean delete(${root.modelUpperName}Model model) throws Exception;

    public Boolean deleteById(${root.primaryType} ${root.primaryName}) throws Exception;

    public Boolean deleteBatch(List<${root.primaryType}> list) throws Exception;
}
