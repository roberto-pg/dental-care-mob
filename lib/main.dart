import 'package:dental_care_mob/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app/app_module.dart';

Future<void> main() async {
  await dotenv.load();

  Modular.to.addListener(() {
    // ignore: avoid_print
    print(Modular.to.path);
  });

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
