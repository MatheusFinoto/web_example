// import 'package:another_flushbar/flushbar.dart';
// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_example/src/utils/my_colors.dart';

import 'environment.dart';

MaskTextInputFormatter cpfMaskFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});

MaskTextInputFormatter cnpjMaskFormatter = MaskTextInputFormatter(
    mask: '##.###.###/####-##', filter: {"#": RegExp(r'[0-9]')});

MaskTextInputFormatter cepMask = MaskTextInputFormatter(
  mask: '#####-###',
  filter: {"#": RegExp(r'[0-9]')},
);

MaskTextInputFormatter birthDateMask = MaskTextInputFormatter(
  mask: '##/##/####',
  filter: {"#": RegExp(r'[0-9]')},
);

MaskTextInputFormatter hourMask = MaskTextInputFormatter(
  mask: '##:##',
  filter: {
    "#": RegExp(r'[0-9]'),
  },
);

double appBarHeight = AppBar().preferredSize.height;

BoxDecoration customDecoration(context, {Color? color}) {
  return BoxDecoration(
    color: color ??
        (Theme.of(context).brightness == Brightness.dark
            ? MyColors.grey[700]!
            : MyColors.grey[100]!),
    // border: Border.all(
    //     color: Theme.of(context).brightness == Brightness.dark
    //         ? Colors.grey[300]!
    //         : Colors.black45,
    //     width: 0.5),
    borderRadius: BorderRadius.circular(10),
  );
}

enum HttpStatus { none, loading, success, fail, error }

const String profileImage =
    "https://images.unsplash.com/photo-1531891437562-4301cf35b7e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80";

Future<void> urlLaunch({required String url}) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $uri');
  }
}

Future<void> sendWppMessage(
    {required String phone, required String message}) async {
  String url = "whatsapp://send?phone=$phone&text=$message";
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $uri');
  }
}

const String lorem = '';

Future<String> convertImageToBase64({required File fileImage}) async {
  final bytes = File(fileImage.path).readAsBytesSync();
  String base64 = base64Encode(bytes);
  return base64;
}

Future<void> customFlushBar(
    {required String title,
    required String message,
    required Color color,
    required BuildContext context}) async {
  // ignore: avoid_single_cascade_in_expression_statements
  Flushbar(
    maxWidth: 350,
    margin: const EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(10),
    titleText: Text(
      title,
      style: const TextStyle(color: Colors.white),
    ),
    messageText: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    duration: const Duration(seconds: 2),
    backgroundColor: color,
  )..show(context);
}

String formatPhone({required String phone}) {
  if (phone.substring(0, 2) != "55" || phone.substring(0, 3) != "+55") {
    return "55$phone";
  }

  return phone;
}

void nPrint(message) {
  if (kDebugMode) {
    log(message.toString());
  }
}

DateTime now = DateTime.now();

// DateFormat dateFormatBrl = DateFormat("dd.MM.yyyy");
DateFormat dateFormatEua = DateFormat("yyyy-MM-dd");
DateFormat dateFormatEuaCompleted = DateFormat("yyyy-MM-dd HH:mm:ss");
DateFormat dateEspecial = DateFormat.yMMMd('pt_Br');
DateFormat dateEspecialWeek = DateFormat.yMMMMEEEEd('pt_Br');

bool isDate(String input, String format) {
  try {
    final DateTime d = DateFormat(format).parseStrict(input);
    return true;
  } catch (e) {
    return false;
  }
}

String dateFormatEuaDate({required String date}) {
  var inputFormat = DateFormat('dd/MM/yyyy');
  var inputDate = inputFormat.parse(date);
  var outputFormat = DateFormat('yyyy-MM-dd');
  return outputFormat.format(inputDate);
}

String dateFormatEuaComplete({required DateTime date}) {
  // var inputFormat = DateFormat('dd/MM/yyyy HH:mm:ss');
  // var inputDate = inputFormat.parse(date);
  var outputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  return outputFormat.format(date);
}

String dateFormateMMddEua({required String date}) {
  var inputFormat = DateFormat('dd/MM');
  var inputDate = inputFormat.parse(date);
  var outputFormat = DateFormat('MM-dd');
  return outputFormat.format(inputDate);
}

String dateFormateMMddBrl({required String date}) {
  var inputFormat = DateFormat('MM-dd');
  var inputDate = inputFormat.parse(date);
  var outputFormat = DateFormat('dd/MM');
  return outputFormat.format(inputDate);
}

