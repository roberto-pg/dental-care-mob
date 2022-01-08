import 'package:dental_care_mob/app/modules/appointment/external/appointment_model.dart';
import 'package:dental_care_mob/app/modules/appointment/presenter/appointment_store.dart';
import 'package:dental_care_mob/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppointmentPage extends StatefulWidget {
  final String userId;
  final String userCpf;

  const AppointmentPage({Key? key, required this.userId, required this.userCpf})
      : super(key: key);

  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState
    extends ModularState<AppointmentPage, AppointmentStore> {
  List<AppointmentModel>? currentAppointments;
  List<AppointmentModel>? appointmentHistory;

  @override
  void initState() {
    super.initState();
    store.getUserById(widget.userId);
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
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            title: const Text('Minhas consultas'),
            flexibleSpace: const FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(bottom: 50)),
            bottom: const TabBar(
                indicatorColor: Colors.white,
                indicatorWeight: 5,
                tabs: [
                  Tab(text: 'Próximas'),
                  Tab(text: 'Histórico'),
                ]),
          ),
          body: Observer(builder: (_) {
            if (store.currentAppointmentsByCpf == null) {
              return Center(
                  child: Text(store.erroCurrentAppointmentsByCpf ?? ''));
            }

            currentAppointments = store.currentAppointmentsByCpf;
            appointmentHistory = store.appointmentHistoryByCpf;

            return TabBarView(
              children: [
                ListView.builder(
                    itemCount: currentAppointments?.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(color: Colors.black38)),
                        color: Colors.transparent,
                        shadowColor: Colors.transparent,
                        child: SizedBox(
                          height: 150,
                          child: ListTile(
                            title: Text(
                              currentAppointments?[index].doctorName ?? '',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      );
                    }),
                ListView.builder(
                    itemCount: appointmentHistory?.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(color: Colors.black38)),
                        color: Colors.transparent,
                        shadowColor: Colors.transparent,
                        child: SizedBox(
                          height: 150,
                          child: ListTile(
                            title: Text(
                              appointmentHistory?[index].doctorName ?? '',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      );
                    })
              ],
            );
          }),
        ),
      ),
    );
  }
}
