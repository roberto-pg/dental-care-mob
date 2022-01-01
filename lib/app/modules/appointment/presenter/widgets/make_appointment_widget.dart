import 'package:asuka/asuka.dart' as asuka;
import 'package:dental_care_mob/app/modules/appointment/presenter/appointment_store.dart';
import 'package:dental_care_mob/shared/alerts/dialog_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

makeAppointmentWidget(String scheduleId) {
  final AppointmentStore appointmentStore = Modular.get();

  return asuka.showDialog(builder: (BuildContext context) {
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
                  // Modular.to.navigate('/home/');
                  Navigator.pop(context);
                },
                child: const Text('VOLTAR'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: const Color(0xFF6200EE),
                ),
                onPressed: () async {
                  await appointmentStore.makeAppointment(scheduleId);

                  if (appointmentStore.errorAppointmentCreated != null) {
                    dialogFactory(
                      'Falha na operação',
                      appointmentStore.errorAppointmentCreated ?? '',
                      '',
                      'Fechar',
                      () => {},
                      () => [
                        // Modular.to.navigate('/home/'),
                        // Navigator.of(context, rootNavigator: true).pop()
                        Navigator.pop(context)
                      ],
                    );
                    return;
                  }

                  if (appointmentStore.appointmentCreated != '') {
                    String? userId = await appointmentStore.loadUserId();
                    dialogFactory(
                      'Sucesso',
                      'A sua consulta está agendada',
                      '',
                      'Fechar',
                      () => {},
                      () => [
                        Modular.to.pushNamed('/appointment/', arguments: userId),
                        Navigator.pop(context),
                        Navigator.pop(context)
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
  });
}
