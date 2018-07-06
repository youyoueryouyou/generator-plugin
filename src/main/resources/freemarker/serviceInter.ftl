package ${root.groupName}.service;

import com.you.base.Page;
import ${root.groupName}.model.${root.modelUpperName}Model;

import java.util.List;

/**
 * @author ${config.author}
 */
public interface ${root.modelUpperName}Service {

    /***
     * 根据ID查询数据
     * @param ${root.primaryName}
     * @throws Exception
     * @return ${root.modelUpperName}Model
     */
    public ${root.modelUpperName}Model queryById(${root.primaryType} ${root.primaryName}) throws Exception;

    /***
     * 根据条件返回一条数据
     * @param model
     * @throws Exception
     * @return ${root.modelUpperName}Model
     */
    public ${root.modelUpperName}Model queryOne(${root.modelUpperName}Model model) throws Exception;

    /***
     * 根据条件返回列表数据
     * @param model
     * @throws Exception
     * @return List<${root.modelUpperName}Model>
     */
    public List<${root.modelUpperName}Model> queryList(${root.modelUpperName}Model model) throws Exception;

    /***
    * 根据条件返回分页数据
    * @param model
    * @throws Exception
    * @return Page<${root.modelUpperName}Model>
    */
    public Page<${root.modelUpperName}Model> queryPage(${root.modelUpperName}Model model) throws Exception;

    /***
    * 根据条件返回数据总条数
    * @param model
    * @throws Exception
    * @return Integer
    */
    public Integer queryCount(${root.modelUpperName}Model model) throws Exception;

    /***
    * 插入数据
    * @param model
    * @throws Exception
    * @return Boolean
    */
    public Boolean insert(${root.modelUpperName}Model model) throws Exception;

    /***
    * 批量插入数据
    * @param list
    * @throws Exception
    * @return Boolean
    */
    public Boolean insertBatch(List<${root.modelUpperName}Model> list) throws Exception;

    /***
    * 更新数据
    * @param model
    * @throws Exception
    * @return Boolean
    */
    public Boolean update(${root.modelUpperName}Model model) throws Exception;

    /***
    * 批量更新数据
    * @param list
    * @throws Exception
    * @return Boolean
    */
    public Boolean updateBatch(List<${root.modelUpperName}Model> list) throws Exception;

    /***
    * 删除数据
    * @param model
    * @throws Exception
    * @return Boolean
    */
    public Boolean delete(${root.modelUpperName}Model model) throws Exception;

    /***
    * 根据ID删除数据
    * @param ${root.primaryName}
    * @throws Exception
    * @return Boolean
    */
    public Boolean deleteById(${root.primaryType} ${root.primaryName}) throws Exception;

    /***
    * 批量删除数据
    * @param list
    * @throws Exception
    * @return Boolean
    */
    public Boolean deleteBatch(List<${root.primaryType}> list) throws Exception;
}
