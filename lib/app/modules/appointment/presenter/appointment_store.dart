import 'package:dental_care_mob/app/modules/appointment/domain/usecases/make_appointment_usecase.dart';
import 'package:mobx/mobx.dart';

part 'appointment_store.g.dart';

class AppointmentStore = AppointmentStoreBase with _$AppointmentStore;

abstract class AppointmentStoreBase with Store {
  final MakeAppointmentUseCase _makeAppointmentUseCase;

  AppointmentStoreBase({required MakeAppointmentUseCase makeAppointmentUseCase})
      : _makeAppointmentUseCase = makeAppointmentUseCase;

  @observable
  ObservableFuture<String>? _appointmentCreated;

  @observable
  String? appointmentCreated;

  @observable
  String? errorAppointmentCreated;

  @action
  Future<void> makeAppointment(String scheduleId) async {
    try {
      _appointmentCreated =
          _makeAppointmentUseCase.call(scheduleId).asObservable();
      appointmentCreated = await _appointmentCreated;
    } catch (error) {
      errorAppointmentCreated = error.toString();
    }
  }
}
