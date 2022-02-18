import 'package:dental_care_mob/app/modules/home/presenter/home_store.dart';
import 'package:dental_care_mob/shared/alerts/alert_factory.dart';
import 'package:dental_care_mob/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class OurTeamWidget extends StatefulWidget {
  const OurTeamWidget({Key? key}) : super(key: key);

  @override
  _OurTeamWidgetState createState() => _OurTeamWidgetState();
}

class _OurTeamWidgetState extends ModularState<OurTeamWidget, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      // child: Container(),
      child: Observer(
        builder: (_) {
          if (store.doctors == null) {
            return Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                children: const [
                  CircularProgressIndicator(),
                ],
              ),
            ));
          }

          if (store.doctors!.isEmpty) {
            return const Center(child: Text('Erro'));
          }

          var listDoctors = store.doctors;
          return ListView.builder(
              itemCount: listDoctors?.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    await store.expiredToken();
                    bool validToken = !store.isTokenExpired;

                    if (validToken) {
                      var doctorId = listDoctors?[index].id;
                      Modular.to.pushNamed('/doctor', arguments: doctorId);
                    } else {
                      alertFactory(
                          'Oops',
                          'Algo deu errado...\nFaça o login novamente',
                          '',
                          'Fechar',
                          () => {},
                          () => {
                                Modular.to.navigate('/auth/'),
                                Navigator.of(context, rootNavigator: true).pop()
                              });
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: docContentBgColor,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    NetworkImage(listDoctors![index].imageUrl),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listDoctors[index].specialty,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Dr ${listDoctors[index].name}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 220,
                                height: 75,
                                child: Text(
                                  changeSpecialtyDescription(
                                    listDoctors[index].specialty,
                                  ),
                                  style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
