import 'package:dental_care_mob/app/modules/doctor/infra/datasource/doctor_datasource.dart';
import 'package:dental_care_mob/app/modules/doctor/external/schedule_model.dart';
import 'package:dental_care_mob/shared/dio/custom_dio_auth.dart';
import 'package:dental_care_mob/shared/errors/exceptions.dart';
import 'package:dental_care_mob/app/modules/doctor/external/doctor_model.dart';
import 'package:dio/dio.dart';

class DoctorDatasourceImpl implements IDoctorDatasource {
  final CustomDioAuth _customDioAuth;

  DoctorDatasourceImpl({required CustomDioAuth customDioAuth})
      : _customDioAuth = customDioAuth;

  @override
  Future<DoctorModel> getDoctorByIdData(String id) async {
    try {
      var response = await _customDioAuth.get('/doctor-id/$id');
      return DoctorModel.fromJson(response.data);
    } on DioError catch (error) {
      if (error.type.toString() == 'DioErrorType.other') {
        throw const CustomException('Problema inesperado no servidor');
      } else {
        throw CustomException(error.response?.data['Error']);
      }
    }
  }

  @override
  Future<List<ScheduleModel>> getSchedulesByDoctorData(String doctorId) async {
    try {
      var response =
          await _customDioAuth.get<List>('/schedules-by-doctor-mobile/$doctorId');
      List<ScheduleModel>? schedules = response.data
          ?.map((schedule) => ScheduleModel.fromJson(schedule))
          .toList();
      return schedules ?? [];
    } on DioError catch (error) {
      if (error.type.toString() == 'DioErrorType.other') {
        throw const CustomException('Problema inesperado no servidor');
      } else {
        throw CustomException(error.response?.data['Error']);
      }
    }
  }
}
