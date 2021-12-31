import 'package:dental_care_mob/app/modules/doctor/domain/repositories/doctor_repository.dart';
import 'package:dental_care_mob/app/modules/doctor/infra/datasource/doctor_datasource.dart';
import 'package:dental_care_mob/app/modules/doctor/external/schedule_model.dart';
import 'package:dental_care_mob/app/modules/doctor/external/doctor_model.dart';

class DoctorRepositoryImpl implements IDoctorRepository {
  final IDoctorDatasource _datasource;
  DoctorRepositoryImpl({required IDoctorDatasource datasource})
      : _datasource = datasource;

  @override
  Future<DoctorModel> getDoctorByIdRepo(String id) async {
    var response = await _datasource.getDoctorByIdData(id);
    return response;
  }

  @override
  Future<List<ScheduleModel>> getSchedulesByDoctorRepo(String doctorId) async {
    var response = await _datasource.getSchedulesByDoctorData(doctorId);
    return response;
  }
}
