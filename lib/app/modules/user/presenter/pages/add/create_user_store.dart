import 'package:dental_care_mob/app/modules/user/domain/usecases/create_user_usecase.dart';
import 'package:dental_care_mob/app/modules/user/external/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'create_user_store.g.dart';

class CreateUserStore = _CreateUserStoreBase with _$CreateUserStore;

abstract class _CreateUserStoreBase with Store {
  final CreateUserUseCase _useCase;

  _CreateUserStoreBase({required CreateUserUseCase usecase}) : _useCase = usecase;

  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String cpf = '';

  @observable
  String password = '';

  @observable
  String plain = '';

  @observable
  String card = '';

  @action
  void saveName(String value) => name = value;

  @action
  void saveEmail(String value) => email = value;

  @action
  void saveCpf(String value) => cpf = value;

  @action
  void savePassword(String value) => password = value;

  @action
  void savePlain(String value) => plain = value;

  @action
  void saveCard(String value) => card = value;

  @computed
  String? get validateName => !RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(name)
      ? null
      : 'Informe o nome';

  @computed
  String? get validateEmail => email.contains('@') ? null : 'Email inválido';

  @computed
  String? get validateCpf =>
      cpf.length == 11 ? null : 'Cpf deve ter 11 caracteres';

  @computed
  String? get validatePassword =>
      password.length >= 6 ? null : 'Senha deve ter no mínimo 6 caracteres';

  @observable
  ObservableFuture<UserModel>? _createdUser;

  @observable
  UserModel? createdUser;

  @observable
  String? createdError;

  @action
  Future<void> createUser(String name, String email, String cpf, String plain,
      String card, String password) async {
    try {
      _createdUser =
          _useCase.call(name, email, cpf, password, plain, card).asObservable();
      createdUser = await _createdUser;
      createdUser = await _createdUser;
      Modular.to.pop();
    } catch (error) {
      createdError = error.toString();
    }
  }
}
