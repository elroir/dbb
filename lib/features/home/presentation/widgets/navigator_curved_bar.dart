import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/router/router.dart';
import '../../../../core/router/routes.dart';
import '../bloc/nav_bar/nav_bar_cubit.dart';
import '../bloc/url_launcher/url_bloc.dart';

class NavigatorCurvedBar extends StatelessWidget {
  const NavigatorCurvedBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavBarCubit(),
      child: BlocConsumer<NavBarCubit, NavBarState>(
        /// Prevents calling the listener if index 0 is pressed at the start
        listenWhen: (previous,current) => previous.currentIndex!=current.currentIndex,
        listener: (context, state) {
          if(state.currentIndex==0){
            context.go(Routes.home);
          }
          if(state.currentIndex==1){
            context.read<NavBarCubit>().updateIndex(0);
            context.read<UrlBloc>().add(const LaunchUrl(link: 'https://www.dolarbo.com'));
          }
          if(state.currentIndex==2){
            context.go(Routes.menu);
          }
        },
        builder: (context, state) {
          return ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            child: BottomNavigationBar(
              currentIndex: state.currentIndex,
                onTap: context.read<NavBarCubit>().updateIndex,
                items: [
                  BottomNavigationBarItem(
                      icon: const Icon(IconsaxPlusBold.bank),
                      label: AppLocalizations.of(context)!.banks,
                  ),
                  BottomNavigationBarItem(
                      icon: const Icon(IconsaxPlusBold.dollar_square),
                      label: AppLocalizations.of(context)!.dollar,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(IconsaxPlusBold.menu),
                    label: AppLocalizations.of(context)!.menu,
                  ),
                ]
            ),
          );
        },
      ),
    );
  }
}
