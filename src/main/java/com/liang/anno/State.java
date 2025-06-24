package com.liang.anno;

import com.liang.validation.StateValidation;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.*;

import static java.lang.annotation.ElementType.FIELD;

@Documented
@Target({FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(
        validatedBy = {StateValidation.class}
)

public @interface State {
    String message() default "stae的参数只能是几类";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

}
