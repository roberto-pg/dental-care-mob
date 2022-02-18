import 'package:dental_care_mob/app/modules/user/external/user_model.dart';
import 'package:dental_care_mob/shared/alerts/alert_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../account_store.dart';

updatePasswordWidget(UserModel? user, [BuildContext? context]) {
  final AccountStore store = Modular.get();
  String? userId = user?.id;
  final _formKey = GlobalKey<FormState>();

  return showDialog(
      context: context!,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Colors.green[50],
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    child: SizedBox(
                      height: 100,
                      width: 230,
                      child: TextFormField(
                        onChanged: store.saveOldPassword,
                        keyboardType: TextInputType.number,
                        validator: (text) => store.validateOldPassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: const OutlineInputBorder(),
                          label: const Text('Senha atual'),
                          labelStyle: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                            color: Colors.black26,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    child: SizedBox(
                      height: 100,
                      width: 230,
                      child: TextFormField(
                        onChanged: store.saveNewPassword,
                        keyboardType: TextInputType.number,
                        validator: (text) => store.validateNewPassword,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: const OutlineInputBorder(),
                          label: const Text('Digite a nova senha'),
                          labelStyle: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                            color: Colors.black26,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22),
                    child: SizedBox(
                      height: 50,
                      width: 230,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Cancelar',
                              style: GoogleFonts.ubuntu(
                                  textStyle: const TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              )),
                            ),
                          ),
                          Expanded(child: Container()),
                          InkWell(
                            onTap: () async {
                              var formValid =
                                  _formKey.currentState?.validate() ?? false;

                              if (formValid) {
                                _formKey.currentState!.save();
                                await store.changePassword(
                                  userId ?? '',
                                  store.oldPassword,
                                  store.newPassword,
                                );

                                if (store.errorPassword ==
                                        'Senha atual inválida' ||
                                    store.errorPassword ==
                                        'A nova senha deve ter ao menos 6 caracteres') {
                                  alertFactory(
                                    'Falha na operação',
                                    store.errorPassword ?? '',
                                    '',
                                    'Fechar',
                                    () => {},
                                    () => [
                                      store.saveOldPassword(''),
                                      store.saveNewPassword(''),
                                      store.saveErrorPassword(''),
                                      Navigator.of(context).pop(),
                                      Navigator.of(context).pop(),
                                    ],
                                  );
                                  return;
                                }

                                if (store.alteredPassword != '') {
                                  alertFactory(
                                    'Sucesso',
                                    'A senha foi alterada',
                                    '',
                                    'Fechar',
                                    () => {},
                                    () => [
                                      store.saveOldPassword(''),
                                      store.saveNewPassword(''),
                                      store.saveAlteredPassword(''),
                                      Modular.to.popAndPushNamed(
                                          '/user/account',
                                          arguments: userId),
                                      Navigator.of(context).pop(),
                                      Navigator.of(context).pop(),
                                    ],
                                  );
                                  return;
                                }
                              }
                            },
                            child: Text(
                              'Salvar',
                              style: GoogleFonts.ubuntu(
                                  textStyle: const TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        );
      });
}
