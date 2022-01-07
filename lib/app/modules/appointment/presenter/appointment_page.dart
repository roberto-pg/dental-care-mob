import 'package:dental_care_mob/app/modules/appointment/external/appointment_user_model.dart';
import 'package:dental_care_mob/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import 'appointment_store.dart';

class AppointmentPage extends StatefulWidget {
  final String userId;

  const AppointmentPage({Key? key, required this.userId}) : super(key: key);

  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState
    extends ModularState<AppointmentPage, AppointmentStore> {
  AppointmentUserModel? user;

  @override
  void initState() {
    store.getUserById(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // loadCpf();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [getStartedColorStart, getStartedColorEnd],
                  begin: Alignment(0, -1.15),
                  end: Alignment(0, 0.1))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(
                            left: 15, top: 20, bottom: 140),
                        width: 45,
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              Modular.to.navigate('/home/');
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              size: 30,
                              color: Colors.white,
                            ))),
                    Container(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Image.asset('lib/assets/images/docinfo/bg1.png'),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    color: bgColor),
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Observer(builder: (_) {
                      if (store.userById == null) {
                        return Center(child: Text(store.userError ?? ''));
                      }

                      user = store.userById;

                      var status = '';
                      user?.active == true
                          ? status = 'Ativo'
                          : status = 'Inativo';

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 8, right: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user?.name ?? '',
                                  style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  )),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  user?.plan ?? '',
                                  style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                    color: Colors.black45,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  )),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  status,
                                  style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                    color: Colors.black45,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  )),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  'Consultas agendadas',
                                  style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  )),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  width: MediaQuery.of(context).size.width,
                                  child: Observer(builder: (_) {
                                    // if (controller.schedulingByCpf == null) {
                                    //   return const Center(
                                    //       child: CircularProgressIndicator());
                                    // }

                                    // if (controller.schedulingByCpf.isEmpty) {
                                    //   return Center(
                                    //       child: Text(
                                    //     'Nenhuma consulta agendada',
                                    //     style: GoogleFonts.ubuntu(
                                    //         textStyle: const TextStyle(
                                    //       color: Colors.black54,
                                    //       fontSize: 18,
                                    //       fontWeight: FontWeight.w500,
                                    //     )),
                                    //   ));
                                    // }

                                    // var listSchedules =
                                    //     controller.schedulingByCpf;

                                    return ListView.builder(
                                        itemCount: 4,
                                        // itemCount: listSchedules.length,
                                        itemBuilder: (context, index) {
                                          // DateTime monthDay = DateTime.parse(
                                          //     listSchedules[index].monthDay);

                                          return Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 10),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                                color: docContentBgColor),
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 70,
                                                    height: 90,
                                                    decoration:
                                                        const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      color: dateBgColor,
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Text('10',
                                                            // monthDay.day
                                                            // .toString(),
                                                            style: TextStyle(
                                                              color: dateColor,
                                                              fontSize: 30,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                            )),
                                                        Text(
                                                          'Sab',
                                                          // showMonth(monthDay
                                                          //     .month
                                                          //     .toString()),
                                                          style: TextStyle(
                                                              color: dateColor,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: const [
                                                      Text('Sabadão',
                                                          // listSchedules[index]
                                                          //     .weekDay,
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                          )),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        '10:00',
                                                        // listSchedules[index]
                                                        //     .hour,
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      SizedBox(
                                                        width: 150,
                                                        child: Text(
                                                          'Dr José',
                                                          // 'Dr ${listSchedules[index].doctorName}',
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        'Clínica',
                                                        // listSchedules[index]
                                                        //     .specialty,
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      )
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: IconButton(
                                                      iconSize: 35,
                                                      icon: const Icon(Icons
                                                          .delete_forever_outlined),
                                                      onPressed: () {
                                                        // var id =
                                                        //     listSchedules[
                                                        //             index]
                                                        //         .id;

                                                        // _showConfirmationAlert(
                                                        //     id);
                                                      },
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  }),
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
