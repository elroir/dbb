import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime{

  /// returns date String according to device language
  ///
  /// if [showTime] is true it will show date and time, defaults to true
  String toLocalString(BuildContext context,{bool showTime = true}) {
    final languageCode = Localizations.localeOf(context).languageCode;
    final dateFormat = DateFormat.yMd(languageCode);

    String dateString = dateFormat.format(this);
    if(showTime){
      dateString = '$dateString ${DateFormat.Hm(languageCode).format(this)}';
    }

    return dateString;
  }
}