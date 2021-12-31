import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SupportDialog extends StatelessWidget {
  const SupportDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.green[100],
      children: [
        Stack(
          children: [
            SizedBox(
              width: 300,
              height: 400,
              child: Opacity(
                  opacity: 0.4,
                  child: Image.asset('lib/assets/images/back.png',
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 70),
              child: Text(
                'Atendimento ao cliente',
                style: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(
                  color: Colors.black54,
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 110),
              child: Text(
                'Email',
                style: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 125),
              child: Text(
                'dentalcare@email.com',
                style: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 155),
              child: Text(
                'WhatsApp',
                style: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 170),
              child: Text(
                '11 999995555',
                style: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 200),
              child: Text(
                'Telefone',
                style: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 215),
              child: Text(
                '11 999995555',
                style: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 230),
              child: Text(
                '11 55554444',
                style: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
