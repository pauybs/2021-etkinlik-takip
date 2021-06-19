import 'package:flutter/material.dart';

class DateDiff {
  final String? date;
  final String? dateDiff;
  late DateTime firstDate;
  DateDiff({
    this.date,
    required this.dateDiff,
  }) {
    firstDate = date != null
        ? DateTime.parse(date!).toLocal()
        : DateTime.now().toLocal();
  }

  DateTime get _secondDate => DateTime.parse(dateDiff!);

  Duration get _diff => firstDate.difference(_secondDate);

  String get since {
    if (_diff.inHours.toInt() < 1) {
      return '${_diff.inMinutes}m';
    } else if (_diff.inHours.toInt() < 1.toDay) {
      return '${_diff.inHours}h';
    } else if (_diff.inHours.toInt() < 7.toDay) {
      return '${_diff.inDays}d';
    } else if (_diff.inHours.toInt() < 30.toDay) {
      return '${_diff.inDays.toWeek}w';
    } else {
      return '${_diff.inDays.toMonth}ay';
    }
  }

  String get dateDayMinute {
    String? mount;
    final dateParse = DateTime.parse(date.toString());

    mount = getMountName(dateParse.month);

    final formattedDate =
        '${dateParse.day} ${mount} / ${dateParse.hour}.${dateParse.minute} ';
    return formattedDate;
  }

  String get getDayMount {
    String? mount;
    final dateParse = DateTime.parse(date.toString());

    mount = getMountName(dateParse.month);

    final formattedDate = '${dateParse.day} ${mount}';
    return formattedDate;
  }
}

String? getMountName(int mount) {
  String? mountName;
  switch (mount) {
    case 1:
      mountName = 'Ocak';
      break;
    case 2:
      mountName = 'Şubat';
      break;
    case 3:
      mountName = 'Mart';
      break;
    case 4:
      mountName = 'Nisan';
      break;
    case 5:
      mountName = 'Mayıs';
      break;
    case 6:
      mountName = 'Haziran';
      break;
    case 7:
      mountName = 'Temmuz';
      break;
    case 8:
      mountName = 'Ağustos';
      break;
    case 9:
      mountName = 'Eylül';
      break;
    case 10:
      mountName = 'Ekim';
      break;
    case 11:
      mountName = 'Kasım';
      break;
    case 12:
      mountName = 'Aralık';
      break;
    default:
  }
  return mountName;
}

extension TimeSwitch on num {
  int get toDay => this * 24 as int;
  int get toWeek => this ~/ 7;
  int get toMonth => this ~/ 30;
}
