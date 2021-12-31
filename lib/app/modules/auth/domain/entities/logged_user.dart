import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class LoggedUser extends Equatable {
  final String? id;
  final String? name;
  final String cpf;
  final String? plan;
  final String? card;
  final String password;
  final String? token;

  const LoggedUser({
    this.id,
    this.name,
    required this.cpf,
    this.plan,
    this.card,
    required this.password,
    this.token,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        cpf,
        plan,
        card,
        password,
        token,
      ];

  LoggedUser copyWith({
    String? id,
    String? name,
    String? cpf,
    String? plan,
    String? card,
    String? password,
    String? token,
  }) {
    return LoggedUser(
      id: id ?? this.id,
      name: name ?? this.name,
      cpf: cpf ?? this.cpf,
      plan: plan ?? this.plan,
      card: card ?? this.card,
      password: password ?? this.password,
      token: token ?? this.token,
    );
  }
}
