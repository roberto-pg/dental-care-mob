import 'package:dental_care_mob/app/modules/doctor/domain/entities/doctor.dart';

class DoctorModel extends Doctor {
  const DoctorModel({
    String? id,
    required String name,
    required String specialty,
    required String imageUrl,
    required String bio,
    bool? active,
  }) : super(
          id: id,
          name: name,
          specialty: specialty,
          imageUrl: imageUrl,
          bio: bio,
          active: active,
        );

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        specialty: json['specialty'] ?? '',
        imageUrl: json['imageUrl'] ?? '',
        bio: json['bio'] ?? '',
        active: json['active'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'specialty': specialty,
        'imageUrl': imageUrl,
        'bio': bio,
        'active': active,
      };
}
