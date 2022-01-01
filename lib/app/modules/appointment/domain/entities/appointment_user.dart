import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class AppointmentUser extends Equatable {
  final String? id;
  final String name;
  final String plan;
  final bool active;

  const AppointmentUser({
    this.id,
    required this.name,
    required this.plan,
    required this.active,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        plan,
        active,
      ];

  AppointmentUser copyWith({
    String? id,
    String? name,
    String? plan,
    bool? active,
  }) {
    return AppointmentUser(
      id: id ?? this.id,
      name: name ?? this.name,
      plan: plan ?? this.plan,
      active: active ?? this.active,
    );
  }
}
