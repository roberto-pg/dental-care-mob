import 'package:dental_care_mob/app/modules/auth/external/logged_user_model.dart';

abstract class IAuthRepository {
  Future<LoggedUserModel> loginRepo(String cpf, String password);
}
