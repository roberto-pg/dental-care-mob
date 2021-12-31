import 'package:dental_care_mob/app/modules/user/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    String? id,
    required String name,
    required String email,
    required String cpf,
    required String password,
    required String plan,
    String? card,
    bool? active,
    bool? admin,
  }) : super(
          id: id,
          name: name,
          email: email,
          cpf: cpf,
          password: password,
          plan: plan,
          card: card,
          active: active,
          admin: admin,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        email: json['email'] ?? '',
        cpf: json['cpf'] ?? '',
        password: json['password'] ?? '',
        plan: json['plan'] ?? '',
        card: json['card'] ?? '',
        active: json['active'] ?? '',
        admin: json['admin'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'cpf': cpf,
        'password': password,
        'plan': plan,
        'card': card,
        'active': active,
        'admin': admin
      };
}
