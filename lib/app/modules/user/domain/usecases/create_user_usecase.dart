import 'package:dental_care_mob/app/modules/user/domain/repositories/user_repository.dart';
import 'package:dental_care_mob/app/modules/user/external/user_model.dart';

class CreateUserUseCase {
  final IUserRepository _repository;

  CreateUserUseCase({required IUserRepository repository})
      : _repository = repository;

  Future<UserModel> call(
    String name,
    String email,
    String cpf,
    String password,
    String plain,
    String? card,
  ) async {
    var response = await _repository.createUserRepo(
      name,
      email,
      cpf,
      password,
      plain,
      card,
    );
    return response;
  }
}
