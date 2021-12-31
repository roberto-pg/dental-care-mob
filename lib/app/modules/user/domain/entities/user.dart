import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class User extends Equatable {
  final String? id;
  final String name;
  final String email;
  final String cpf;
  final String password;
  final String plan;
  final String? card;
  final bool? active;
  final bool? admin;

  const User({
    this.id,
    required this.name,
    required this.email,
    required this.cpf,
    required this.password,
    required this.plan,
    this.card,
    this.active,
    this.admin
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        cpf,
        password,
        plan,
        card,
        active,
        admin
      ];

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? cpf,
    String? password,
    String? plan,
    String? card,
    bool? active,
    bool? admin,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      cpf: cpf ?? this.cpf,
      password: password ?? this.password,
      plan: plan ?? this.plan,
      card: card ?? this.card,
      active: active ?? this.active,
      admin: admin ?? this.admin,
    );
  }
}
