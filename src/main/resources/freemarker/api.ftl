package ${root.groupName}.api;

import com.you.base.BaseResponse;
import ${root.groupName}.model.${root.modelUpperName}Model;
import ${root.groupName}.hystric.${root.modelUpperName}Hystric;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@FeignClient(name = "${config.moduleName}-provider",path = "${root.modelLowerName}",fallback = ${root.modelUpperName}Hystric.class)
public interface ${root.modelUpperName}Api {
    @PostMapping("add")
    public BaseResponse add(@RequestBody ${root.modelUpperName}Model param);

    @PostMapping("update")
    public BaseResponse update(@RequestBody ${root.modelUpperName}Model param);

    @PostMapping("delete/{${root.primaryName}}")
    public BaseResponse delete(@PathVariable(name = "${root.primaryName}") ${root.primaryType} ${root.primaryName});

    @PostMapping("deleteBatch")
    public BaseResponse deleteBatch(@RequestBody List<${root.primaryType}> list);

    @GetMapping("query/{${root.primaryName}}")
    public BaseResponse query(@PathVariable(name = "${root.primaryName}") ${root.primaryType} ${root.primaryName});

    @PostMapping("list")
    public BaseResponse list(@RequestBody(required = false) ${root.modelUpperName}Model param);

    @PostMapping("page")
    public BaseResponse page(@RequestBody(required = false) ${root.modelUpperName}Model param);
}
