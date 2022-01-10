import 'package:dental_care_mob/app/modules/auth/domain/entities/logged_user.dart';
import 'package:dental_care_mob/shared/constants.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'auth_store.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends ModularState<AuthPage, AuthStore> {
  final _formKey = GlobalKey<FormState>();
  LoggedUser user = const LoggedUser(cpf: '', password: '');
  bool obscuredTextPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: CustomPaint(
                    painter: PathPainter(),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(30),
                  margin: const EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Faça login para agendar \nsua consulta",
                        style: GoogleFonts.ubuntu(
                            textStyle: const TextStyle(
                          color: Colors.black54,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        )),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.4,
                  left: 35,
                  child: SizedBox(
                      width: 250,
                      height: 250,
                      child: Center(
                        child: Image.asset('lib/assets/images/onBoardDoc.png'),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 400.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30.0, top: 10.0, right: 60.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.email),
                              labelText: 'CPF',
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: store.saveCpf,
                            onSaved: (text) {
                              user = user.copyWith(cpf: text);
                            },
                            validator: (text) => store.validateCpf,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30.0, top: 15.0, right: 60.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.vpn_key),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscuredTextPassword =
                                        !obscuredTextPassword;
                                  });
                                },
                                icon: Icon(obscuredTextPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              labelText: 'Senha',
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            keyboardType: TextInputType.number,
                            obscureText: obscuredTextPassword,
                            onChanged: store.savePassword,
                            onSaved: (text) =>
                                user = user.copyWith(password: text),
                            validator: (text) => store.validatePassword,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30.0, top: 30.0, right: 60.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size.fromWidth(150),
                                  primary: const Color(0XFF21aeb8),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: const EdgeInsets.only(
                                      top: 15, bottom: 15),
                                ),
                                onPressed: () async {
                                  var formValid =
                                      _formKey.currentState?.validate() ??
                                          false;
                                  if (formValid) {
                                    _formKey.currentState!.save();
                                    await store.login(user.cpf, user.password);
                                    _formKey.currentState!.reset();
                                    if (store.userLogin == null) {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              backgroundColor:
                                                  Colors.green[100],
                                              insetPadding:
                                                  const EdgeInsets.only(
                                                      left: 50, right: 80),
                                              title: Text(
                                                store.loginError.toString(),
                                                style: GoogleFonts.roboto(
                                                  textStyle: const TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            );
                                          });
                                    }
                                  }
                                },
                                child: const Text(
                                  'Entrar',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Modular.to.pushNamed('/user/register');
                                },
                                child: Text(
                                  "Criar conta",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: const TextStyle(
                                    fontSize: 16.0,
                                    color: Color(0XFF21aeb8),
                                    fontWeight: FontWeight.w500,
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = path1Color;
    paint.style = PaintingStyle.fill;
    var path = Path();
    path.moveTo(0, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.35, size.height * 0.40,
        size.width * 0.58, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.72, size.height * 0.8,
        size.width * 0.92, size.height * 0.8);
    path.quadraticBezierTo(
        size.width * 0.98, size.height * 0.8, size.width, size.height * 0.82);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
