// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppointmentStore on AppointmentStoreBase, Store {
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

  final _$makeAppointmentAsyncAction =
      AsyncAction('AppointmentStoreBase.makeAppointment');

  @override
  Future<void> makeAppointment(String scheduleId) {
    return _$makeAppointmentAsyncAction
        .run(() => super.makeAppointment(scheduleId));
  }

  @override
  String toString() {
    return '''
appointmentCreated: ${appointmentCreated},
errorAppointmentCreated: ${errorAppointmentCreated}
    ''';
  }
}
