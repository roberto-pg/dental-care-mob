import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class Appointment extends Equatable {
  final String id;
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
    required this.id,
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
        id,
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
    String? id,
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
      id: id ?? this.id,
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
