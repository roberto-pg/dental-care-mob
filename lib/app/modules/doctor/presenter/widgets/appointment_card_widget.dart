import 'package:dental_care_mob/app/modules/appointment/presenter/widgets/make_appointment_widget.dart';
import 'package:dental_care_mob/app/modules/doctor/external/schedule_model.dart';
import 'package:dental_care_mob/app/modules/doctor/presenter/doctor_store.dart';
import 'package:dental_care_mob/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppointmentCardWidget extends StatefulWidget {
  final String doctorId;

  const AppointmentCardWidget({Key? key, required this.doctorId})
      : super(key: key);

  @override
  _AppointmentCardWidgetState createState() => _AppointmentCardWidgetState();
}

class _AppointmentCardWidgetState
    extends ModularState<AppointmentCardWidget, DoctorStore> {
  List<ScheduleModel>? schedules;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      child: Observer(builder: (_) {
        if (store.schedulesByDoctor == null) {
          return Center(
            child: Text(store.errorSchedulesByDoctor ?? ''),
          );
        }

        schedules = store.schedulesByDoctor;

        return ListView.builder(
            itemCount: schedules?.length,
            itemBuilder: (context, index) {
              DateTime monthDay =
                  DateTime.parse(schedules?[index].monthDay ?? '');

              return GestureDetector(
                onTap: () async {
                  await store.getSchedulesByDoctor(widget.doctorId);
                  await store.expiredToken();
                  if (!store.isTokenExpired) {
                    String scheduleId = schedules?[index].id ?? '';
                    makeAppointmentWidget(scheduleId, widget.doctorId);
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: docContentBgColor),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          width: 70,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: dateBgColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(monthDay.day.toString(),
                                  style: const TextStyle(
                                    color: dateColor,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w800,
                                  )),
                              Text(
                                showMonth(monthDay.month.toString()),
                                style: const TextStyle(
                                    color: dateColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(schedules?[index].weekDay ?? '',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                )),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              schedules?[index].hour ?? '',
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            });
      }),
    );
  }
}
