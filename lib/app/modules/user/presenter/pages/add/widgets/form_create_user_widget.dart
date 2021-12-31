import 'package:dental_care_mob/app/modules/user/domain/entities/user.dart';
import 'package:dental_care_mob/app/modules/user/external/user_model.dart';
import 'package:dental_care_mob/shared/constants.dart' as constants;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../create_user_store.dart';

class FormCreateUserWidget extends StatefulWidget {
  const FormCreateUserWidget({Key? key}) : super(key: key);

  @override
  _FormCreateUserWidgetState createState() => _FormCreateUserWidgetState();
}

class _FormCreateUserWidgetState
    extends ModularState<FormCreateUserWidget, CreateUserStore> {
  final _formKey = GlobalKey<FormState>();
  String plain = '';
  final List _plainsName = constants.plainName();
  User user = const UserModel(
    name: '',
    email: '',
    cpf: '',
    password: '',
    plan: '',
    card: '',
  );

  @override
  void initState() {
    plain = _plainsName.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 15.0, right: 60.0),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.green[50],
                border: const OutlineInputBorder(),
                labelText: 'Nome',
                labelStyle: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(
                  color: Colors.black45,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
              ),
              keyboardType: TextInputType.name,
              onChanged: store.saveName,
              onSaved: (text) => user = user.copyWith(name: text),
              validator: (text) => store.validateName,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 15.0, right: 60.0),
            child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.green[50],
                  border: const OutlineInputBorder(),
                  labelText: 'Email',
                  labelStyle: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )),
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: store.saveEmail,
                onSaved: (text) => user = user.copyWith(email: text),
                validator: (text) => store.validateEmail),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 15.0, right: 60.0),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.green[50],
                border: const OutlineInputBorder(),
                labelText: 'CPF',
                labelStyle: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(
                  color: Colors.black45,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
              ),
              keyboardType: TextInputType.number,
              onChanged: store.saveCpf,
              onSaved: (text) => user = user.copyWith(cpf: text),
              validator: (text) => store.validateCpf,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 15.0, right: 60.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 57,
              decoration: BoxDecoration(
                color: Colors.green[50],
                border: Border.all(),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 40),
                child: DropdownButton<String>(
                  dropdownColor: constants.path2Color,
                  value: plain,
                  onChanged: (String? newValue) {
                    setState(() {
                      plain = newValue!;
                      store.savePlain(plain);
                    });
                  },
                  items: _plainsName.map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: GoogleFonts.ubuntu(
                          textStyle: const TextStyle(
                            color: Colors.black45,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 15.0, right: 60.0),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.green[50],
                border: const OutlineInputBorder(),
                labelText: 'Código do beneficiário',
                labelStyle: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(
                  color: Colors.black45,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
              ),
              keyboardType: TextInputType.number,
              onChanged: store.saveCard,
              onSaved: (text) => user = user.copyWith(card: text),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 15.0, right: 60.0),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.green[50],
                border: const OutlineInputBorder(),
                labelText: 'Senha',
                labelStyle: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(
                  color: Colors.black45,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
              ),
              keyboardType: TextInputType.number,
              onChanged: store.savePassword,
              onSaved: (text) => user = user.copyWith(password: text),
              validator: (text) => store.validatePassword,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 30.0, right: 60.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromWidth(150),
                    primary: Colors.green.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                  ),
                  onPressed: () async {
                    var formValid = _formKey.currentState?.validate() ?? false;
                    if (formValid) {
                      _formKey.currentState!.save();

                      await store.createUser(
                        user.name,
                        user.email,
                        user.cpf,
                        plain,
                        user.card ?? '',
                        user.password,
                      );
                      // _formKey.currentState!.reset();

                      if (store.createdUser == null) {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.green[100],
                                insetPadding:
                                    const EdgeInsets.only(left: 50, right: 80),
                                title: const Text('Falha na operação'),
                                content: Text(
                                  store.createdError ?? '',
                                  style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Fechar'))
                                ],
                              );
                            });
                      }
                    }
                  },
                  child: const Text(
                    'Salvar',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white70,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Modular.to.pop();
                  },
                  child: Text(
                    "Voltar",
                    style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                      fontSize: 18.0,
                      color: Colors.red[400],
                      fontWeight: FontWeight.w500,
                    )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
