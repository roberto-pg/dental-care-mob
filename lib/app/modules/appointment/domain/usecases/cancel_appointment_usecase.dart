import 'package:dental_care_mob/app/modules/appointment/domain/repositories/appointment_repository.dart';

class CancelAppointmentUseCase {
  final IAppointmentRepository _repository;

  CancelAppointmentUseCase({required IAppointmentRepository repository})
      : _repository = repository;

  Future<String> call(
    String id,
    String patientName,
    String cpf,
    String plan,
    String card,
  ) async {
    bool scheduled = false;
    bool editable = false;

    var response = await _repository.cancelAppointmentRepo(
        id, patientName, cpf, plan, card, scheduled, editable);
    return response;
  }
}
