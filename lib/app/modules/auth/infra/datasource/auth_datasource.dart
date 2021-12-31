import 'package:dental_care_mob/app/modules/auth/external/logged_user_model.dart';

abstract class IAuthDatasource {
  Future<LoggedUserModel> loginData(String cpf, String password);
}
