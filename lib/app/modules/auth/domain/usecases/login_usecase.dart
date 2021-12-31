import 'package:dental_care_mob/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:dental_care_mob/app/modules/auth/external/logged_user_model.dart';

class LoginUsecase {
  final IAuthRepository _repository;

  LoginUsecase({required IAuthRepository repository})
      : _repository = repository;

  Future<LoggedUserModel> call(String cpf, String password) async {
    var response = await _repository.loginRepo(cpf, password);
    return response;
  }
}
