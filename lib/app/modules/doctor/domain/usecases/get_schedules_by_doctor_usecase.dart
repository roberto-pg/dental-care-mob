import 'package:dental_care_mob/app/modules/doctor/domain/repositories/doctor_repository.dart';
import 'package:dental_care_mob/app/modules/doctor/external/schedule_model.dart';

class GetSchedulesByDoctorUseCase {
  final IDoctorRepository _repository;

  GetSchedulesByDoctorUseCase({required IDoctorRepository repository})
      : _repository = repository;

  Future<List<ScheduleModel>> call(String doctorId) async {
    var response = await _repository.getSchedulesByDoctorRepo(doctorId);
    return response;
  }
}
