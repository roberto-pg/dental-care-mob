import 'package:dental_care_mob/app/modules/user/external/user_model.dart';
import 'package:dental_care_mob/app/modules/user/infra/datasource/user_datasource.dart';
import 'package:dental_care_mob/shared/dio/custom_dio.dart';
import 'package:dental_care_mob/shared/dio/custom_dio_auth.dart';
import 'package:dental_care_mob/shared/errors/exceptions.dart';
import 'package:dio/dio.dart';

class UserDatasourceImpl implements IUserDatasource {
  final CustomDioAuth _customDioAuth;
  final CustomDio _customDio;

  UserDatasourceImpl(
      {required CustomDioAuth customDioAuth, required CustomDio customDio})
      : _customDioAuth = customDioAuth,
        _customDio = customDio;

  @override
  Future<UserModel> createUserData(
    String name,
    String email,
    String cpf,
    String password,
    String plain,
    String? card,
  ) async {
    try {
      var response = await _customDio.post('/users', data: {
        'name': name,
        'email': email,
        'cpf': cpf,
        'password': password,
        'plain': plain,
        'card': card,
      });
      return UserModel.fromJson(response.data);
    } on DioError catch (error) {
      if (error.type.toString() == 'DioErrorType.other') {
        throw const CustomException('Problema inesperado no servidor');
      } else {
        throw CustomException(error.response?.data['Error']);
      }
    }
  }

  @override
  Future<UserModel> getUserData(String userId) async {
    try {
      var response = await _customDioAuth.get('/user-id/$userId');
      return UserModel.fromJson(response.data);
    } on DioError catch (error) {
      if (error.type.toString() == 'DioErrorType.other') {
        throw const CustomException('Problema inesperado no servidor');
      } else {
        throw CustomException(error.response?.data['Error']);
      }
    }
  }

  @override
  Future<String> changeNameData(String userId, String name) async {
    try {
      var response = await _customDioAuth.patch('/user-name', data: {
        'id': userId,
        'name': name,
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
  Future<String> changeEmailData(String userId, String email) async {
    try {
      var response = await _customDioAuth.patch('/user-email', data: {
        'id': userId,
        'email': email,
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
  Future<String> changePasswordData(
      String userId, String oldPassword, String newPassword) async {
    try {
      var response = await _customDioAuth.patch('/user-password', data: {
        'id': userId,
        'oldPassword': oldPassword,
        'newPassword': newPassword,
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
  Future<String> changePlanAndCardData(
      String userId, String plan, String card) async {
    try {
      var response = await _customDioAuth.patch('/user-plain-and-card', data: {
        'id': userId,
        'plan': plan,
        'card': card,
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
