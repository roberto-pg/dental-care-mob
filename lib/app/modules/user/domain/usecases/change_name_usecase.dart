import 'package:dental_care_mob/app/modules/user/domain/repositories/user_repository.dart';

class ChangeNameUseCase {
  final IUserRepository _repository;

  ChangeNameUseCase({required IUserRepository repository})
      : _repository = repository;

  Future<String> call(String userId, String name) async {
    var response = await _repository.changeNameRepo(userId, name);
    return response;
  }
}
