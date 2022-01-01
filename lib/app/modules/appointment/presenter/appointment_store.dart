import 'package:dental_care_mob/app/modules/appointment/domain/usecases/get_user_by_id_usecase.dart';
import 'package:dental_care_mob/app/modules/appointment/domain/usecases/make_appointment_usecase.dart';
import 'package:dental_care_mob/app/modules/appointment/external/appointment_user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';

part 'appointment_store.g.dart';

class AppointmentStore = AppointmentStoreBase with _$AppointmentStore;

abstract class AppointmentStoreBase with Store {
  final MakeAppointmentUseCase _makeAppointmentUseCase;
  final GetUserByIdUseCase _getUserByIdUseCase;
  final FlutterSecureStorage _storage;

  AppointmentStoreBase(
      {required MakeAppointmentUseCase makeAppointmentUseCase,
      required GetUserByIdUseCase getUserByIdUseCase,
      required FlutterSecureStorage storage})
      : _makeAppointmentUseCase = makeAppointmentUseCase,
        _getUserByIdUseCase = getUserByIdUseCase,
        _storage = storage;

  @observable
  ObservableFuture<AppointmentUserModel>? _userById;

  @observable
  AppointmentUserModel? userById;

  @observable
  String? userError;

  @action
  Future<void> getUserById(String userId) async {
    try {
      _userById = _getUserByIdUseCase.call(userId).asObservable();
      userById = await _userById;
    } catch (error) {
      userError = error.toString();
    }
  }

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

  loadUserId() async {
    String? userId = await _storage.read(key: 'userId');
    return userId;
  }
}
