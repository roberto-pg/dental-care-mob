import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class Doctor extends Equatable {
  final String? id;
  final String name;
  final String specialty;
  final String imageUrl;
  final String bio;
  final bool? active;

  const Doctor({
    this.id,
    required this.name,
    required this.specialty,
    required this.imageUrl,
    required this.bio,
    this.active,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        specialty,
        imageUrl,
        bio,
        active,
      ];

  Doctor copyWith({
    String? id,
    String? name,
    String? specialty,
    String? imageUrl,
    String? bio,
    bool? active,
  }) {
    return Doctor(
      id: id ?? this.id,
      name: name ?? this.name,
      specialty: specialty ?? this.specialty,
      imageUrl: imageUrl ?? this.imageUrl,
      bio: bio ?? this.bio,
      active: active ?? this.active,
    );
  }
}
