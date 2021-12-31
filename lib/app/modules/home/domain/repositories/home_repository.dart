import 'package:dental_care_mob/app/modules/home/external/doctor_home_model.dart';

abstract class IHomeRepository {
  Future<List<DoctorHomeModel>> getDoctorsRepo();
  Future<List<DoctorHomeModel>> getDoctorsByEspecialtyRepo(String specialty);
}
