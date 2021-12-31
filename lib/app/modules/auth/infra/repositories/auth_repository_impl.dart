import 'package:dental_care_mob/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:dental_care_mob/app/modules/auth/external/logged_user_model.dart';
import 'package:dental_care_mob/app/modules/auth/infra/datasource/auth_datasource.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final IAuthDatasource _datasource;
  final FlutterSecureStorage _storage;

  AuthRepositoryImpl(
      {required IAuthDatasource datasource,
      required FlutterSecureStorage storage})
      : _datasource = datasource,
        _storage = storage;

  @override
  Future<LoggedUserModel> loginRepo(String cpf, String password) async {
    var response = await _datasource.loginData(cpf, password);

    await _storage.write(key: 'loginKey', value: 'true');
    await _storage.write(key: 'userId', value: response.id);
    await _storage.write(key: 'jwt', value: response.token);
    await _storage.write(key: 'cpf', value: response.cpf);
    await _storage.write(key: 'plan', value: response.plan);
    await _storage.write(key: 'card', value: response.card ?? '');

    return response;
  }
}
