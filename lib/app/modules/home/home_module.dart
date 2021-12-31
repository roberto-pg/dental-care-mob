import 'package:dental_care_mob/app/modules/home/domain/usecases/get_doctors_by_specialty_usecase.dart';
import 'package:dental_care_mob/app/modules/home/domain/usecases/get_doctors_usecase.dart';
import 'package:dental_care_mob/app/modules/home/external/home_datasource_impl.dart';
import 'package:dental_care_mob/app/modules/home/infra/repositories/home_repository_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'presenter/home_store.dart';

import 'presenter/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => HomeDatasourceImpl(customDioAuth: i())),
        Bind.lazySingleton((i) => HomeRepositoryImpl(datasource: i())),
        Bind.lazySingleton((i) => GetDoctorsUsecase(repository: i())),
        Bind.lazySingleton(
            (i) => GetDoctorsBySpecialtyUsecase(repository: i())),
        Bind.lazySingleton((i) => HomeStore(
              storage: i(),
              getDoctorsUsecase: i(),
              getDoctorsBySpecialtyUsecase: i(),
            )),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const HomePage()),
      ];
}
