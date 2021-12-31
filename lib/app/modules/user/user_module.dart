import 'package:dental_care_mob/app/modules/user/domain/usecases/change_name_usecase.dart';
import 'package:dental_care_mob/app/modules/user/domain/usecases/change_password_usecase.dart';
import 'package:dental_care_mob/app/modules/user/domain/usecases/change_plan_and_card_usecase.dart';
import 'package:dental_care_mob/app/modules/user/domain/usecases/get_user_usecase.dart';
import 'package:dental_care_mob/app/modules/user/external/user_datasource_impl.dart';
import 'package:dental_care_mob/app/modules/user/infra/repositories/user_repository_impl.dart';
import 'package:dental_care_mob/app/modules/user/presenter/pages/account/account_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/change_email_usecase.dart';
import 'domain/usecases/create_user_usecase.dart';
import 'presenter/pages/account/account_page.dart';
import 'presenter/pages/add/create_user_page.dart';
import 'presenter/pages/add/create_user_store.dart';

class UserModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
            (i) => UserDatasourceImpl(customDioAuth: i(), customDio: i())),
        Bind.singleton((i) => UserRepositoryImpl(datasource: i())),
        Bind.singleton((i) => CreateUserUseCase(repository: i())),
        Bind.singleton((i) => CreateUserStore(usecase: i())),
        Bind.singleton((i) => GetUserUseCase(repository: i())),
        Bind.singleton((i) => ChangeNameUseCase(repository: i())),
        Bind.singleton((i) => ChangeEmailUseCase(repository: i())),
        Bind.singleton((i) => ChangePasswordUseCase(repository: i())),
        Bind.singleton((i) => ChangePlanAndCardUsecase(repository: i())),
        Bind.singleton((i) => AccountStore(
              getUseCase: i(),
              changeNameUseCase: i(),
              changeEmailUseCase: i(),
              changePasswordUseCase: i(),
              changePlanAndCardUsecase: i(),
            )),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/register', child: (_, args) => const CreateUserPage()),
        ChildRoute('/account',
            child: (_, args) => AccountPage(userId: args.data)),
      ];
}
