import 'package:dental_care_mob/app/modules/home/presenter/home_store.dart';
import 'package:dental_care_mob/shared/alerts/dialog_factory.dart';
import 'package:dental_care_mob/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import 'doctor_by_specialty_widget.dart';

class ListCategoryWidget extends StatelessWidget {
  const ListCategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeStore store = Modular.get();

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 140,
      margin: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              await store
                  .getDoctorsBySpecialty(categoryList[index]['title'] ?? '');

              if (store.doctorsBySpecialty!.isEmpty) {
                return dialogFactory(
                    'Não encontrado',
                    'Que pena, não estamos atendendo essa especialidade',
                    '',
                    'Fechar',
                    () => {},
                    () => Navigator.of(context, rootNavigator: true).pop());
              }

              var listBySpecialty = store.doctorsBySpecialty;

              showDialog(
                  context: context,
                  builder: (_) => doctorsBySpecialtyDialog(listBySpecialty));
            },
            child: Column(
              children: [
                SizedBox(
                  height: 110,
                  child: Image.asset(
                    'lib/assets/images/category/${categoryList[index]['img']}',
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  categoryList[index]['title'] ?? '',
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  )),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
