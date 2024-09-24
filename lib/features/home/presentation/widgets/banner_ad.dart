import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../bloc/banner_ad/banner_ad_bloc.dart';

class BannerAdWidget extends StatelessWidget {
  const BannerAdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BannerAdBloc()..add(InitAds(screenWidth: MediaQuery.of(context).size.width.truncate())),
      child: Builder(
        builder: (context) {
          return BlocBuilder<BannerAdBloc, BannerAdState>(
            builder: (_, state) {
              if (state is BannerAdLoaded) {
                return SizedBox(
                    height: state.bannerAd.size.height.toDouble(),
                    child: AdWidget(ad: state.bannerAd)
                );
              }
              return const SizedBox();
            },
          );
        }
      ),
    );
  }
}
