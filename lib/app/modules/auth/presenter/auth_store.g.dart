// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStoreBase, Store {
  Computed<String?>? _$validateCpfComputed;

  @override
  String? get validateCpf =>
      (_$validateCpfComputed ??= Computed<String?>(() => super.validateCpf,
              name: '_AuthStoreBase.validateCpf'))
          .value;
  Computed<String?>? _$validatePasswordComputed;

  @override
  String? get validatePassword => (_$validatePasswordComputed ??=
          Computed<String?>(() => super.validatePassword,
              name: '_AuthStoreBase.validatePassword'))
      .value;

  final _$cpfAtom = Atom(name: '_AuthStoreBase.cpf');

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  final _$passwordAtom = Atom(name: '_AuthStoreBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$_userLoginAtom = Atom(name: '_AuthStoreBase._userLogin');

  @override
  ObservableFuture<dynamic>? get _userLogin {
    _$_userLoginAtom.reportRead();
    return super._userLogin;
  }

  @override
  set _userLogin(ObservableFuture<dynamic>? value) {
    _$_userLoginAtom.reportWrite(value, super._userLogin, () {
      super._userLogin = value;
    });
  }

  final _$userLoginAtom = Atom(name: '_AuthStoreBase.userLogin');

  @override
  dynamic get userLogin {
    _$userLoginAtom.reportRead();
    return super.userLogin;
  }

  @override
  set userLogin(dynamic value) {
    _$userLoginAtom.reportWrite(value, super.userLogin, () {
      super.userLogin = value;
    });
  }

  final _$loginErrorAtom = Atom(name: '_AuthStoreBase.loginError');

  @override
  String? get loginError {
    _$loginErrorAtom.reportRead();
    return super.loginError;
  }

  @override
  set loginError(String? value) {
    _$loginErrorAtom.reportWrite(value, super.loginError, () {
      super.loginError = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_AuthStoreBase.login');

  @override
  Future<void> login(String cpf, String password) {
    return _$loginAsyncAction.run(() => super.login(cpf, password));
  }

  final _$_AuthStoreBaseActionController =
      ActionController(name: '_AuthStoreBase');

  @override
  void saveCpf(String value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.saveCpf');
    try {
      return super.saveCpf(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void savePassword(String value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.savePassword');
    try {
      return super.savePassword(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cpf: ${cpf},
password: ${password},
userLogin: ${userLogin},
loginError: ${loginError},
validateCpf: ${validateCpf},
validatePassword: ${validatePassword}
    ''';
  }
}
