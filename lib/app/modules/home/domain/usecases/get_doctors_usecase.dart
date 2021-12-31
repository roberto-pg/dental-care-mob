import 'package:dental_care_mob/app/modules/home/domain/repositories/home_repository.dart';
import 'package:dental_care_mob/app/modules/home/external/doctor_home_model.dart';

class GetDoctorsUsecase {
  final IHomeRepository _repository;

  GetDoctorsUsecase({required IHomeRepository repository})
      : _repository = repository;

  Future<List<DoctorHomeModel>> call() async {
    var response = await _repository.getDoctorsRepo();
    return response;
  }
}
