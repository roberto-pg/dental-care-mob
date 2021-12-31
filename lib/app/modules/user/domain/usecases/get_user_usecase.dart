import 'package:dental_care_mob/app/modules/user/domain/repositories/user_repository.dart';
import 'package:dental_care_mob/app/modules/user/external/user_model.dart';

class GetUserUseCase {
  final IUserRepository _repository;

  GetUserUseCase({required IUserRepository repository})
      : _repository = repository;

  Future<UserModel> call(String userId) async {
    var response = await _repository.getUserRepo(userId);
    return response;
  }
}
