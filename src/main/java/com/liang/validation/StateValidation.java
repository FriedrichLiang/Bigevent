package com.liang.validation;

import com.liang.anno.State;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class StateValidation implements ConstraintValidator<State,String> {

    @Override
    public boolean isValid(String value, ConstraintValidatorContext constraintValidatorContext) {
        if(value == null){
            return false;
        }
        if(value.equals("草稿") || value.equals("已发布") || value.equals("审核中") || value.equals("审核未通过")){
            return true;
        }
        return false;
    }
}
