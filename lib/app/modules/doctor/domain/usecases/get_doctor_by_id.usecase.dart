import 'package:dental_care_mob/app/modules/doctor/domain/repositories/doctor_repository.dart';
import 'package:dental_care_mob/app/modules/doctor/external/doctor_model.dart';

class GetDoctorByIdUseCase {
  final IDoctorRepository _repository;

  GetDoctorByIdUseCase({required IDoctorRepository repository})
      : _repository = repository;

  Future<DoctorModel> call(String id) async {
    var response = await _repository.getDoctorByIdRepo(id);
    return response;
  }
}
