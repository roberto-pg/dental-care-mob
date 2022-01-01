import 'package:dental_care_mob/app/modules/appointment/presenter/appointment_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppointmentModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => AppointmentPage(userId: args.data)),
      ];
}
