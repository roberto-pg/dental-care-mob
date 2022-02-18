import 'package:dental_care_mob/app/modules/home/presenter/widgets/list_category_widget.dart';
import 'package:dental_care_mob/app/modules/home/presenter/widgets/our_team_widget.dart';
import 'package:dental_care_mob/shared/alerts/alert_factory.dart';
import 'package:dental_care_mob/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_store.dart';
import 'widgets/support_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    store.getDoctors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: CustomPaint(
            painter: PathPainter(),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: PopupMenuButton(
                        color: path2Color,
                        tooltip: 'Menu',
                        child: const Icon(
                          Icons.menu,
                          size: 28,
                          color: Colors.black,
                        ),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: InkWell(
                              onTap: () async {
                                await store.expiredToken();
                                bool validToken = !store.isTokenExpired;

                                if (validToken) {
                                  String? userCpf = await store.loadUserCpf();
                                  Navigator.pop(context);
                                  Modular.to.pushNamed('/appointment',
                                      arguments: userCpf);
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
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.schedule,
                                    color: Colors.black45,
                                    size: 22,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      'Minhas consultas',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            child: InkWell(
                              onTap: () async {
                                await store.expiredToken();
                                bool validToken = !store.isTokenExpired;

                                if (validToken) {
                                  Navigator.pop(context);
                                  String? userId = await store.loadUserId();
                                  Modular.to.pushNamed('/user/account',
                                      arguments: userId);
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
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.settings,
                                    color: Colors.black45,
                                    size: 22,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Text(
                                      'Perfil',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const SupportDialog();
                                    });
                              },
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.contact_support,
                                    color: Colors.black45,
                                    size: 22,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Text(
                                      'Fale conosco',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                alertFactory(
                                  'Aviso de Logout',
                                  'Você está saindo de sua conta',
                                  'Confirmar',
                                  'Cancelar',
                                  () => [
                                    store.logoutUser(),
                                    Modular.to.navigate('/auth/'),
                                    Navigator.of(context, rootNavigator: true)
                                        .pop()
                                  ],
                                  () => [
                                    Navigator.of(context, rootNavigator: true)
                                        .pop()
                                  ],
                                );
                              },
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.exit_to_app,
                                    color: Colors.black45,
                                    size: 22,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Text(
                                      'Logout',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: Container())
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14, right: 10, top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Escolha o Doutor ou Especialidade',
                        style: GoogleFonts.ubuntu(
                            textStyle: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const ListCategoryWidget(),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Nossa equipe',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const OurTeamWidget(),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = path2Color;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.3, 0);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.03,
        size.width * 0.42, size.height * 0.17);
    path.quadraticBezierTo(
        size.width * 0.35, size.height * 0.32, 0, size.height * 0.29);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
