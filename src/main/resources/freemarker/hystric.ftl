package ${root.groupName}.hystric;

import com.you.base.BaseResponse;
import ${root.groupName}.api.${root.modelUpperName}Api;
import ${root.groupName}.model.${root.modelUpperName}Model;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ${root.modelUpperName}Hystric implements ${root.modelUpperName}Api {
    @Override
    public BaseResponse add(${root.modelUpperName}Model param) {
        return BaseResponse.failureMessage();
    }

    @Override
    public BaseResponse update(${root.modelUpperName}Model param) {
        return BaseResponse.failureMessage();
    }

    @Override
    public BaseResponse delete(${root.primaryType} ${root.primaryName}) {
        return BaseResponse.failureMessage();
    }

    @Override
    public BaseResponse deleteBatch(List<${root.primaryType}> list) {
        return BaseResponse.failureMessage();
    }

    @Override
    public BaseResponse query(${root.primaryType} ${root.primaryName}) {
        return BaseResponse.failureMessage();
    }

    @Override
    public BaseResponse list(${root.modelUpperName}Model param) {
        return BaseResponse.failureMessage();
    }

    @Override
    public BaseResponse page(${root.modelUpperName}Model param) {
        return BaseResponse.failureMessage();
    }
}
