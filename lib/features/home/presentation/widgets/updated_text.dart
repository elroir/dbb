import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/extension/date_extensions.dart';

class UpdatedText extends StatelessWidget {
  final DateTime dateTime;
  const UpdatedText({super.key,required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Text('${AppLocalizations.of(context)!.updated}: ${dateTime.toLocalString(context)}',style: Theme.of(context).textTheme.labelSmall);
  }
}
