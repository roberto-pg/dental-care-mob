import 'package:dental_care_mob/app/modules/user/domain/repositories/user_repository.dart';

class ChangePasswordUseCase {
  final IUserRepository _repository;

  ChangePasswordUseCase({required IUserRepository repository})
      : _repository = repository;

  Future<String> call(
      String userId, String oldPassword, String newPassword) async {
    var response =
        await _repository.changePasswordRepo(userId, oldPassword, newPassword);
    return response;
  }
}
