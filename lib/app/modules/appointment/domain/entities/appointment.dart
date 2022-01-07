import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class Appointment extends Equatable {
  final String scheduleId;
  final String? doctorName;
  final String? specialty;
  final String? monthDay;
  final String? weekDay;
  final String? hour;
  final String cpf;
  final String plan;
  final String card;
  final bool scheduled;

  const Appointment({
    required this.scheduleId,
    this.doctorName,
    this.specialty,
    this.monthDay,
    this.weekDay,
    this.hour,
    required this.cpf,
    required this.plan,
    required this.card,
    required this.scheduled,
  });

  @override
  List<Object?> get props => [
        scheduleId,
        doctorName,
        specialty,
        monthDay,
        weekDay,
        hour,
        cpf,
        plan,
        card,
        scheduled,
      ];

  Appointment copyWith({
    String? scheduleId,
    String? doctorName,
    String? specialty,
    String? monthDay,
    String? weekDay,
    String? hour,
    String? cpf,
    String? plan,
    String? card,
    bool? scheduled,
  }) {
    return Appointment(
      scheduleId: scheduleId ?? this.scheduleId,
      doctorName: doctorName ?? this.doctorName,
      specialty: specialty ?? this.specialty,
      monthDay: monthDay ?? this.monthDay,
      weekDay: weekDay ?? this.weekDay,
      hour: hour ?? this.hour,
      cpf: cpf ?? this.cpf,
      plan: plan ?? this.plan,
      card: card ?? this.card,
      scheduled: scheduled ?? this.scheduled,
    );
  }
}
