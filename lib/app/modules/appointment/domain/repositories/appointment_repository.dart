import 'package:dental_care_mob/app/modules/appointment/external/appointment_model.dart';
import 'package:dental_care_mob/app/modules/appointment/external/appointment_user_model.dart';

abstract class IAppointmentRepository {
  Future<String> makeAppointmentRepo(
      String scheduleId, String cpf, String plan, String card, bool scheduled);
  Future<AppointmentUserModel> getUserByIdRepo(String userId);
  Future<List<AppointmentModel>> getAppointmentByCpfRepo(String cpf);
  Future<String> cancelAppointmentRepo(
    String id,
    String patientName,
    String cpf,
    String plan,
    String card,
    bool scheduled,
    bool editable,
  );
}
