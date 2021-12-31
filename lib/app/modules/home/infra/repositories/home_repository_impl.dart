import 'package:dental_care_mob/app/modules/home/domain/repositories/home_repository.dart';
import 'package:dental_care_mob/app/modules/home/external/doctor_home_model.dart';
import 'package:dental_care_mob/app/modules/home/infra/datasource/home_datasource.dart';

class HomeRepositoryImpl implements IHomeRepository {
  final IHomeDatasource _datasource;

  HomeRepositoryImpl({required IHomeDatasource datasource})
      : _datasource = datasource;

  @override
  Future<List<DoctorHomeModel>> getDoctorsRepo() async {
    var response = await _datasource.getDoctorsData();
    return response;
  }

  @override
  Future<List<DoctorHomeModel>> getDoctorsByEspecialtyRepo(String specialty) async {
    var response = await _datasource.getDoctorsByEspecialtyData(specialty);
    return response;
  }
}
