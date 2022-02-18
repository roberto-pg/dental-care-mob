import 'package:dental_care_mob/app/modules/user/external/user_model.dart';
import 'package:dental_care_mob/shared/alerts/alert_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../account_store.dart';

updateNameWidget(UserModel? user, [BuildContext? context]) {
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
                        onChanged: store.saveName,
                        keyboardType: TextInputType.name,
                        validator: (text) => store.validateName,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: const OutlineInputBorder(),
                          label: Text(user?.name ?? ''),
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
                      height: 40,
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
                                await store.changeName(
                                    userId ?? '', store.name);

                                if (store.errorName ==
                                    'O campo de nome só aceita letras') {
                                  alertFactory(
                                    'Falha na operação',
                                    store.errorName ?? '',
                                    '',
                                    'Fechar',
                                    () => {},
                                    () => [
                                      store.saveName(''),
                                      store.saveErrorName(''),
                                      Navigator.of(context).pop(),
                                      Navigator.of(context).pop(),
                                    ],
                                  );

                                  return;
                                }

                                if (store.alteredName != '') {
                                  alertFactory(
                                    'Sucesso',
                                    'O nome foi alterado',
                                    '',
                                    'Fechar',
                                    () => {},
                                    () => [
                                      store.saveName(''),
                                      store.saveAlteredName(''),
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
