import 'package:dental_care_mob/app/modules/user/external/user_model.dart';
import 'package:dental_care_mob/shared/constants.dart';
import 'account_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/plan_and_card_update_widget.dart';
import 'widgets/update_email_widget.dart';
import 'widgets/update_name_widget.dart';
import 'widgets/update_password_widget.dart';

class AccountPage extends StatefulWidget {
  final String userId;

  const AccountPage({Key? key, required this.userId}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends ModularState<AccountPage, AccountStore> {
  final list = ['Nome', 'Email', 'Senha', 'Convênio'];
  String? status;
  UserModel? user;

  @override
  void initState() {
    store.getUserById(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        if (store.userById == null) {
          return Center(child: Text(store.userError ?? ''));
        }

        user = store.userById;

        user?.active == true ? status = 'Ativo' : status = 'Inativo';

        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [getStartedColorStart, getStartedColorEnd],
                  begin: Alignment(0, -1.15),
                  end: Alignment(0, 0.1))),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin:
                        const EdgeInsets.only(left: 15, top: 40, bottom: 10),
                    width: 45,
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Modular.to.navigate('/home/');
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.white,
                        ))),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 90,
                        child: Text(
                          'Nome:',
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 220,
                        child: Text(
                          user?.name ?? '',
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 90,
                        child: Text(
                          'Convênio:',
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 220,
                        child: Text(
                          user?.plan ?? '',
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 90,
                        child: Text(
                          'Status:',
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 220,
                        child: Text(
                          status ?? '',
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
                  child: Text(
                    'Edite seus dados:',
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: <Widget>[
                              const Divider(
                                color: Colors.black,
                              ),
                              GestureDetector(
                                onTap: () {
                                  showEditDialog(index, user);
                                },
                                child: ListTile(
                                  title: Text(list[index]),
                                ),
                              ),
                              const Divider(
                                color: Colors.black,
                              ), //                           <-- Divider
                            ],
                          );
                        },
                      )),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  showEditDialog(int index, UserModel? user) {
    var editDialog = index;
    switch (editDialog) {
      case 0:
        return updateNameWidget(user, context);
      case 01:
        return updateEmailWidget(user, context);
      case 2:
        return updatePasswordWidget(user, context);
      case 3:
        return showDialog(
            context: context,
            builder: (context) => PlanAndCardUpdateWidget(userId: user?.id));
      default:
        return '';
    }
  }
}
