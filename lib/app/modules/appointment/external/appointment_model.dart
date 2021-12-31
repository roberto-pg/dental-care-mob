import 'package:dental_care_mob/app/modules/appointment/domain/entities/appointment.dart';

class AppointmentModel extends Appointment {
  const AppointmentModel({
    required String scheduleId,
    required String cpf,
    required String plan,
    required bool scheduled,
    required String card,
  }) : super(
          scheduleId: scheduleId,
          cpf: cpf,
          plan: plan,
          scheduled: scheduled,
          card: card,
        );

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      AppointmentModel(
        scheduleId: json['scheduleId'] ?? '',
        cpf: json['cpf'] ?? '',
        plan: json['plan'] ?? '',
        scheduled: json['scheduled'] ?? '',
        card: json['card'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'scheduleId': scheduleId,
        'cpf': cpf,
        'plan': plan,
        'scheduled': scheduled,
        'card': card,
      };
}
