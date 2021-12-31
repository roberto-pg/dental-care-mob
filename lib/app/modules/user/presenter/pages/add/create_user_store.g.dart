// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateUserStore on _CreateUserStoreBase, Store {
  Computed<String?>? _$validateNameComputed;

  @override
  String? get validateName =>
      (_$validateNameComputed ??= Computed<String?>(() => super.validateName,
              name: '_CreateUserStoreBase.validateName'))
          .value;
  Computed<String?>? _$validateEmailComputed;

  @override
  String? get validateEmail =>
      (_$validateEmailComputed ??= Computed<String?>(() => super.validateEmail,
              name: '_CreateUserStoreBase.validateEmail'))
          .value;
  Computed<String?>? _$validateCpfComputed;

  @override
  String? get validateCpf =>
      (_$validateCpfComputed ??= Computed<String?>(() => super.validateCpf,
              name: '_CreateUserStoreBase.validateCpf'))
          .value;
  Computed<String?>? _$validatePasswordComputed;

  @override
  String? get validatePassword => (_$validatePasswordComputed ??=
          Computed<String?>(() => super.validatePassword,
              name: '_CreateUserStoreBase.validatePassword'))
      .value;

  final _$nameAtom = Atom(name: '_CreateUserStoreBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$emailAtom = Atom(name: '_CreateUserStoreBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$cpfAtom = Atom(name: '_CreateUserStoreBase.cpf');

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

  final _$passwordAtom = Atom(name: '_CreateUserStoreBase.password');

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

  final _$plainAtom = Atom(name: '_CreateUserStoreBase.plain');

  @override
  String get plain {
    _$plainAtom.reportRead();
    return super.plain;
  }

  @override
  set plain(String value) {
    _$plainAtom.reportWrite(value, super.plain, () {
      super.plain = value;
    });
  }

  final _$cardAtom = Atom(name: '_CreateUserStoreBase.card');

  @override
  String get card {
    _$cardAtom.reportRead();
    return super.card;
  }

  @override
  set card(String value) {
    _$cardAtom.reportWrite(value, super.card, () {
      super.card = value;
    });
  }

  final _$_createdUserAtom = Atom(name: '_CreateUserStoreBase._createdUser');

  @override
  ObservableFuture<UserModel>? get _createdUser {
    _$_createdUserAtom.reportRead();
    return super._createdUser;
  }

  @override
  set _createdUser(ObservableFuture<UserModel>? value) {
    _$_createdUserAtom.reportWrite(value, super._createdUser, () {
      super._createdUser = value;
    });
  }

  final _$createdUserAtom = Atom(name: '_CreateUserStoreBase.createdUser');

  @override
  UserModel? get createdUser {
    _$createdUserAtom.reportRead();
    return super.createdUser;
  }

  @override
  set createdUser(UserModel? value) {
    _$createdUserAtom.reportWrite(value, super.createdUser, () {
      super.createdUser = value;
    });
  }

  final _$createdErrorAtom = Atom(name: '_CreateUserStoreBase.createdError');

  @override
  String? get createdError {
    _$createdErrorAtom.reportRead();
    return super.createdError;
  }

  @override
  set createdError(String? value) {
    _$createdErrorAtom.reportWrite(value, super.createdError, () {
      super.createdError = value;
    });
  }

  final _$createUserAsyncAction =
      AsyncAction('_CreateUserStoreBase.createUser');

  @override
  Future<void> createUser(String name, String email, String cpf, String plain,
      String card, String password) {
    return _$createUserAsyncAction
        .run(() => super.createUser(name, email, cpf, plain, card, password));
  }

  final _$_CreateUserStoreBaseActionController =
      ActionController(name: '_CreateUserStoreBase');

  @override
  void saveName(String value) {
    final _$actionInfo = _$_CreateUserStoreBaseActionController.startAction(
        name: '_CreateUserStoreBase.saveName');
    try {
      return super.saveName(value);
    } finally {
      _$_CreateUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveEmail(String value) {
    final _$actionInfo = _$_CreateUserStoreBaseActionController.startAction(
        name: '_CreateUserStoreBase.saveEmail');
    try {
      return super.saveEmail(value);
    } finally {
      _$_CreateUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveCpf(String value) {
    final _$actionInfo = _$_CreateUserStoreBaseActionController.startAction(
        name: '_CreateUserStoreBase.saveCpf');
    try {
      return super.saveCpf(value);
    } finally {
      _$_CreateUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void savePassword(String value) {
    final _$actionInfo = _$_CreateUserStoreBaseActionController.startAction(
        name: '_CreateUserStoreBase.savePassword');
    try {
      return super.savePassword(value);
    } finally {
      _$_CreateUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void savePlain(String value) {
    final _$actionInfo = _$_CreateUserStoreBaseActionController.startAction(
        name: '_CreateUserStoreBase.savePlain');
    try {
      return super.savePlain(value);
    } finally {
      _$_CreateUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveCard(String value) {
    final _$actionInfo = _$_CreateUserStoreBaseActionController.startAction(
        name: '_CreateUserStoreBase.saveCard');
    try {
      return super.saveCard(value);
    } finally {
      _$_CreateUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
cpf: ${cpf},
password: ${password},
plain: ${plain},
card: ${card},
createdUser: ${createdUser},
createdError: ${createdError},
validateName: ${validateName},
validateEmail: ${validateEmail},
validateCpf: ${validateCpf},
validatePassword: ${validatePassword}
    ''';
  }
}
