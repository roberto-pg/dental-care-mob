import 'package:dental_care_mob/app/modules/doctor/domain/usecases/get_doctor_by_id.usecase.dart';
import 'package:dental_care_mob/app/modules/doctor/domain/usecases/get_schedules_by_doctor_usecase.dart';
import 'package:dental_care_mob/app/modules/doctor/infra/repositories/doctor_repository_impl.dart';
import 'package:dental_care_mob/app/modules/doctor/presenter/doctor_page.dart';
import 'package:dental_care_mob/app/modules/doctor/presenter/doctor_store.dart';
import 'package:dental_care_mob/shared/validators/validator_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'external/doctor_datasource_impl.dart';

class DoctorModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => DoctorDatasourceImpl(customDioAuth: i())),
        Bind.lazySingleton((i) => DoctorRepositoryImpl(datasource: i())),
        Bind.lazySingleton((i) => GetDoctorByIdUseCase(repository: i())),
        Bind.lazySingleton((i) => GetSchedulesByDoctorUseCase(repository: i())),
        Bind.lazySingleton((i) => ValidatorImpl(storage: i())),
        Bind.lazySingleton((i) => DoctorStore(
              getDoctorByIdUseCase: i(),
              getSchedulesByDoctorUsecase: i(),
              validate: i(),
            )),
      ];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (_, args) => DoctorPage(doctorId: args.data))];
}
