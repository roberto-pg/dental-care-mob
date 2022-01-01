import 'package:dental_care_mob/app/modules/appointment/external/appointment_user_model.dart';
import 'package:dental_care_mob/app/modules/appointment/infra/datasource/appointment_datasource.dart';
import 'package:dental_care_mob/shared/dio/custom_dio_auth.dart';
import 'package:dental_care_mob/shared/errors/exceptions.dart';
import 'package:dio/dio.dart';

class AppointmentDatasourceImpl implements IAppointmentDatasource {
  final CustomDioAuth _customDioAuth;

  AppointmentDatasourceImpl({required CustomDioAuth customDioAuth})
      : _customDioAuth = customDioAuth;

  @override
  Future<String> makeAppointmentData(String scheduleId, String cpf, String plan,
      String card, bool scheduled) async {
    try {
      var response = await _customDioAuth.patch('/create-appointment', data: {
        'scheduleId': scheduleId,
        'cpf': cpf,
        'plan': plan,
        'card': card,
        'scheduled': scheduled
      });
      return response.data;
    } on DioError catch (error) {
      if (error.type.toString() == 'DioErrorType.other') {
        throw const CustomException('Problema inesperado no servidor');
      } else {
        throw CustomException(error.response?.data['Error']);
      }
    }
  }

  @override
  Future<AppointmentUserModel> getUserByIdData(String userId) async {
    try {
      var response = await _customDioAuth.get('/user-id/$userId');
      return AppointmentUserModel.fromJson(response.data);
    } on DioError catch (error) {
      if (error.type.toString() == 'DioErrorType.other') {
        throw const CustomException('Problema inesperado no servidor');
      } else {
        throw CustomException(error.response?.data['Error']);
      }
    }
  }
}
