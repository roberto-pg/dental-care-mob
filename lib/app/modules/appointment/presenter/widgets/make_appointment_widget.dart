import 'package:dental_care_mob/shared/alerts/dialog_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../appointment_store.dart';

class MakeAppointmentWidget extends StatefulWidget {
  final String scheduleId;

  const MakeAppointmentWidget({Key? key, required this.scheduleId})
      : super(key: key);

  @override
  _MakeAppointmentWidgetState createState() => _MakeAppointmentWidgetState();
}

class _MakeAppointmentWidgetState
    extends ModularState<MakeAppointmentWidget, AppointmentStore> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green[50],
      title: const Text('Agendamento'),
      content: const Text('Confirmar o agendamento da consulta?'),
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  primary: const Color(0xFF6200EE),
                ),
                onPressed: () {
                  Modular.to.navigate('/home/');
                  Navigator.pop(context);
                },
                child: const Text('VOLTAR'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: const Color(0xFF6200EE),
                ),
                onPressed: () async {
                  await store.makeAppointment(widget.scheduleId);

                  if (store.errorAppointmentCreated != null) {
                    dialogFactory(
                      'Falha na operação',
                      store.errorAppointmentCreated ?? '',
                      '',
                      'Fechar',
                      () => {},
                      () => [
                        Modular.to.navigate('/home/'),
                        Navigator.of(context, rootNavigator: true).pop()
                      ],
                    );
                    return;
                  }

                  if (store.appointmentCreated != '') {
                    dialogFactory(
                      'Sucesso',
                      'A sua consulta está agendada',
                      '',
                      'Fechar',
                      () => {},
                      () => [
                        Modular.to.pushNamed('/appointment/main'),
                        Navigator.of(context, rootNavigator: true).pop()
                      ],
                    );
                    return;
                  }
                },
                child: const Text('AGENDAR'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
