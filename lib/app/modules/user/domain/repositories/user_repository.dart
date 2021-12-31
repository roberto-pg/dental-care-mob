import 'package:dental_care_mob/app/modules/user/external/user_model.dart';

abstract class IUserRepository {
  Future<UserModel> createUserRepo(
    String name,
    String email,
    String cpf,
    String password,
    String plain,
    String? card,
  );

  Future<UserModel> getUserRepo(String userId);
  Future<String> changeNameRepo(String userId, String name);
  Future<String> changeEmailRepo(String userId, String email);
  Future<String> changePasswordRepo(
      String userId, String oldPassword, String newPassword);
  Future<String> changePlanAndCardRepo(String userId, String plan, String card);
}
