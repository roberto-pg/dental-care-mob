import 'package:dental_care_mob/app/modules/home/external/doctor_home_model.dart';

abstract class IHomeDatasource {
  Future<List<DoctorHomeModel>> getDoctorsData();
  Future<List<DoctorHomeModel>> getDoctorsByEspecialtyData(String specialty);
}
