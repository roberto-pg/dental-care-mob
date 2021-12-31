import 'package:asuka/asuka.dart' as asuka;
import 'package:dental_care_mob/shared/utils/device_orientation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    portraitModeOnly();
    return MaterialApp(
      builder: asuka.builder,
      title: 'Dental Care',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
    ).modular();
  }
}
