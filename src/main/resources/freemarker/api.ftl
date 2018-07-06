package ${root.groupName}.api;

import com.you.base.BaseResponse;
import ${root.groupName}.model.${root.modelUpperName}Model;
import ${root.groupName}.hystric.${root.modelUpperName}Hystric;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;
/**
 * @author ${config.author}
 */
@FeignClient(name = "${config.moduleName}-provider",path = "${root.modelLowerName}",fallback = ${root.modelUpperName}Hystric.class)
public interface ${root.modelUpperName}Api {
    /***
     * 增加数据
     * @param param
     * @return BaseResponse
     */
    @PostMapping("add")
    public BaseResponse add(@RequestBody ${root.modelUpperName}Model param);

    /***
     * 更新数据
     * @param param
     * @return BaseResponse
     */
    @PostMapping("update")
    public BaseResponse update(@RequestBody ${root.modelUpperName}Model param);

    /***
     * 删除数据
     * @param ${root.primaryName}
     * @return BaseResponse
     */
    @PostMapping("delete/{${root.primaryName}}")
    public BaseResponse delete(@PathVariable(name = "${root.primaryName}") ${root.primaryType} ${root.primaryName});

    /***
     * 批量删除数据
     * @param list
     * @return BaseResponse
     */
    @PostMapping("deleteBatch")
    public BaseResponse deleteBatch(@RequestBody List<${root.primaryType}> list);

    /***
     * 根据主键获取数据对象
     * @param ${root.primaryName}
     * @return BaseResponse
     */
    @GetMapping("query/{${root.primaryName}}")
    public BaseResponse query(@PathVariable(name = "${root.primaryName}") ${root.primaryType} ${root.primaryName});

    /***
     * 根据条件获取数据列表
     * @param param
     * @return BaseResponse
     */
    @PostMapping("list")
    public BaseResponse list(@RequestBody(required = false) ${root.modelUpperName}Model param);

    /***
     * 根据条件获取分页数据
     * @param param
     * @return BaseResponse
     */
    @PostMapping("page")
    public BaseResponse page(@RequestBody(required = false) ${root.modelUpperName}Model param);
}
