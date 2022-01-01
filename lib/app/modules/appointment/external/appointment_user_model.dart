import 'package:dental_care_mob/app/modules/appointment/domain/entities/appointment_user.dart';

class AppointmentUserModel extends AppointmentUser {
  const AppointmentUserModel({
    String? id,
    required String name,
    required String plan,
    required bool active,
  }) : super(
          id: id,
          name: name,
          plan: plan,
          active: active,
        );

  factory AppointmentUserModel.fromJson(Map<String, dynamic> json) =>
      AppointmentUserModel(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        plan: json['plan'] ?? '',
        active: json['active'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'plan': plan,
        'active': active,
      };
}
