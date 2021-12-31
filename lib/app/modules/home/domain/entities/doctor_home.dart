import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class DoctorHome extends Equatable {
  final String? id;
  final String name;
  final String specialty;
  final String imageUrl;
  final bool? active;

  const DoctorHome({
    this.id,
    required this.name,
    required this.specialty,
    required this.imageUrl,
    this.active,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        specialty,
        imageUrl,
        active,
      ];

  DoctorHome copyWith({
    String? id,
    String? name,
    String? specialty,
    String? imageUrl,
    bool? active,
  }) {
    return DoctorHome(
      id: id ?? this.id,
      name: name ?? this.name,
      specialty: specialty ?? this.specialty,
      imageUrl: imageUrl ?? this.imageUrl,
      active: active ?? this.active,
    );
  }
}
