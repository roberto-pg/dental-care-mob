import 'package:dental_care_mob/app/modules/doctor/external/schedule_model.dart';
import 'package:dental_care_mob/app/modules/doctor/external/doctor_model.dart';

abstract class IDoctorRepository {
  Future<DoctorModel> getDoctorByIdRepo(String id);
  Future<List<ScheduleModel>> getSchedulesByDoctorRepo(String doctorId);
}
