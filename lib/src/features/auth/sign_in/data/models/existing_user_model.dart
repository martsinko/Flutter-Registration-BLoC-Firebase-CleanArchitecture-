
import 'package:smart_identificator/src/features/auth/sign_in/domain/entities/existing_user.dart';

class ExUserModel extends ExUser{
  ExUserModel({
    required String email,
    required String password
  }) : super(email: email, password: password);

factory ExUserModel.fromJson(Map<String, dynamic> json)  {
    return ExUserModel(
      email: json['email'], 
      password: json['password'], 
    );
  }
      Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

}