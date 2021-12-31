import 'package:dental_care_mob/app/modules/auth/external/logged_user_model.dart';
import 'package:dental_care_mob/app/modules/auth/infra/datasource/auth_datasource.dart';
import 'package:dental_care_mob/shared/dio/custom_dio.dart';
import 'package:dental_care_mob/shared/errors/exceptions.dart';
import 'package:dio/dio.dart';

class AuthDatasourceImpl implements IAuthDatasource {
  final CustomDio _customDio;

  AuthDatasourceImpl({required CustomDio customDio}) : _customDio = customDio;

  @override
  Future<LoggedUserModel> loginData(String cpf, String password) async {
    try {
      var response = await _customDio
          .post('/authenticate-user', data: {'cpf': cpf, 'password': password});
      return LoggedUserModel.fromJson(response.data);
    } on DioError catch (error) {
      if (error.type.toString() == 'DioErrorType.other') {
        throw const CustomException('Problema inesperado no servidor');
      } else {
        throw CustomException(error.response?.data['Error']);
      }
    }
  }
}
