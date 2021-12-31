import 'package:dental_care_mob/app/modules/appointment/appointment_module.dart';
import 'package:dental_care_mob/app/modules/doctor/doctor_module.dart';
import 'package:dental_care_mob/app/modules/splash/splash_store.dart';
import 'package:dental_care_mob/shared/dio/custom_dio.dart';
import 'package:dental_care_mob/shared/dio/custom_dio_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'modules/auth/auth_module.dart';
import 'modules/home/home_module.dart';
import 'modules/splash/splash_page.dart';
import 'modules/user/user_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => CustomDio()),
        Bind.singleton((i) => CustomDioAuth(storage: i())),
        Bind.singleton((i) => const FlutterSecureStorage()),
        Bind.singleton((i) => SplashStore(storage: i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashPage()),
        ModuleRoute('/auth', module: AuthModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/user', module: UserModule()),
        ModuleRoute('/doctor', module: DoctorModule()),
        ModuleRoute('/appointment', module: AppointmentModule())
      ];
}
