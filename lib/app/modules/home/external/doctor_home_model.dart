import 'package:dental_care_mob/app/modules/home/domain/entities/doctor_home.dart';

class DoctorHomeModel extends DoctorHome {
  const DoctorHomeModel({
    String? id,
    required String name,
    required String specialty,
    required String imageUrl,
    bool? active,
  }) : super(
          id: id,
          name: name,
          specialty: specialty,
          imageUrl: imageUrl,
          active: active,
        );

  factory DoctorHomeModel.fromJson(Map<String, dynamic> json) =>
      DoctorHomeModel(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        specialty: json['specialty'] ?? '',
        imageUrl: json['imageUrl'] ?? '',
        active: json['active'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'specialty': specialty,
        'imageUrl': imageUrl,
        'active': active,
      };
}
