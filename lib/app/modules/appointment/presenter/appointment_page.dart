import 'package:dental_care_mob/app/modules/appointment/external/appointment_model.dart';
import 'package:dental_care_mob/app/modules/appointment/presenter/appointment_store.dart';
import 'package:dental_care_mob/shared/alerts/alert_factory.dart';
import 'package:dental_care_mob/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AppointmentPage extends StatefulWidget {
  // final String userId;
  final String userCpf;

  const AppointmentPage({Key? key, required this.userCpf}) : super(key: key);

  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState
    extends ModularState<AppointmentPage, AppointmentStore> {
  List<AppointmentModel>? currentAppointments;
  List<AppointmentModel>? appointmentHistory;
  var newFormat = DateFormat("dd-MM-yyyy");

  @override
  void initState() {
    super.initState();
    store.getCurrentAppointmentsByCpf(widget.userCpf);
    store.getAppointmentHistoryByCpf(widget.userCpf);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [getStartedColorStart, getStartedColorEnd],
              begin: Alignment(0, -1.15),
              end: Alignment(1, 1)),
        ),
        child: Observer(builder: (_) {
          if (store.currentAppointmentsByCpf == null) {
            return Center(
                child: Text(store.erroCurrentAppointmentsByCpf ?? ''));
          }

          currentAppointments = store.currentAppointmentsByCpf;
          appointmentHistory = store.appointmentHistoryByCpf;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CustomScrollView(
              slivers: [
                const SliverAppBar(
                  backgroundColor: Colors.transparent,
                  expandedHeight: 100,
                  title: Text('Minhas consultas'),
                  bottom: TabBar(
                      indicatorColor: Colors.white,
                      indicatorWeight: 5,
                      tabs: [
                        Tab(text: 'Próximas'),
                        Tab(text: 'Histórico'),
                      ]),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: TabBarView(
                      children: [
                        ListView.builder(
                            itemCount: currentAppointments?.length,
                            itemBuilder: (context, index) {
                              DateTime monthDay = DateTime.parse(
                                  currentAppointments?[index].monthDay ?? '');
                              String day = newFormat.format(monthDay);

                              return GestureDetector(
                                onLongPress: () async {
                                  await store.expiredToken();
                                  bool validToken = !store.isTokenExpired;
                                  if (validToken) {
                                    alertFactory(
                                      'Cancelamento de Consulta',
                                      'Você deseja desmarcar a consulta agendada ?',
                                      'Sim',
                                      'Não',
                                      () async {
                                        await store.cancelAppointment(
                                            currentAppointments?[index].id ??
                                                '',
                                            '',
                                            '',
                                            '',
                                            '');
                                        await store.getCurrentAppointmentsByCpf(
                                            widget.userCpf);
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                      },
                                      () => Navigator.of(context,
                                              rootNavigator: true)
                                          .pop(),
                                    );
                                  } else {
                                    alertFactory(
                                        'Oops',
                                        'Algo deu errado...\nFaça o login novamente',
                                        '',
                                        'Fechar',
                                        () => {},
                                        () => {
                                              Modular.to.navigate('/auth/'),
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .pop()
                                            });
                                  }
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: const BorderSide(
                                        color: Colors.white,
                                        width: 2,
                                      )),
                                  color: Colors.white24,
                                  shadowColor: Colors.transparent,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 20, bottom: 20),
                                    width: 100,
                                    height: 100,
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                currentAppointments?[index]
                                                        .specialty ??
                                                    '',
                                                style: GoogleFonts.roboto(
                                                  textStyle: const TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )),
                                          ],
                                        ),
                                        const SizedBox(width: 30),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                'Dr ${currentAppointments?[index].doctorName}',
                                                style: GoogleFonts.ubuntu(
                                                  textStyle: const TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )),
                                            Text(day,
                                                style: GoogleFonts.ubuntu(
                                                  textStyle: const TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )),
                                            Text(
                                                currentAppointments?[index]
                                                        .hour ??
                                                    '',
                                                style: GoogleFonts.ubuntu(
                                                  textStyle: const TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                        ListView.builder(
                            itemCount: appointmentHistory?.length,
                            itemBuilder: (context, index) {
                              DateTime monthDay = DateTime.parse(
                                  appointmentHistory?[index].monthDay ?? '');
                              String day = newFormat.format(monthDay);

                              return Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: const BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    )),
                                color: Colors.white24,
                                shadowColor: Colors.transparent,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 20, bottom: 20),
                                  width: 100,
                                  height: 100,
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              appointmentHistory?[index]
                                                      .specialty ??
                                                  '',
                                              style: GoogleFonts.roboto(
                                                textStyle: const TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                        ],
                                      ),
                                      const SizedBox(width: 30),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              'Dr ${appointmentHistory?[index].doctorName}',
                                              style: GoogleFonts.ubuntu(
                                                textStyle: const TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                          Text(day,
                                              style: GoogleFonts.ubuntu(
                                                textStyle: const TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                          Text(
                                              appointmentHistory?[index].hour ??
                                                  '',
                                              style: GoogleFonts.ubuntu(
                                                textStyle: const TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })
                      ],
                    ),
                  )
                ]))
              ],
            ),
          );
        }),
      ),
      //),
    );
  }
}
