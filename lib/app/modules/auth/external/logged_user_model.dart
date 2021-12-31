import 'package:dental_care_mob/app/modules/auth/domain/entities/logged_user.dart';

class LoggedUserModel extends LoggedUser {
  const LoggedUserModel({
    String? id,
    String? name,
    required String cpf,
    String? plan,
    String? card,
    required String password,
    String? token,
  }) : super(
          id: id,
          name: name,
          cpf: cpf,
          plan: plan,
          card: card,
          password: password,
          token: token,
        );

  factory LoggedUserModel.fromJson(Map<String, dynamic> json) =>
      LoggedUserModel(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        cpf: json['cpf'] ?? '',
        plan: json['plan'] ?? '',
        card: json['card'] ?? '',
        password: json['password'] ?? '',
        token: json['token'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'cpf': cpf,
        'plan': plan,
        'card': card,
        'password': password,
        'token': token,
      };
}
