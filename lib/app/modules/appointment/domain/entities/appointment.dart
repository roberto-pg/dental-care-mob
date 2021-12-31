import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class Appointment extends Equatable {
  final String scheduleId;
  final String cpf;
  final String plan;
  final String card;
  final bool scheduled;

  const Appointment({
    required this.scheduleId,
    required this.cpf,
    required this.plan,
    required this.card,
    required this.scheduled,
  });

  @override
  List<Object?> get props => [
        scheduleId,
        cpf,
        plan,
        card,
        scheduled,
      ];

  Appointment copyWith({
    String? scheduleId,
    String? cpf,
    String? plan,
    String? card,
    bool? scheduled,
  }) {
    return Appointment(
      scheduleId: scheduleId ?? this.scheduleId,
      cpf: cpf ?? this.cpf,
      plan: plan ?? this.plan,
      card: card ?? this.card,
      scheduled: scheduled ?? this.scheduled,
    );
  }
}
