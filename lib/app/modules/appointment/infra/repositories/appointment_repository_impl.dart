import 'package:dental_care_mob/app/modules/appointment/domain/repositories/appointment_repository.dart';
import 'package:dental_care_mob/app/modules/appointment/external/appointment_user_model.dart';
import 'package:dental_care_mob/app/modules/appointment/infra/datasource/appointment_datasource.dart';

class AppointmentRepositoryImpl implements IAppointmentRepository {
  final IAppointmentDatasource _datasource;

  AppointmentRepositoryImpl({required IAppointmentDatasource datasource})
      : _datasource = datasource;

  @override
  Future<String> makeAppointmentRepo(String scheduleId, String cpf, String plan,
      String card, bool scheduled) async {
    var response = await _datasource.makeAppointmentData(
        scheduleId, cpf, plan, card, scheduled);
    return response;
  }

  @override
  Future<AppointmentUserModel> getUserByIdRepo(String userId) async {
    var response = await _datasource.getUserByIdData(userId);
    return response;
  }
}
