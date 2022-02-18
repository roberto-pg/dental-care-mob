import 'package:dental_care_mob/shared/validators/validator.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class ValidatorImpl implements IValidator {
  final FlutterSecureStorage _storage;

  ValidatorImpl({required FlutterSecureStorage storage}) : _storage = storage;

  @override
  Future<bool> expiredToken() async {
    var token = await _storage.read(key: 'jwt');
    bool isTokenExpired = JwtDecoder.isExpired(token ?? '');

    return isTokenExpired;
  }

  @override
  Future<void> logoutUser() async {
    await _storage.deleteAll();
  }
}
