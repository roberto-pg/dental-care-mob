import 'package:dental_care_mob/app/modules/home/infra/datasource/home_datasource.dart';
import 'package:dental_care_mob/shared/dio/custom_dio_auth.dart';
import 'package:dental_care_mob/shared/errors/exceptions.dart';
import 'package:dio/dio.dart';

import 'doctor_home_model.dart';

class HomeDatasourceImpl implements IHomeDatasource {
  final CustomDioAuth _customDioAuth;

  HomeDatasourceImpl({required CustomDioAuth customDioAuth})
      : _customDioAuth = customDioAuth;

  @override
  Future<List<DoctorHomeModel>> getDoctorsData() async {
    try {
      var response = await _customDioAuth.get<List>('/doctors');
      List<DoctorHomeModel> doctors =
          response.data!.map((doctor) => DoctorHomeModel.fromJson(doctor)).toList();
      return doctors;
    } on DioError catch (error) {
      if (error.type.toString() == 'DioErrorType.other') {
        throw const CustomException('Problema inesperado no servidor');
      } else {
        throw CustomException(error.response?.data['Error']);
      }
    }
  }

  @override
  Future<List<DoctorHomeModel>> getDoctorsByEspecialtyData(String specialty) async {
    try {
      var response =
          await _customDioAuth.get<List>('/doctors-specialty/$specialty');
      List<DoctorHomeModel>? doctors =
          response.data?.map((doctor) => DoctorHomeModel.fromJson(doctor)).toList();
      return doctors ?? [];
    } on DioError catch (error) {
      if (error.type.toString() == 'DioErrorType.other') {
        throw const CustomException('Problema inesperado no servidor');
      } else {
        throw CustomException(error.response?.data['Error']);
      }
    }
  }
}
