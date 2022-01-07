import 'package:dental_care_mob/app/modules/appointment/domain/usecases/get_appointment_history_by_cpf_usecase.dart';
import 'package:dental_care_mob/app/modules/appointment/domain/usecases/get_current_appointments_by_cpf_usecase.dart';
import 'package:dental_care_mob/app/modules/appointment/domain/usecases/get_user_by_id_usecase.dart';
import 'package:dental_care_mob/app/modules/appointment/domain/usecases/make_appointment_usecase.dart';
import 'package:dental_care_mob/app/modules/appointment/external/appointment_model.dart';
import 'package:dental_care_mob/app/modules/appointment/external/appointment_user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';

part 'appointment_store.g.dart';

class AppointmentStore = AppointmentStoreBase with _$AppointmentStore;

abstract class AppointmentStoreBase with Store {
  final MakeAppointmentUseCase _makeAppointmentUseCase;
  final GetUserByIdUseCase _getUserByIdUseCase;
  final GetCurrentAppointmentsByCpfUseCase _getCurrentAppointmentsByCpfUseCase;
  final GetAppointmentHistoryByCpfUseCase _getAppointmentHistoryByCpfUseCase;
  final FlutterSecureStorage _storage;

  AppointmentStoreBase(
      {required MakeAppointmentUseCase makeAppointmentUseCase,
      required GetUserByIdUseCase getUserByIdUseCase,
      required GetCurrentAppointmentsByCpfUseCase
          getCurrentAppointmentsByCpfUseCase,
      required GetAppointmentHistoryByCpfUseCase
          getAppointmentHistoryByCpfUseCase,
      required FlutterSecureStorage storage})
      : _makeAppointmentUseCase = makeAppointmentUseCase,
        _getUserByIdUseCase = getUserByIdUseCase,
        _getCurrentAppointmentsByCpfUseCase =
            getCurrentAppointmentsByCpfUseCase,
        _getAppointmentHistoryByCpfUseCase = getAppointmentHistoryByCpfUseCase,
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

  @observable
  ObservableFuture<List<AppointmentModel>>? _currentAppointmentsByCpf;

  @observable
  List<AppointmentModel>? currentAppointmentsByCpf;

  @observable
  String? erroCurrentAppointmentsByCpf;

  @action
  Future<void> getCurrentAppointmentsByCpf(String cpf) async {
    try {
      _currentAppointmentsByCpf =
          _getCurrentAppointmentsByCpfUseCase.call(cpf).asObservable();
      currentAppointmentsByCpf = await _currentAppointmentsByCpf;
    } catch (error) {
      erroCurrentAppointmentsByCpf = error.toString();
    }
  }

  @observable
  ObservableFuture<List<AppointmentModel>>? _appointmentHistoryByCpf;

  @observable
  List<AppointmentModel>? appointmentHistoryByCpf;

  @observable
  String? erroAppointmentHistoryByCpf;

  @action
  Future<void> getAppointmentHistoryByCpf(String cpf) async {
    try {
      _appointmentHistoryByCpf =
          _getAppointmentHistoryByCpfUseCase.call(cpf).asObservable();
      appointmentHistoryByCpf = await _appointmentHistoryByCpf;
    } catch (error) {
      erroAppointmentHistoryByCpf = error.toString();
    }
  }

  loadUserId() async {
    String? userId = await _storage.read(key: 'userId');
    return userId;
  }
}
