import 'package:dental_care_mob/app/modules/appointment/domain/repositories/appointment_repository.dart';
import 'package:dental_care_mob/app/modules/appointment/external/appointment_user_model.dart';

class GetUserByIdUseCase {
  final IAppointmentRepository _repository;

  GetUserByIdUseCase({required IAppointmentRepository repository})
      : _repository = repository;

  Future<AppointmentUserModel> call(String userId) async {
    var response = await _repository.getUserByIdRepo(userId);
    return response;
  }
}
