import 'package:dental_care_mob/app/modules/user/external/user_model.dart';
import 'package:dental_care_mob/shared/alerts/dialog_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../account_store.dart';

updatePasswordWidget(UserModel? user, [BuildContext? context]) {
  final AccountStore _accountStore = Modular.get();
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
                        onChanged: _accountStore.saveOldPassword,
                        keyboardType: TextInputType.number,
                        validator: (text) => _accountStore.validateOldPassword,
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
                        onChanged: _accountStore.saveNewPassword,
                        keyboardType: TextInputType.number,
                        validator: (text) => _accountStore.validateNewPassword,
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
                                await _accountStore.changePassword(
                                  userId ?? '',
                                  _accountStore.oldPassword,
                                  _accountStore.newPassword,
                                );

                                if (_accountStore.errorPassword ==
                                        'Senha atual inválida' ||
                                    _accountStore.errorPassword ==
                                        'A nova senha deve ter ao menos 6 caracteres') {
                                  dialogFactory(
                                    'Falha na operação',
                                    _accountStore.errorPassword ?? '',
                                    '',
                                    'Fechar',
                                    () => {},
                                    () => [
                                      _accountStore.saveOldPassword(''),
                                      _accountStore.saveNewPassword(''),
                                      _accountStore.saveErrorPassword(''),
                                      Navigator.of(context).pop(),
                                      Navigator.of(context).pop(),
                                    ],
                                  );
                                  return;
                                }

                                if (_accountStore.alteredPassword != '') {
                                  dialogFactory(
                                    'Sucesso',
                                    'A senha foi alterada',
                                    '',
                                    'Fechar',
                                    () => {},
                                    () => [
                                      _accountStore.saveOldPassword(''),
                                      _accountStore.saveNewPassword(''),
                                      _accountStore.saveAlteredPassword(''),
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
