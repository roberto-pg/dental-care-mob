import 'package:dental_care_mob/app/modules/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final LoginUsecase _useCase;

  _AuthStoreBase({required LoginUsecase useCase}) : _useCase = useCase;

  @observable
  String cpf = '';

  @action
  void saveCpf(String value) => cpf = value;

  @computed
  String? get validateCpf =>
      cpf.length == 11 ? null : 'CPF deve ter 11 caracteres';

  @observable
  String password = '';

  @action
  void savePassword(String value) => password = value;

  @computed
  String? get validatePassword =>
      password.length >= 6 ? null : 'Senha deve ter no mínimo 6 caracteres';

  @observable
  ObservableFuture? _userLogin;

  @observable
  // ignore: prefer_typing_uninitialized_variables
  var userLogin;

  @observable
  String? loginError;

  @action
  Future<void> login(String cpf, String password) async {
    try {
      _userLogin = _useCase.call(cpf, password).asObservable();
      userLogin = await _userLogin;
      Modular.to.navigate('/home/');
    } catch (error) {
      loginError = error.toString();
    }
  }
}
