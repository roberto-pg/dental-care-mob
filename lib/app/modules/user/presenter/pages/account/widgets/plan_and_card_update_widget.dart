import 'package:dental_care_mob/shared/alerts/dialog_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dental_care_mob/shared/constants.dart' as constants;

import '../account_store.dart';

class PlanAndCardUpdateWidget extends StatefulWidget {
  final String? userId;

  const PlanAndCardUpdateWidget({Key? key, required this.userId})
      : super(key: key);

  @override
  _PlanAndCardUpdateWidgetState createState() =>
      _PlanAndCardUpdateWidgetState();
}

class _PlanAndCardUpdateWidgetState
    extends ModularState<PlanAndCardUpdateWidget, AccountStore> {
  final _formKey = GlobalKey<FormState>();
  String plain = '';
  final List _plainsName = constants.plainName();
  String? id;

  @override
  void initState() {
    plain = _plainsName.first;
    id = widget.userId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.green[50],
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, top: 15.0, right: 30.0),
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
                          store.savePlan(plain);
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
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: SizedBox(
                  height: 100,
                  width: 230,
                  child: TextFormField(
                    onChanged: store.saveCard,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: const OutlineInputBorder(),
                      label: const Text('Número de beneficiário'),
                      labelStyle: GoogleFonts.ubuntu(
                          textStyle: const TextStyle(
                        color: Colors.black45,
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
                            await store.changePlanAndCard(
                                id ?? '', store.plan, store.card);
                            if (store.errorPlanAndCard != null) {
                              dialogFactory(
                                'Falha na operaçãooo',
                                store.errorPlanAndCard ?? '',
                                '',
                                'Fechar',
                                () => {},
                                () => [
                                  store.savePlan(''),
                                  store.saveCard(''),
                                  store.saveErrorPlanAndCard(''),
                                  Navigator.of(context).pop(),
                                  Navigator.of(context).pop(),
                                ],
                              );
                              return;
                            }

                            if (store.alteredPlanAndCard != '') {
                              dialogFactory(
                                'Sucesso',
                                'Dados de convênio atualizados',
                                '',
                                'Fechar',
                                () => {},
                                () => [
                                  store.savePlan(''),
                                  store.saveCard(''),
                                  store.saveAlteredPlanAndCard(''),
                                  Modular.to.popAndPushNamed('/user/account',
                                      arguments: id),
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
  }
}
