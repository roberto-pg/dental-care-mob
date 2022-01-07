import 'package:dental_care_mob/app/modules/appointment/external/appointment_model.dart';
import 'package:dental_care_mob/app/modules/appointment/external/appointment_user_model.dart';

abstract class IAppointmentDatasource {
  Future<String> makeAppointmentData(
      String scheduleId, String cpf, String plan, String card, bool scheduled);
  Future<AppointmentUserModel> getUserByIdData(String userId);
  Future<List<AppointmentModel>> getAppointmentByCpfData(String cpf);
}
