import 'package:dental_care_mob/app/modules/appointment/domain/repositories/appointment_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MakeAppointmentUseCase {
  final IAppointmentRepository _repository;
  final FlutterSecureStorage _storage;

  MakeAppointmentUseCase(
      {required IAppointmentRepository repository,
      required FlutterSecureStorage storage})
      : _repository = repository,
        _storage = storage;

  Future<String> call(String scheduleId) async {
    String cpf = await _storage.read(key: 'cpf') ?? '';
    String plan = await _storage.read(key: 'plan') ?? '';
    String card = await _storage.read(key: 'card') ?? '';
    bool scheduled = true;

    var response = await _repository.makeAppointmentRepo(
        scheduleId, cpf, plan, card, scheduled);

    return response;
  }
}
