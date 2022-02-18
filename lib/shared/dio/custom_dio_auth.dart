import 'package:dental_care_mob/shared/validators/validator.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../config.dart';
import 'interceptors/auth_interceptor.dart';

class CustomDioAuth extends DioForNative {
  final FlutterSecureStorage _storage;
  final IValidator _validate;

  static final _baseOptions = BaseOptions(
    baseUrl: Config.baseUrl,
    connectTimeout: 20000,
    receiveTimeout: 20000,
  );

  CustomDioAuth(
      {required FlutterSecureStorage storage, required IValidator validate})
      : _storage = storage,
        _validate = validate,
        super(_baseOptions) {
    interceptors.addAll([
      AuthInterceptor(storage: _storage, validate: _validate),
    ]);
  }
}
