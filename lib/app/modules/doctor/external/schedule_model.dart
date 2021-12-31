import 'package:dental_care_mob/app/modules/doctor/domain/entities/schedule.dart';

class ScheduleModel extends Schedule {
  const ScheduleModel({
    String? id,
    required String doctorId,
    required String doctorName,
    required String specialty,
    String? monthDay,
    String? weekDay,
    String? hour,
    bool? scheduled,
    bool? editable,
  }) : super(
          id: id,
          doctorId: doctorId,
          doctorName: doctorName,
          specialty: specialty,
          monthDay: monthDay,
          weekDay: weekDay,
          hour: hour,
          scheduled: scheduled,
          editable: editable,
        );

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
        id: json['id'] ?? '',
        doctorId: json['doctorId'] ?? '',
        doctorName: json['doctorName'] ?? '',
        specialty: json['specialty'] ?? '',
        monthDay: json['monthDay'] ?? '',
        weekDay: json['weekDay'] ?? '',
        hour: json['hour'] ?? '',
        scheduled: json['scheduled'] ?? '',
        editable: json['editable'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'doctorId': doctorId,
        'doctorName': doctorName,
        'specialty': specialty,
        'monthDay': monthDay,
        'weekDay': weekDay,
        'hour': hour,
        'scheduled': scheduled,
        'editable': editable,
      };
}
