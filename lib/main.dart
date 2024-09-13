import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'core/router/router.dart';
import 'core/theme/themes.dart';
import 'features/bank/presentation/bloc/bank_bloc.dart';
import 'features/home/presentation/bloc/url_launcher/url_bloc.dart';
import 'injection_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BankBloc>(
          create: (context) => BankBloc(locator(), locator())..add(InitBanks()),
        ),
        BlocProvider<UrlBloc>(
          create: (_) => UrlBloc(locator()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Datos Bancos Bolivia',
        theme: Themes.darkTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: CustomRouter.router,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('es'),
          Locale('es', 'BO'),
          Locale('es', 'US'),
        ],
      ),
    );
  }
}


