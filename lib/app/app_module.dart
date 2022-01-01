import 'package:dental_care_mob/app/modules/appointment/appointment_module.dart';
import 'package:dental_care_mob/app/modules/appointment/domain/usecases/get_user_by_id_usecase.dart';
import 'package:dental_care_mob/app/modules/doctor/doctor_module.dart';
import 'package:dental_care_mob/app/modules/splash/splash_store.dart';
import 'package:dental_care_mob/shared/dio/custom_dio.dart';
import 'package:dental_care_mob/shared/dio/custom_dio_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'modules/appointment/domain/usecases/make_appointment_usecase.dart';
import 'modules/appointment/external/appointment_datasource_impl.dart';
import 'modules/appointment/infra/repositories/appointment_repository_impl.dart';
import 'modules/appointment/presenter/appointment_store.dart';
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
        Bind.singleton((i) => SplashStore(storage: i())),
        Bind.singleton((i) => AppointmentDatasourceImpl(customDioAuth: i())),
        Bind.singleton((i) => AppointmentRepositoryImpl(datasource: i())),
        Bind.singleton(
            (i) => MakeAppointmentUseCase(repository: i(), storage: i())),
        Bind.singleton((i) => GetUserByIdUseCase(repository: i())),
        Bind.singleton((i) => AppointmentStore(
              makeAppointmentUseCase: i(),
              getUserByIdUseCase: i(),
              storage: i(),
            )),
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
