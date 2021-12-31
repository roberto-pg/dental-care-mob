import 'package:dental_care_mob/app/modules/doctor/external/schedule_model.dart';
import 'package:dental_care_mob/app/modules/doctor/external/doctor_model.dart';

abstract class IDoctorDatasource {
  Future<DoctorModel> getDoctorByIdData(String id);
  Future<List<ScheduleModel>> getSchedulesByDoctorData(String doctorId);
}
