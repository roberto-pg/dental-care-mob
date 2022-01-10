import 'package:dental_care_mob/app/modules/appointment/external/appointment_model.dart';
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

  @override
  Future<List<AppointmentModel>> getAppointmentByCpfData(String cpf) async {
    try {
      var response = await _customDioAuth
          .get<List>('/appointments-by-cpf/', queryParameters: {'cpf': cpf});
      List<AppointmentModel>? appointments = response.data
          ?.map((appointment) => AppointmentModel.fromJson(appointment))
          .toList();

      return appointments ?? [];
    } on DioError catch (error) {
      if (error.type.toString() == 'DioErrorType.other') {
        throw const CustomException('Problema inesperado no servidor');
      } else {
        throw CustomException(error.response?.data['Error']);
      }
    }
  }

  @override
  Future<String> cancelAppointmentData(
    String id,
    String patientName,
    String cpf,
    String plan,
    String card,
    bool scheduled,
    bool editable,
  ) async {
    try {
      var response = await _customDioAuth.patch('/destroy-appointment', data: {
        'id': id,
        'patientName': patientName,
        'cpf': cpf,
        'plan': plan,
        'card': card,
        'scheduled': scheduled,
        'editable': editable,
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
}
