import 'package:flutter/cupertino.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginFormValidators {
  FormFieldValidator username() => FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: '用户名不能为空'),
      ]);

  FormFieldValidator password() => FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: '密码不能为空'),
        FormBuilderValidators.minLength(6, errorText: '密码需大于6位'),
      ]);
}
