// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$_doctorsAtom = Atom(name: 'HomeStoreBase._doctors');

  @override
  ObservableFuture<List<DoctorHomeModel>>? get _doctors {
    _$_doctorsAtom.reportRead();
    return super._doctors;
  }

  @override
  set _doctors(ObservableFuture<List<DoctorHomeModel>>? value) {
    _$_doctorsAtom.reportWrite(value, super._doctors, () {
      super._doctors = value;
    });
  }

  final _$doctorsAtom = Atom(name: 'HomeStoreBase.doctors');

  @override
  List<DoctorHomeModel>? get doctors {
    _$doctorsAtom.reportRead();
    return super.doctors;
  }

  @override
  set doctors(List<DoctorHomeModel>? value) {
    _$doctorsAtom.reportWrite(value, super.doctors, () {
      super.doctors = value;
    });
  }

  final _$erroDoctorsAtom = Atom(name: 'HomeStoreBase.erroDoctors');

  @override
  String? get erroDoctors {
    _$erroDoctorsAtom.reportRead();
    return super.erroDoctors;
  }

  @override
  set erroDoctors(String? value) {
    _$erroDoctorsAtom.reportWrite(value, super.erroDoctors, () {
      super.erroDoctors = value;
    });
  }

  final _$_doctorsBySpecialtyAtom =
      Atom(name: 'HomeStoreBase._doctorsBySpecialty');

  @override
  ObservableFuture<List<DoctorHomeModel>>? get _doctorsBySpecialty {
    _$_doctorsBySpecialtyAtom.reportRead();
    return super._doctorsBySpecialty;
  }

  @override
  set _doctorsBySpecialty(ObservableFuture<List<DoctorHomeModel>>? value) {
    _$_doctorsBySpecialtyAtom.reportWrite(value, super._doctorsBySpecialty, () {
      super._doctorsBySpecialty = value;
    });
  }

  final _$doctorsBySpecialtyAtom =
      Atom(name: 'HomeStoreBase.doctorsBySpecialty');

  @override
  List<DoctorHomeModel>? get doctorsBySpecialty {
    _$doctorsBySpecialtyAtom.reportRead();
    return super.doctorsBySpecialty;
  }

  @override
  set doctorsBySpecialty(List<DoctorHomeModel>? value) {
    _$doctorsBySpecialtyAtom.reportWrite(value, super.doctorsBySpecialty, () {
      super.doctorsBySpecialty = value;
    });
  }

  final _$erroDoctorsByEspecialtyAtom =
      Atom(name: 'HomeStoreBase.erroDoctorsByEspecialty');

  @override
  String? get erroDoctorsByEspecialty {
    _$erroDoctorsByEspecialtyAtom.reportRead();
    return super.erroDoctorsByEspecialty;
  }

  @override
  set erroDoctorsByEspecialty(String? value) {
    _$erroDoctorsByEspecialtyAtom
        .reportWrite(value, super.erroDoctorsByEspecialty, () {
      super.erroDoctorsByEspecialty = value;
    });
  }

  final _$_isTokenExpiredAtom = Atom(name: 'HomeStoreBase._isTokenExpired');

  @override
  bool get _isTokenExpired {
    _$_isTokenExpiredAtom.reportRead();
    return super._isTokenExpired;
  }

  @override
  set _isTokenExpired(bool value) {
    _$_isTokenExpiredAtom.reportWrite(value, super._isTokenExpired, () {
      super._isTokenExpired = value;
    });
  }

  final _$isTokenExpiredAtom = Atom(name: 'HomeStoreBase.isTokenExpired');

  @override
  bool get isTokenExpired {
    _$isTokenExpiredAtom.reportRead();
    return super.isTokenExpired;
  }

  @override
  set isTokenExpired(bool value) {
    _$isTokenExpiredAtom.reportWrite(value, super.isTokenExpired, () {
      super.isTokenExpired = value;
    });
  }

  final _$getDoctorsAsyncAction = AsyncAction('HomeStoreBase.getDoctors');

  @override
  Future<void> getDoctors() {
    return _$getDoctorsAsyncAction.run(() => super.getDoctors());
  }

  final _$getDoctorsBySpecialtyAsyncAction =
      AsyncAction('HomeStoreBase.getDoctorsBySpecialty');

  @override
  Future<void> getDoctorsBySpecialty(String specialty) {
    return _$getDoctorsBySpecialtyAsyncAction
        .run(() => super.getDoctorsBySpecialty(specialty));
  }

  final _$expiredTokenAsyncAction = AsyncAction('HomeStoreBase.expiredToken');

  @override
  Future expiredToken() {
    return _$expiredTokenAsyncAction.run(() => super.expiredToken());
  }

  final _$logoutUserAsyncAction = AsyncAction('HomeStoreBase.logoutUser');

  @override
  Future logoutUser() {
    return _$logoutUserAsyncAction.run(() => super.logoutUser());
  }

  final _$loadUserIdAsyncAction = AsyncAction('HomeStoreBase.loadUserId');

  @override
  Future loadUserId() {
    return _$loadUserIdAsyncAction.run(() => super.loadUserId());
  }

  final _$loadUserCpfAsyncAction = AsyncAction('HomeStoreBase.loadUserCpf');

  @override
  Future loadUserCpf() {
    return _$loadUserCpfAsyncAction.run(() => super.loadUserCpf());
  }

  @override
  String toString() {
    return '''
doctors: ${doctors},
erroDoctors: ${erroDoctors},
doctorsBySpecialty: ${doctorsBySpecialty},
erroDoctorsByEspecialty: ${erroDoctorsByEspecialty},
isTokenExpired: ${isTokenExpired}
    ''';
  }
}
