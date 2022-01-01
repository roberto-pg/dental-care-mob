import 'package:dental_care_mob/app/modules/appointment/external/appointment_user_model.dart';

abstract class IAppointmentRepository {
  Future<String> makeAppointmentRepo(
      String scheduleId, String cpf, String plan, String card, bool scheduled);
  Future<AppointmentUserModel> getUserByIdRepo(String userId);
}
