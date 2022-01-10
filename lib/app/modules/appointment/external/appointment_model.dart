import 'package:dental_care_mob/app/modules/appointment/domain/entities/appointment.dart';

class AppointmentModel extends Appointment {
  const AppointmentModel({
    required String id,
    String? doctorName,
    String? specialty,
    String? monthDay,
    String? weekDay,
    String? hour,
    required String cpf,
    required String plan,
    required bool scheduled,
    required String card,
  }) : super(
          id: id,
          doctorName: doctorName,
          specialty: specialty,
          monthDay: monthDay,
          weekDay: weekDay,
          hour: hour,
          cpf: cpf,
          plan: plan,
          scheduled: scheduled,
          card: card,
        );

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      AppointmentModel(
        id: json['id'] ?? '',
        doctorName: json['doctorName'] ?? '',
        specialty: json['specialty'] ?? '',
        monthDay: json['monthDay'] ?? '',
        weekDay: json['weekDay'] ?? '',
        hour: json['hour'] ?? '',
        cpf: json['cpf'] ?? '',
        plan: json['plan'] ?? '',
        scheduled: json['scheduled'] ?? '',
        card: json['card'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'doctorName': doctorName,
        'specialty': specialty,
        'monthDay': monthDay,
        'weekDay': weekDay,
        'hour': hour,
        'cpf': cpf,
        'plan': plan,
        'scheduled': scheduled,
        'card': card,
      };
}