String dateFormatBrlComplete({required String date}) {
  var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
  var inputDate = inputFormat.parse(date);
  var outputFormat = DateFormat('HH:mm dd/MM/yyyy');
  return outputFormat.format(inputDate);
}

String dateFormatBrlCompleteTZ({required String date}) {
  var inputFormat = DateFormat('yyyy-MM-ddTHH:mmZ');
  var inputDate = inputFormat.parse(date, true).toLocal();
  var outputFormat = DateFormat('dd/MM/yyyy HH:mm');
  return outputFormat.format(inputDate);
}

String dateFormatEuaCompleteTZ({required String date}) {
  var inputFormat = DateFormat('yyyy-MM-dd HH:mmZ');
  var inputDate = inputFormat.parse(date, true).toLocal();
  var outputFormat = DateFormat('yyyy-MM-dd HH:mm:00.000');
  return outputFormat.format(inputDate);
}

String dateFormatBrlTime({required String date}) {
  var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
  var inputDate = inputFormat.parse(date).toLocal();
  var outputFormat = DateFormat('HH:mm');
  return outputFormat.format(inputDate);
}

String dateFormatBrlTimeTZ({required String date}) {
  var inputFormat = DateFormat('yyyy-MM-ddTHH:mm');
  var inputDate = inputFormat.parse(date, true).toLocal();
  var outputFormat = DateFormat('HH:mm');
  return outputFormat.format(inputDate);
}

String dateFormatBrlDate({required String date}) {
  var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
  var inputDate = inputFormat.parse(date);
  var outputFormat = DateFormat('dd/MM/yyyy');
  return outputFormat.format(inputDate);
}

String dateFormatBrlDateTZ({required String date}) {
  var inputFormat = DateFormat('yyyy-MM-ddTHH:mm');
  var inputDate = inputFormat.parse(date);
  var outputFormat = DateFormat('dd/MM/yyyy');
  return outputFormat.format(inputDate);
}

String durationToString(int minutes) {
  var d = Duration(minutes: minutes);
  List<String> parts = d.toString().split(':');
  return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
}

final oCcy = NumberFormat.simpleCurrency(locale: 'pt_BR');

// String formatDuration(Duration duration) {
//   String hours = duration.inHours.toString().padLeft(0, '2');
//   String minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
//   // String seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
//   return "$hours:$minutes";
// }

DateTime dateTimeFromTime({required int time}) {
  return DateTime.parse(
      "${now.year}-${now.month.toString().length == 1 ? "0${now.month}" : "${now.month}"}-${now.day.toString().length == 1 ? "0${now.day}" : "${now.day}"} ${durationToString(time)}:00");
}

int durationToMinutes(Duration duration) {
  return int.parse(duration.inMinutes.remainder(60).toString().padLeft(2, '0'));
}

String getUrlPath() {
  String path = 'P';

  if (Environment.apiUrl.contains("hmg.")) {
    path = "H";
  }

  if (Environment.apiUrl.contains("dev.")) {
    path = "D";
  }

  return path;
}

Widget formatRouter({required String path, required Function onTap}) {
  List<String> splited = path.split('/');

  return Row(
    children: splited.map((e) {
      if (e.isNotEmpty) {
        return Row(
          children: [
            TextButton(
                onPressed: () {
                  onTap(e);
                },
                child: Text(e.toUpperCase())),
            e == splited[splited.length - 1]
                ? Container()
                : const Icon(Icons.arrow_right)
          ],
        );
      } else {
        return Container();
      }
    }).toList(),
  );
}

// List<String> times = [
//   "00:15",
//   "00:30",
//   "00:45",
//   "01:00",
//   "01:15",
//   "01:30",
//   "01:45",
//   "02:00",
//   "02:15",
//   "02:30",
//   "02:45",
//   "03:00",
//   "03:15",
//   "03:30",
//   "03:45",
//   "04:00",
//   "04:15",
//   "04:30",
//   "04:45",
//   "05:00",
//   "05:15",
//   "05:30",
//   "05:45",
//   "06:00",
// ];

List<String> hours = [
  "07:00",
  "07:30",
  "08:00",
  "08:30",
  "09:00",
  "09:30",
  "10:00",
  "10:30",
  "11:00",
  "11:30",
  "12:00",
  "12:30",
  "13:00",
  "13:30",
  "14:00",
  "14:30",
  "15:00",
  "15:30",
  "16:00",
  "16:30",
  "17:00",
  "17:30",
  "18:00",
  "18:30",
  "19:00",
  "19:30",
  "20:00",
  "20:30",
  "21:00",
  "21:30",
];
