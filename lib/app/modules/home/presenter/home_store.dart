import 'package:dental_care_mob/app/modules/home/domain/usecases/get_doctors_by_specialty_usecase.dart';
import 'package:dental_care_mob/app/modules/home/domain/usecases/get_doctors_usecase.dart';
import 'package:dental_care_mob/app/modules/home/external/doctor_home_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final FlutterSecureStorage _storage;
  final GetDoctorsUsecase _getDoctorsUsecase;
  final GetDoctorsBySpecialtyUsecase _getDoctorsBySpecialtyUsecase;

  HomeStoreBase(
      {required FlutterSecureStorage storage,
      required GetDoctorsUsecase getDoctorsUsecase,
      required GetDoctorsBySpecialtyUsecase getDoctorsBySpecialtyUsecase})
      : _storage = storage,
        _getDoctorsUsecase = getDoctorsUsecase,
        _getDoctorsBySpecialtyUsecase = getDoctorsBySpecialtyUsecase;

  @observable
  ObservableFuture<List<DoctorHomeModel>>? _doctors;

  @observable
  List<DoctorHomeModel>? doctors;

  @observable
  String? erroDoctors;

  @action
  Future<void> getDoctors() async {
    try {
      _doctors = _getDoctorsUsecase.call().asObservable();
      doctors = await _doctors;
    } catch (error) {
      erroDoctors = error.toString();
    }
  }

  @observable
  ObservableFuture<List<DoctorHomeModel>>? _doctorsBySpecialty;

  @observable
  List<DoctorHomeModel>? doctorsBySpecialty;

  @observable
  String? erroDoctorsByEspecialty;

  @action
  Future<void> getDoctorsBySpecialty(String specialty) async {
    try {
      _doctorsBySpecialty =
          _getDoctorsBySpecialtyUsecase.call(specialty).asObservable();
      doctorsBySpecialty = await _doctorsBySpecialty;
    } catch (error) {
      erroDoctorsByEspecialty = error.toString();
    }
  }

  @action
  logoutUser() async {
    await _storage.deleteAll();
  }

  @action
  loadUserId() async {
    String? userId = await _storage.read(key: 'userId');
    return userId;
  }

  @action
  loadUserCpf() async {
    String? userCpf = await _storage.read(key: 'cpf');
    return userCpf;
  }
}
