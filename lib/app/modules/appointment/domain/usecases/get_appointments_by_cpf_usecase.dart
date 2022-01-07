import 'package:dental_care_mob/app/modules/appointment/domain/repositories/appointment_repository.dart';
import 'package:dental_care_mob/app/modules/appointment/external/appointment_model.dart';

class GetAppointmentsByCpfUseCase {
  final IAppointmentRepository _repository;

  GetAppointmentsByCpfUseCase({required IAppointmentRepository repository})
      : _repository = repository;

  Future<List<AppointmentModel>> call(String cpf) async {
    List<AppointmentModel> response = [];
    var result = await _repository.getAppointmentByCpfRepo(cpf);
    List<AppointmentModel> resultList = result.map((e) => e).toList();
    for (var element in resultList) {
      if (DateTime.parse(element.monthDay!).isAfter(DateTime.now())) {
        response.add(element);
      }
    }

    return response;
  }
}
