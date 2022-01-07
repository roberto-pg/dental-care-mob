import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/appointment_page.dart';

class AppointmentModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (_, args) =>
                AppointmentPage(userId: args.data[0], userCpf: args.data[1])),
      ];
}
