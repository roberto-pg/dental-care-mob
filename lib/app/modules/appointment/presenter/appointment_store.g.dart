// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppointmentStore on AppointmentStoreBase, Store {
  final _$_userByIdAtom = Atom(name: 'AppointmentStoreBase._userById');

  @override
  ObservableFuture<AppointmentUserModel>? get _userById {
    _$_userByIdAtom.reportRead();
    return super._userById;
  }

  @override
  set _userById(ObservableFuture<AppointmentUserModel>? value) {
    _$_userByIdAtom.reportWrite(value, super._userById, () {
      super._userById = value;
    });
  }

  final _$userByIdAtom = Atom(name: 'AppointmentStoreBase.userById');

  @override
  AppointmentUserModel? get userById {
    _$userByIdAtom.reportRead();
    return super.userById;
  }

  @override
  set userById(AppointmentUserModel? value) {
    _$userByIdAtom.reportWrite(value, super.userById, () {
      super.userById = value;
    });
  }

  final _$userErrorAtom = Atom(name: 'AppointmentStoreBase.userError');

  @override
  String? get userError {
    _$userErrorAtom.reportRead();
    return super.userError;
  }

  @override
  set userError(String? value) {
    _$userErrorAtom.reportWrite(value, super.userError, () {
      super.userError = value;
    });
  }

  final _$_appointmentCreatedAtom =
      Atom(name: 'AppointmentStoreBase._appointmentCreated');

  @override
  ObservableFuture<String>? get _appointmentCreated {
    _$_appointmentCreatedAtom.reportRead();
    return super._appointmentCreated;
  }

  @override
  set _appointmentCreated(ObservableFuture<String>? value) {
    _$_appointmentCreatedAtom.reportWrite(value, super._appointmentCreated, () {
      super._appointmentCreated = value;
    });
  }

  final _$appointmentCreatedAtom =
      Atom(name: 'AppointmentStoreBase.appointmentCreated');

  @override
  String? get appointmentCreated {
    _$appointmentCreatedAtom.reportRead();
    return super.appointmentCreated;
  }

  @override
  set appointmentCreated(String? value) {
    _$appointmentCreatedAtom.reportWrite(value, super.appointmentCreated, () {
      super.appointmentCreated = value;
    });
  }

  final _$errorAppointmentCreatedAtom =
      Atom(name: 'AppointmentStoreBase.errorAppointmentCreated');

  @override
  String? get errorAppointmentCreated {
    _$errorAppointmentCreatedAtom.reportRead();
    return super.errorAppointmentCreated;
  }

  @override
  set errorAppointmentCreated(String? value) {
    _$errorAppointmentCreatedAtom
        .reportWrite(value, super.errorAppointmentCreated, () {
      super.errorAppointmentCreated = value;
    });
  }

  final _$_currentAppointmentsByCpfAtom =
      Atom(name: 'AppointmentStoreBase._currentAppointmentsByCpf');

  @override
  ObservableFuture<List<AppointmentModel>>? get _currentAppointmentsByCpf {
    _$_currentAppointmentsByCpfAtom.reportRead();
    return super._currentAppointmentsByCpf;
  }

  @override
  set _currentAppointmentsByCpf(
      ObservableFuture<List<AppointmentModel>>? value) {
    _$_currentAppointmentsByCpfAtom
        .reportWrite(value, super._currentAppointmentsByCpf, () {
      super._currentAppointmentsByCpf = value;
    });
  }

  final _$currentAppointmentsByCpfAtom =
      Atom(name: 'AppointmentStoreBase.currentAppointmentsByCpf');

  @override
  List<AppointmentModel>? get currentAppointmentsByCpf {
    _$currentAppointmentsByCpfAtom.reportRead();
    return super.currentAppointmentsByCpf;
  }

  @override
  set currentAppointmentsByCpf(List<AppointmentModel>? value) {
    _$currentAppointmentsByCpfAtom
        .reportWrite(value, super.currentAppointmentsByCpf, () {
      super.currentAppointmentsByCpf = value;
    });
  }

  final _$erroCurrentAppointmentsByCpfAtom =
      Atom(name: 'AppointmentStoreBase.erroCurrentAppointmentsByCpf');

  @override
  String? get erroCurrentAppointmentsByCpf {
    _$erroCurrentAppointmentsByCpfAtom.reportRead();
    return super.erroCurrentAppointmentsByCpf;
  }

  @override
  set erroCurrentAppointmentsByCpf(String? value) {
    _$erroCurrentAppointmentsByCpfAtom
        .reportWrite(value, super.erroCurrentAppointmentsByCpf, () {
      super.erroCurrentAppointmentsByCpf = value;
    });
  }

  final _$_appointmentHistoryByCpfAtom =
      Atom(name: 'AppointmentStoreBase._appointmentHistoryByCpf');

  @override
  ObservableFuture<List<AppointmentModel>>? get _appointmentHistoryByCpf {
    _$_appointmentHistoryByCpfAtom.reportRead();
    return super._appointmentHistoryByCpf;
  }

  @override
  set _appointmentHistoryByCpf(
      ObservableFuture<List<AppointmentModel>>? value) {
    _$_appointmentHistoryByCpfAtom
        .reportWrite(value, super._appointmentHistoryByCpf, () {
      super._appointmentHistoryByCpf = value;
    });
  }

  final _$appointmentHistoryByCpfAtom =
      Atom(name: 'AppointmentStoreBase.appointmentHistoryByCpf');

  @override
  List<AppointmentModel>? get appointmentHistoryByCpf {
    _$appointmentHistoryByCpfAtom.reportRead();
    return super.appointmentHistoryByCpf;
  }

  @override
  set appointmentHistoryByCpf(List<AppointmentModel>? value) {
    _$appointmentHistoryByCpfAtom
        .reportWrite(value, super.appointmentHistoryByCpf, () {
      super.appointmentHistoryByCpf = value;
    });
  }

  final _$erroAppointmentHistoryByCpfAtom =
      Atom(name: 'AppointmentStoreBase.erroAppointmentHistoryByCpf');

  @override
  String? get erroAppointmentHistoryByCpf {
    _$erroAppointmentHistoryByCpfAtom.reportRead();
    return super.erroAppointmentHistoryByCpf;
  }

  @override
  set erroAppointmentHistoryByCpf(String? value) {
    _$erroAppointmentHistoryByCpfAtom
        .reportWrite(value, super.erroAppointmentHistoryByCpf, () {
      super.erroAppointmentHistoryByCpf = value;
    });
  }

  final _$getUserByIdAsyncAction =
      AsyncAction('AppointmentStoreBase.getUserById');

  @override
  Future<void> getUserById(String userId) {
    return _$getUserByIdAsyncAction.run(() => super.getUserById(userId));
  }

  final _$makeAppointmentAsyncAction =
      AsyncAction('AppointmentStoreBase.makeAppointment');

  @override
  Future<void> makeAppointment(String scheduleId) {
    return _$makeAppointmentAsyncAction
        .run(() => super.makeAppointment(scheduleId));
  }

  final _$getCurrentAppointmentsByCpfAsyncAction =
      AsyncAction('AppointmentStoreBase.getCurrentAppointmentsByCpf');

  @override
  Future<void> getCurrentAppointmentsByCpf(String cpf) {
    return _$getCurrentAppointmentsByCpfAsyncAction
        .run(() => super.getCurrentAppointmentsByCpf(cpf));
  }

  final _$getAppointmentHistoryByCpfAsyncAction =
      AsyncAction('AppointmentStoreBase.getAppointmentHistoryByCpf');

  @override
  Future<void> getAppointmentHistoryByCpf(String cpf) {
    return _$getAppointmentHistoryByCpfAsyncAction
        .run(() => super.getAppointmentHistoryByCpf(cpf));
  }

  @override
  String toString() {
    return '''
userById: ${userById},
userError: ${userError},
appointmentCreated: ${appointmentCreated},
errorAppointmentCreated: ${errorAppointmentCreated},
currentAppointmentsByCpf: ${currentAppointmentsByCpf},
erroCurrentAppointmentsByCpf: ${erroCurrentAppointmentsByCpf},
appointmentHistoryByCpf: ${appointmentHistoryByCpf},
erroAppointmentHistoryByCpf: ${erroAppointmentHistoryByCpf}
    ''';
  }
}
