import 'package:dental_care_mob/app/modules/home/domain/repositories/home_repository.dart';
import 'package:dental_care_mob/app/modules/home/external/doctor_home_model.dart';

class GetDoctorsBySpecialtyUsecase {
  final IHomeRepository _repository;

  GetDoctorsBySpecialtyUsecase({required IHomeRepository repository})
      : _repository = repository;

  Future<List<DoctorHomeModel>> call(String specialty) async {
    var response = await _repository.getDoctorsByEspecialtyRepo(specialty);
    return response;
  }
}
