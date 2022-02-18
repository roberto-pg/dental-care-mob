// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DoctorStore on DoctorStoreBase, Store {
  final _$_isTokenExpiredAtom = Atom(name: 'DoctorStoreBase._isTokenExpired');

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

  final _$isTokenExpiredAtom = Atom(name: 'DoctorStoreBase.isTokenExpired');

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

  final _$_doctorByIdAtom = Atom(name: 'DoctorStoreBase._doctorById');

  @override
  ObservableFuture<DoctorModel>? get _doctorById {
    _$_doctorByIdAtom.reportRead();
    return super._doctorById;
  }

  @override
  set _doctorById(ObservableFuture<DoctorModel>? value) {
    _$_doctorByIdAtom.reportWrite(value, super._doctorById, () {
      super._doctorById = value;
    });
  }

  final _$doctorByIdAtom = Atom(name: 'DoctorStoreBase.doctorById');

  @override
  DoctorModel? get doctorById {
    _$doctorByIdAtom.reportRead();
    return super.doctorById;
  }

  @override
  set doctorById(DoctorModel? value) {
    _$doctorByIdAtom.reportWrite(value, super.doctorById, () {
      super.doctorById = value;
    });
  }

  final _$doctorErrorAtom = Atom(name: 'DoctorStoreBase.doctorError');

  @override
  String? get doctorError {
    _$doctorErrorAtom.reportRead();
    return super.doctorError;
  }

  @override
  set doctorError(String? value) {
    _$doctorErrorAtom.reportWrite(value, super.doctorError, () {
      super.doctorError = value;
    });
  }

  final _$_schedulesByDoctorAtom =
      Atom(name: 'DoctorStoreBase._schedulesByDoctor');

  @override
  ObservableFuture<List<ScheduleModel>>? get _schedulesByDoctor {
    _$_schedulesByDoctorAtom.reportRead();
    return super._schedulesByDoctor;
  }

  @override
  set _schedulesByDoctor(ObservableFuture<List<ScheduleModel>>? value) {
    _$_schedulesByDoctorAtom.reportWrite(value, super._schedulesByDoctor, () {
      super._schedulesByDoctor = value;
    });
  }

  final _$schedulesByDoctorAtom =
      Atom(name: 'DoctorStoreBase.schedulesByDoctor');

  @override
  List<ScheduleModel>? get schedulesByDoctor {
    _$schedulesByDoctorAtom.reportRead();
    return super.schedulesByDoctor;
  }

  @override
  set schedulesByDoctor(List<ScheduleModel>? value) {
    _$schedulesByDoctorAtom.reportWrite(value, super.schedulesByDoctor, () {
      super.schedulesByDoctor = value;
    });
  }

  final _$errorSchedulesByDoctorAtom =
      Atom(name: 'DoctorStoreBase.errorSchedulesByDoctor');

  @override
  String? get errorSchedulesByDoctor {
    _$errorSchedulesByDoctorAtom.reportRead();
    return super.errorSchedulesByDoctor;
  }

  @override
  set errorSchedulesByDoctor(String? value) {
    _$errorSchedulesByDoctorAtom
        .reportWrite(value, super.errorSchedulesByDoctor, () {
      super.errorSchedulesByDoctor = value;
    });
  }

  final _$expiredTokenAsyncAction = AsyncAction('DoctorStoreBase.expiredToken');

  @override
  Future expiredToken() {
    return _$expiredTokenAsyncAction.run(() => super.expiredToken());
  }

  final _$getDoctorByIdAsyncAction =
      AsyncAction('DoctorStoreBase.getDoctorById');

  @override
  Future<void> getDoctorById(String id) {
    return _$getDoctorByIdAsyncAction.run(() => super.getDoctorById(id));
  }

  final _$getSchedulesByDoctorAsyncAction =
      AsyncAction('DoctorStoreBase.getSchedulesByDoctor');

  @override
  Future<void> getSchedulesByDoctor(String doctorId) {
    return _$getSchedulesByDoctorAsyncAction
        .run(() => super.getSchedulesByDoctor(doctorId));
  }

  @override
  String toString() {
    return '''
isTokenExpired: ${isTokenExpired},
doctorById: ${doctorById},
doctorError: ${doctorError},
schedulesByDoctor: ${schedulesByDoctor},
errorSchedulesByDoctor: ${errorSchedulesByDoctor}
    ''';
  }
}
