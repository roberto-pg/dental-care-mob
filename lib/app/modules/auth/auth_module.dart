import 'package:dental_care_mob/app/modules/auth/domain/usecases/login_usecase.dart';
import 'package:dental_care_mob/app/modules/auth/external/auth_datasource_impl.dart';
import 'package:dental_care_mob/app/modules/auth/infra/repositories/auth_repository_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/auth_page.dart';
import 'presenter/auth_store.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => AuthDatasourceImpl(customDio: i())),
        Bind.singleton(
            (i) => AuthRepositoryImpl(datasource: i(), storage: i())),
        Bind.singleton((i) => LoginUsecase(repository: i())),
        Bind.singleton((i) => AuthStore(useCase: i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const AuthPage()),
      ];
}
