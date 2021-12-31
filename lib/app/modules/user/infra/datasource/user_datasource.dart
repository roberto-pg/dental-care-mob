import 'package:dental_care_mob/app/modules/user/external/user_model.dart';

abstract class IUserDatasource {
  Future<UserModel> createUserData(
    String name,
    String email,
    String cpf,
    String password,
    String plain,
    String? card,
  );

  Future<UserModel> getUserData(String userId);
  Future<String> changeNameData(String userId, String name);
  Future<String> changeEmailData(String userId, String email);
  Future<String> changePasswordData(
      String userId, String oldPassword, String newPassword);
  Future<String> changePlanAndCardData(String userId, String plan, String card);
}
