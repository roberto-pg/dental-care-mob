import 'package:dental_care_mob/app/modules/user/domain/usecases/change_email_usecase.dart';
import 'package:dental_care_mob/app/modules/user/domain/usecases/change_name_usecase.dart';
import 'package:dental_care_mob/app/modules/user/domain/usecases/change_password_usecase.dart';
import 'package:dental_care_mob/app/modules/user/domain/usecases/change_plan_and_card_usecase.dart';
import 'package:dental_care_mob/app/modules/user/domain/usecases/get_user_usecase.dart';
import 'package:dental_care_mob/app/modules/user/external/user_model.dart';
import 'package:mobx/mobx.dart';

part 'account_store.g.dart';

class AccountStore = _AccountStoreBase with _$AccountStore;

abstract class _AccountStoreBase with Store {
  final GetUserUseCase _getUseCase;
  final ChangeNameUseCase _changeNameUseCase;
  final ChangeEmailUseCase _changeEmailUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;
  final ChangePlanAndCardUsecase _changePlanAndCardUseCase;

  _AccountStoreBase(
      {required GetUserUseCase getUseCase,
      required ChangeNameUseCase changeNameUseCase,
      required ChangeEmailUseCase changeEmailUseCase,
      required ChangePasswordUseCase changePasswordUseCase,
      required ChangePlanAndCardUsecase changePlanAndCardUsecase})
      : _getUseCase = getUseCase,
        _changeNameUseCase = changeNameUseCase,
        _changeEmailUseCase = changeEmailUseCase,
        _changePasswordUseCase = changePasswordUseCase,
        _changePlanAndCardUseCase = changePlanAndCardUsecase;

  @observable
  String name = '';

  @action
  void saveName(String value) => name = value;

  @computed
  String? get validateName => name.isNotEmpty ? null : 'Digite o novo nome';

  @observable
  ObservableFuture<String>? _alteredName;

  @observable
  String? alteredName;

  @observable
  String? errorName;

  @action
  void saveErrorName(String value) => errorName = value;

  @action
  void saveAlteredName(String value) => alteredName = value;

  @action
  Future<void> changeName(String userId, String name) async {
    try {
      _alteredName = _changeNameUseCase
          .call(
            userId,
            name,
          )
          .asObservable();
      alteredName = await _alteredName;
    } catch (error) {
      errorName = error.toString();
    }
  }

  @observable
  String email = '';

  @action
  void saveEmail(String value) => email = value;

  @computed
  String? get validateEmail => email.isNotEmpty ? null : 'Digite o novo email';

  @observable
  ObservableFuture<String>? _alteredEmail;

  @observable
  String? alteredEmail;

  @observable
  String? errorEmail;

  @action
  void saveErrorEmail(String value) => errorEmail = value;

  @action
  void saveAlteredEmail(String value) => alteredEmail = value;

  @action
  Future<void> changeEmail(String userId, String email) async {
    try {
      _alteredEmail = _changeEmailUseCase
          .call(
            userId,
            email,
          )
          .asObservable();
      alteredEmail = await _alteredEmail;
    } catch (error) {
      errorEmail = error.toString();
    }
  }

  @observable
  String oldPassword = '';

  @action
  void saveOldPassword(String value) => oldPassword = value;

  @computed
  String? get validateOldPassword =>
      oldPassword.isNotEmpty ? null : 'Senha menor de 6 caracteres';

  @observable
  String newPassword = '';

  @action
  void saveNewPassword(String value) => newPassword = value;

  @computed
  String? get validateNewPassword =>
      newPassword.isNotEmpty ? null : 'Senha menor de 6 caracteres';

  @observable
  ObservableFuture<String>? _alteredPassword;

  @observable
  String? alteredPassword;

  @observable
  String? errorPassword;

  @action
  void saveAlteredPassword(String value) => alteredPassword = value;

  @action
  void saveErrorPassword(String value) => errorPassword = value;

  @action
  Future<void> changePassword(
      String userId, String oldPassword, String newPassword) async {
    try {
      _alteredPassword = _changePasswordUseCase
          .call(
            userId,
            oldPassword,
            newPassword,
          )
          .asObservable();
      alteredPassword = await _alteredPassword ?? '';
    } catch (error) {
      errorPassword = error.toString();
    }
  }

  @observable
  String plan = '';

  @action
  void savePlan(String value) => plan = value;

  @observable
  String card = '';

  @action
  void saveCard(String value) => card = value;

  @observable
  ObservableFuture<String>? _alteredPlanAndCard;

  @observable
  String? alteredPlanAndCard;

  @observable
  String? errorPlanAndCard;

  @action
  void saveAlteredPlanAndCard(String value) => alteredPlanAndCard = value;

  @action
  void saveErrorPlanAndCard(String value) => errorPlanAndCard = value;

  @action
  Future<void> changePlanAndCard(
      String userId, String plan, String card) async {
    try {
      _alteredPlanAndCard =
          _changePlanAndCardUseCase.call(userId, plan, card).asObservable();
      alteredPlanAndCard = await _alteredPlanAndCard;
    } catch (error) {
      errorPlanAndCard = error.toString();
    }
  }

  @observable
  ObservableFuture<UserModel>? _userById;

  @observable
  UserModel? userById;

  @observable
  String? userError;

  @action
  Future<void> getUserById(String userId) async {
    try {
      _userById = _getUseCase.call(userId).asObservable();
      userById = await _userById;
    } catch (error) {
      userError = error.toString();
    }
  }
}
