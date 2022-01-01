import 'package:dental_care_mob/app/modules/appointment/presenter/appointment_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

// import 'domain/usecases/make_appointment_usecase.dart';
// import 'external/appointment_datasource_impl.dart';
// import 'infra/repositories/appointment_repository_impl.dart';
// import 'presenter/appointment_store.dart';

class AppointmentModule extends Module {
  @override
  List<Bind> get binds => [
        // Bind.singleton((i) => AppointmentDatasourceImpl(customDioAuth: i())),
        // Bind.singleton((i) => AppointmentRepositoryImpl(datasource: i())),
        // Bind.singleton(
        //     (i) => MakeAppointmentUseCase(repository: i(), storage: i())),
        // Bind.singleton((i) => AppointmentStore(makeAppointmentUseCase: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/main', child: (_, args) => const AppointmentPage()),
      ];
}
