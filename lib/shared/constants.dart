import 'package:flutter/material.dart';

const Color bgColor = Color(0xffF9F9F9);
const Color path1Color = Color(0xffE4E2FF);
const Color getStartedColorStart = Color(0xff54D579);
const Color getStartedColorEnd = Color(0xff00AABF);
const Color path2Color = Color(0xffcef4e8);
const Color docBgColor = Color(0xffE9B5FF);
const Color docContentBgColor = Color(0xffECF0F5);
const Color dateBgColor = Color(0xffD5E0FA);
const Color dateColor = Color(0xff3479C0);

List plainName() {
  return [
    'Nome do convênio',
    'Particular',
    'Amil',
    'Interodonto',
    'Metlife',
    'Porto Seguro',
    'Rede Unna',
    'Sul América'
  ];
}

const orthodonticsDescription =
    'O ortodontista corrige o posicionamento dos dentes reestabelecendo a correta articulação entre as arcadas dentais por meio de aparelhos corretivos fixos ou móveis';
const implantologyDescription =
    'Especialista que faz implantes de dentes. Ele pode também fazer diagnóstico das estruturas ósseas dos maxilares e das alterações das mucosas';
const pediatricDentistryDescription =
    'O odontopediatra atua na prevenção, manutenção e reabilitação da saúde bucal da criança.';
const periodonticsDescription =
    'O periodontista estuda, diagnostica, previne e trata as doenças gengivais e periodontais, visando à promoção e o restabelecimento de tudo o que dá suporte aos dentes.';
const endodonticsDescription =
    'Cuida dos procedimentos que promovam a vitalidade da polpa dentária, cirurgias no tecido e na cavidade pulpares, tratamento dos traumatismos dentários, de canal, entre outros.';
const dentistryDescription =
    'Especialista que restaura a função mastigatória e a reabilitação de dentes comprometidos por cáries, fraturas ou estragados por abrasão e erosão.';
const prosthesisDescription =
    'Cuida da recuperação das coroas dentais e da reparação de espaços de extrações. Proporciona conforto, estética e saúde pela recolocação dos dentes destruídos ou perdidos e dos tecidos.';
const surgeryDescription =
    'O profissional especializado nessa área pode fazer implantes, enxertos, transplantes, biópsias, cirurgias, entre outros.';
const examDescription =
    'Além de identificar problemas bucais, como a existência de cáries ou tártaro, a avaliação odontológica direciona o paciente para o tratamento funcional ou estético mais adequado.';

changeSpecialtyDescription(String specialty) {
  var specialtyDescription = specialty;
  switch (specialtyDescription) {
    case 'Avaliação':
      return examDescription;
    case 'Implantodontia':
      return implantologyDescription;
    case 'Odontopediatria':
      return pediatricDentistryDescription;
    case 'Ortodontia':
      return orthodonticsDescription;
    case 'Periodontia':
      return periodonticsDescription;
    case 'Endodontia':
      return endodonticsDescription;
    case 'Dentística':
      return dentistryDescription;
    case 'Prótese':
      return prosthesisDescription;
    case 'Cirurgia':
      return surgeryDescription;
    default:
      return '';
  }
}

const categoryList = [
  {'img': 'avaliacao.png', 'title': 'Avaliação'},
  {'img': 'implante.png', 'title': "Implantodontia"},
  {'img': 'kids.png', 'title': 'Odontopediatria'},
  {'img': 'orto.png', 'title': 'Ortodontia'},
  {'img': 'perio.png', 'title': 'Periodontia'},
  {'img': 'endo.png', 'title': 'Endodontia'},
  {'img': 'restaura.png', 'title': 'Dentística'},
  {'img': 'protese.png', 'title': 'Prótese'},
  {'img': 'cirurgia.png', 'title': 'Cirurgia'},
];

showMonth(String scheduleMonth) {
  var formatedScheduleMonth = scheduleMonth;
  switch (formatedScheduleMonth) {
    case '1':
      return 'JAN';
    case '2':
      return 'FEV';
    case '3':
      return 'MAR';
    case '4':
      return 'ABR';
    case '5':
      return 'MAI';
    case '6':
      return 'JUN';
    case '7':
      return 'JUL';
    case '8':
      return 'AGO';
    case '9':
      return 'SET';
    case '10':
      return 'OUT';
    case '11':
      return 'NOV';
    case '12':
      return 'DEZ';
    default:
      return '';
  }
}
