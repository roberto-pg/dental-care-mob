import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class Schedule extends Equatable {
  final String? id;
  final String doctorId;
  final String doctorName;
  final String specialty;
  final String? monthDay;
  final String? weekDay;
  final String? hour;
  final bool? scheduled;
  final bool? editable;

  const Schedule({
    this.id,
    required this.doctorId,
    required this.doctorName,
    required this.specialty,
    this.monthDay,
    this.weekDay,
    this.hour,
    this.scheduled,
    this.editable,
  });

  @override
  List<Object?> get props => [
        id,
        doctorId,
        doctorName,
        specialty,
        monthDay,
        weekDay,
        hour,
        scheduled,
        editable,
      ];

  Schedule copyWith({
    String? id,
    String? doctorId,
    String? doctorName,
    String? specialty,
    String? monthDay,
    String? weekDay,
    String? hour,
    bool? scheduled,
    bool? editable,
  }) {
    return Schedule(
      id: id ?? this.id,
      doctorId: doctorId ?? this.doctorId,
      doctorName: doctorName ?? this.doctorName,
      specialty: specialty ?? this.specialty,
      monthDay: monthDay ?? this.monthDay,
      weekDay: weekDay ?? this.weekDay,
      hour: hour ?? this.hour,
      scheduled: scheduled ?? this.scheduled,
      editable: editable ?? this.editable,
    );
  }
}
