import 'package:dental_care_mob/app/modules/doctor/domain/usecases/get_doctor_by_id.usecase.dart';
import 'package:dental_care_mob/app/modules/doctor/domain/usecases/get_schedules_by_doctor_usecase.dart';
import 'package:dental_care_mob/app/modules/doctor/external/schedule_model.dart';
import 'package:dental_care_mob/app/modules/doctor/external/doctor_model.dart';
import 'package:dental_care_mob/shared/validators/validator.dart';
import 'package:mobx/mobx.dart';

part 'doctor_store.g.dart';

class DoctorStore = DoctorStoreBase with _$DoctorStore;

abstract class DoctorStoreBase with Store {
  final GetDoctorByIdUseCase _getDoctorByIdUseCase;
  final GetSchedulesByDoctorUseCase _getSchedulesByDoctorUseCase;
  final IValidator _validate;

  DoctorStoreBase({
    required GetDoctorByIdUseCase getDoctorByIdUseCase,
    required GetSchedulesByDoctorUseCase getSchedulesByDoctorUsecase,
    required IValidator validate,
  })  : _getDoctorByIdUseCase = getDoctorByIdUseCase,
        _getSchedulesByDoctorUseCase = getSchedulesByDoctorUsecase,
        _validate = validate;

  @observable
  bool _isTokenExpired = false;

  @observable
  bool isTokenExpired = false;

  @action
  expiredToken() async {
    _isTokenExpired = await _validate.expiredToken();
    isTokenExpired = _isTokenExpired;
    return isTokenExpired;
  }

  @observable
  ObservableFuture<DoctorModel>? _doctorById;

  @observable
  DoctorModel? doctorById;

  @observable
  String? doctorError;

  @action
  Future<void> getDoctorById(String id) async {
    try {
      _doctorById = _getDoctorByIdUseCase.call(id).asObservable();
      doctorById = await _doctorById;
    } catch (error) {
      doctorError = error.toString();
    }
  }

  @observable
  ObservableFuture<List<ScheduleModel>>? _schedulesByDoctor;

  @observable
  List<ScheduleModel>? schedulesByDoctor;

  @observable
  String? errorSchedulesByDoctor;

  @action
  Future<void> getSchedulesByDoctor(String doctorId) async {
    try {
      _schedulesByDoctor =
          _getSchedulesByDoctorUseCase.call(doctorId).asObservable();
      schedulesByDoctor = await _schedulesByDoctor;
    } catch (error) {
      errorSchedulesByDoctor = error.toString();
    }
  }
}
