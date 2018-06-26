package ${root.groupName}.controller;


import com.you.base.BaseResponse;
import com.you.base.Page;
import ${root.groupName}.api.${root.modelUpperName}Api;
import ${root.groupName}.model.${root.modelUpperName}Model;
import ${root.groupName}.service.${root.modelUpperName}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("${root.modelLowerName}")
public class ${root.modelUpperName}Controller implements ${root.modelUpperName}Api{
    @Autowired
    private ${root.modelUpperName}Service ${root.modelLowerName}Service;

    @PostMapping("add")
    public BaseResponse add(@RequestBody ${root.modelUpperName}Model param) {
        try {
            if (${root.modelLowerName}Service.insert(param)){
                return BaseResponse.successMessage("add success!");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return BaseResponse.failureMessage("add failure!");
    }

    @PostMapping("update")
    public BaseResponse update(@RequestBody ${root.modelUpperName}Model param) {
        try {
            if (${root.modelLowerName}Service.update(param)){
                return BaseResponse.successMessage("update success!");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return BaseResponse.failureMessage("update failure!");
    }

    @PostMapping("delete/{${root.primaryName}}")
    public BaseResponse delete(@PathVariable ${root.primaryType} ${root.primaryName}) {
        try {
            if (${root.modelLowerName}Service.deleteById(${root.primaryName})){
                return BaseResponse.successMessage("delete success!");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return BaseResponse.failureMessage("delete failure!");
    }

    @PostMapping("deleteBatch")
    public BaseResponse deleteBatch(@RequestBody List<${root.primaryType}> list) {
        try {
            if (${root.modelLowerName}Service.deleteBatch(list)){
                return BaseResponse.successMessage("deleteBatch success!");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return BaseResponse.failureMessage("deleteBatch failure!");
    }

    @GetMapping("query/{${root.primaryName}}")
    public BaseResponse query(@PathVariable ${root.primaryType} ${root.primaryName}) {
        try {
            ${root.modelUpperName}Model result = ${root.modelLowerName}Service.queryById(${root.primaryName});
            if (result != null){
                return BaseResponse.successResult(result, "query success!");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return BaseResponse.failureMessage("query failure!");
    }


    @PostMapping("list")
    public BaseResponse list(@RequestBody(required = false) ${root.modelUpperName}Model param) {
        try {
            List<${root.modelUpperName}Model> result = ${root.modelLowerName}Service.queryList(param);
            return BaseResponse.successResult(result, "list success!");
        }catch (Exception e){
            e.printStackTrace();
        }
        return BaseResponse.failureMessage("list failure!");
    }

    @PostMapping("page")
    public BaseResponse page(@RequestBody(required = false) ${root.modelUpperName}Model param) {
        try {
            Page<${root.modelUpperName}Model> result = ${root.modelLowerName}Service.queryPage(param);
            return BaseResponse.successResult(result, "page success!");
        }catch (Exception e){
            e.printStackTrace();
        }
        return BaseResponse.failureMessage("page failure!");
    }

}
