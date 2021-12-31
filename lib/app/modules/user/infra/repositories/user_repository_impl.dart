import 'package:dental_care_mob/app/modules/user/domain/repositories/user_repository.dart';
import 'package:dental_care_mob/app/modules/user/external/user_model.dart';
import 'package:dental_care_mob/app/modules/user/infra/datasource/user_datasource.dart';

class UserRepositoryImpl implements IUserRepository {
  final IUserDatasource _datasource;

  UserRepositoryImpl({required IUserDatasource datasource})
      : _datasource = datasource;

  @override
  Future<UserModel> createUserRepo(
    String name,
    String email,
    String cpf,
    String password,
    String plain,
    String? card,
  ) async {
    var response = await _datasource.createUserData(
      name,
      email,
      cpf,
      password,
      plain,
      card,
    );
    return response;
  }

  @override
  Future<UserModel> getUserRepo(String userId) async {
    var response = await _datasource.getUserData(userId);
    return response;
  }

  @override
  Future<String> changeNameRepo(String userId, String name) async {
    var response = await _datasource.changeNameData(userId, name);
    return response;
  }

  @override
  Future<String> changeEmailRepo(String userId, String email) async {
    var response = await _datasource.changeEmailData(userId, email);
    return response;
  }

  @override
  Future<String> changePasswordRepo(
      String userId, String oldPassword, String newPassword) async {
    var response =
        await _datasource.changePasswordData(userId, oldPassword, newPassword);
    return response;
  }

  @override
  Future<String> changePlanAndCardRepo(
      String userId, String plan, String card) async {
    var response = await _datasource.changePlanAndCardData(userId, plan, card);
    return response;
  }
}
