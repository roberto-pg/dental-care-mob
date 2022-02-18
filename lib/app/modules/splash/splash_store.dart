import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';

part 'splash_store.g.dart';

class SplashStore = _SplashStoreBase with _$SplashStore;

abstract class _SplashStoreBase with Store {
  final int splashDuration = 1000;

  final FlutterSecureStorage _storage;
  _SplashStoreBase({required FlutterSecureStorage storage})
      : _storage = storage;

  countDownTimeSplash() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      var logged = await _storage.read(key: 'loginKey');
      if (logged == 'true') {
        return Timer(Duration(milliseconds: splashDuration), () {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          Modular.to.navigate('/home/');
        });
      } else {
        return Timer(Duration(milliseconds: splashDuration), () {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          Modular.to.navigate('/auth/');
        });
      }
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
