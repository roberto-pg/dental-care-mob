import 'package:dental_care_mob/app/modules/appointment/external/appointment_model.dart';
import 'package:dental_care_mob/app/modules/appointment/presenter/appointment_store.dart';
import 'package:dental_care_mob/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppointmentPage2 extends StatefulWidget {
  const AppointmentPage2({Key? key}) : super(key: key);

  @override
  _AppointmentPage2State createState() => _AppointmentPage2State();
}

class _AppointmentPage2State
    extends ModularState<AppointmentPage2, AppointmentStore> {
  List<AppointmentModel>? appointments;

  @override
  void initState() {
    super.initState();
    store.getAppointmentsByCpf('02483073808');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Observer(builder: (_) {
          if (store.appointmentsByCpf == null) {
            return Center(child: Text(store.erroAppointmentsByCpf ?? ''));
          }

          appointments = store.appointmentsByCpf;

          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [getStartedColorStart, getStartedColorEnd],
                  begin: Alignment(0, -1.15),
                  end: Alignment(1, 1)),
            ),
            child: CustomScrollView(
              slivers: [
                const SliverAppBar(
                  backgroundColor: Colors.transparent,
                  expandedHeight: 150,
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
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                      padding:
                          const EdgeInsets.only(left: 50, top: 20, right: 50),
                      child: SizedBox(
                        height: 150,
                        child: TabBarView(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side:
                                      const BorderSide(color: Colors.black38)),
                              color: Colors.transparent,
                              shadowColor: Colors.transparent,
                              child: SizedBox(
                                // height: 100,
                                child: ListTile(
                                  title: Text(
                                    appointments?[index].doctorName ?? '',
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side:
                                      const BorderSide(color: Colors.black38)),
                              color: Colors.transparent,
                              shadowColor: Colors.transparent,
                              child: SizedBox(
                                // height: 100,
                                child: ListTile(
                                  title: Text(
                                    appointments?[index].doctorName ?? '',
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    childCount: appointments?.length,
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
