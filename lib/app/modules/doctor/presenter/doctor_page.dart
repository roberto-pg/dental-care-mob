import 'package:dental_care_mob/app/modules/doctor/external/schedule_model.dart';
import 'package:dental_care_mob/app/modules/doctor/presenter/widgets/appointment_card_widget.dart';
import 'package:dental_care_mob/shared/constants.dart';
import 'package:dental_care_mob/app/modules/doctor/external/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import 'doctor_store.dart';

class DoctorPage extends StatefulWidget {
  final String doctorId;

  const DoctorPage({Key? key, required this.doctorId}) : super(key: key);

  @override
  _DoctorPageState createState() => _DoctorPageState();
}

class _DoctorPageState extends ModularState<DoctorPage, DoctorStore> {
  DoctorModel? doctor;
  List<ScheduleModel>? schedules;

  @override
  void initState() {
    super.initState();
    store.getDoctorById(widget.doctorId);
    store.getSchedulesByDoctor(widget.doctorId);
  }

  @override
  Widget build(BuildContext context) {
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
                      margin:
                          const EdgeInsets.only(left: 15, top: 20, bottom: 140),
                      width: 45,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Modular.to.pushReplacementNamed('/home');
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
                      if (store.doctorById == null) {
                        return Center(child: Text(store.doctorError ?? ''));
                      }
                      doctor = store.doctorById;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 75,
                                width: 75,
                                child: Image.network(doctor?.imageUrl ?? ''),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(doctor?.name ?? '',
                                        style: GoogleFonts.roboto(
                                          textStyle: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                    Text(
                                      doctor?.specialty ?? '',
                                      style: GoogleFonts.ubuntu(
                                        textStyle: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 8, right: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sobre o Doutor',
                                  style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  )),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  doctor?.bio ?? '',
                                  style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  )),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Horários disponíveis',
                                  style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                  )),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                AppointmentCardWidget(doctorId: widget.doctorId)
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
