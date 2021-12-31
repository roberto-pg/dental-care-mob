import 'package:dental_care_mob/app/modules/user/domain/repositories/user_repository.dart';

class ChangeEmailUseCase {
  final IUserRepository _repository;

  ChangeEmailUseCase({required IUserRepository repository})
      : _repository = repository;

  Future<String> call(String userId, String email) async {
    var response = await _repository.changeEmailRepo(userId, email);
    return response;
  }
}
