package ${root.groupName}.service.impl;

import java.util.ArrayList;
import java.util.List;

import cn.hutool.core.util.RandomUtil;
import com.you.base.BasePojo;
import ${root.groupName}.condition.${root.modelUpperName}Condition;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import com.you.base.Page;
import ${root.groupName}.service.${root.modelUpperName}Service;
import ${root.groupName}.mapper.${root.modelUpperName}Mapper;
import ${root.groupName}.model.${root.modelUpperName}Model;

/**
 * @author ${config.author}
 */
@Service
public class ${root.modelUpperName}ServiceImpl implements ${root.modelUpperName}Service {
    @Autowired
    @SuppressWarnings("all")
    private ${root.modelUpperName}Mapper ${root.modelLowerName}Mapper;

    @Override
    public ${root.modelUpperName}Model queryById(${root.primaryType} ${root.primaryName})
        throws Exception
    {
        ${root.modelUpperName}Model model = new ${root.modelUpperName}Model();
        model.set${root.primaryUpper}(${root.primaryName});
        model.initColumn();
        return ${root.modelLowerName}Mapper.selectByPrimaryKey(model).getPojo(new ${root.modelUpperName}Model());
    }

    @Override
    public ${root.modelUpperName}Model queryOne(${root.modelUpperName}Model model)
        throws Exception
    {
        ${root.modelUpperName}Condition condition = new ${root.modelUpperName}Condition(model);
        List<BasePojo> list = ${root.modelLowerName}Mapper.selectByCondition(condition);
        if (list != null && list.size() > 0){
            return list.get(0).getPojo(new ${root.modelUpperName}Model());
        }
        return null;
    }

    @Override
    public List<${root.modelUpperName}Model> queryList(${root.modelUpperName}Model model)
        throws Exception
    {
        if(model == null){
            model = new ${root.modelUpperName}Model();
        }
        ${root.modelUpperName}Condition condition = new ${root.modelUpperName}Condition(model);
        return getResultList(${root.modelLowerName}Mapper.selectByCondition(condition));
    }

    @Override
    public Page<${root.modelUpperName}Model> queryPage(${root.modelUpperName}Model model)
        throws Exception
    {
        if(model == null){
            model = new ${root.modelUpperName}Model();
        }
        ${root.modelUpperName}Condition condition = new ${root.modelUpperName}Condition(model);
        int count = ${root.modelLowerName}Mapper.countByCondition(condition);
        Page<${root.modelUpperName}Model> page = new Page<${root.modelUpperName}Model>(model.getPageNo(),model.getPageSize());
        page.setRowCount(count);
        if (count > 0){
            page.setResult(getResultList(${root.modelLowerName}Mapper.selectByCondition(condition)));
        }
        return page;
    }

    @Override
    public Integer queryCount(${root.modelUpperName}Model model)
        throws Exception
    {
        ${root.modelUpperName}Condition condition = new ${root.modelUpperName}Condition(model);
        return ${root.modelLowerName}Mapper.countByCondition(condition);
    }

    @Override
    public Boolean insert(${root.modelUpperName}Model model)
        throws Exception
    {
     <#if root.primaryType == 'String'>
         if (model.get${root.primaryUpper}() == null){
             model.set${root.primaryUpper}(RandomUtil.randomUUID().replace("-",""));
         }
     </#if>
        model.initColumn();
        return ${root.modelLowerName}Mapper.insertSelective(model) == 1;
    }

    @Override
    public Boolean insertBatch(List<${root.modelUpperName}Model> list)
        throws Exception
    {
        if (list != null && list.size() > 0){
            int count = 0;
            for (${root.modelUpperName}Model model : list){
               model.initColumn();
               count = count + ${root.modelLowerName}Mapper.updateByPrimaryKeySelective(model);
            }
            return count == list.size();
        }
        return false;
    }

    @Override
    public Boolean update(${root.modelUpperName}Model model)
        throws Exception
    {
        model.initColumn();
        return ${root.modelLowerName}Mapper.updateByPrimaryKeySelective(model) == 1;
    }

    @Override
    public Boolean updateBatch(List<${root.modelUpperName}Model> list)
        throws Exception
    {
        if (list != null && list.size() > 0){
            int count = 0;
            for (${root.modelUpperName}Model model : list){
                model.initColumn();
                count = count + ${root.modelLowerName}Mapper.updateByPrimaryKeySelective(model);
            }
            return count == list.size();
        }
        return false;
    }


    @Override
    public Boolean delete(${root.modelUpperName}Model model)
        throws Exception
    {
        ${root.modelUpperName}Condition condition = new ${root.modelUpperName}Condition(model);
        return ${root.modelLowerName}Mapper.deleteByCondition(condition) == 1;
    }

    @Override
    public Boolean deleteById(${root.primaryType} ${root.primaryName}) throws Exception {
        ${root.modelUpperName}Model model = new ${root.modelUpperName}Model();
        model.set${root.primaryUpper}(${root.primaryName});
        model.initColumn();
        return ${root.modelLowerName}Mapper.deleteByPrimaryKey(model) == 1;
    }

    @Override
    public Boolean deleteBatch(List<${root.primaryType}> list)
        throws Exception
    {
        if (list != null && list.size() > 0){
            int count = 0;
            for (${root.primaryType} ${root.primaryName} : list){
                ${root.modelUpperName}Model model = new ${root.modelUpperName}Model();
                model.set${root.primaryUpper}(${root.primaryName});
                model.initColumn();
                count = count + ${root.modelLowerName}Mapper.deleteByPrimaryKey(model);
            }
            return count == list.size();
        }
        return false;
    }

    private List<${root.modelUpperName}Model> getResultList(List<BasePojo> list){
        List<${root.modelUpperName}Model> result = new ArrayList<${root.modelUpperName}Model>();
        if (list != null){
            for (BasePojo pojo : list){
                result.add(pojo.getPojo(new ${root.modelUpperName}Model()));
            }
        }
        return result;
    }
}
