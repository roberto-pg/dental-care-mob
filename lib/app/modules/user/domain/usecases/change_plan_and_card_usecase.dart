import 'package:dental_care_mob/app/modules/user/domain/repositories/user_repository.dart';

class ChangePlanAndCardUsecase {
  final IUserRepository _repository;

  ChangePlanAndCardUsecase({required IUserRepository repository})
      : _repository = repository;

  Future<String> call(String userId, String plan, String card) async {
    var response = await _repository.changePlanAndCardRepo(userId, plan, card);
    return response;
  }
}
