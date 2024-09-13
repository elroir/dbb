import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../../../core/resources/ad_units.dart';

part 'banner_ad_event.dart';
part 'banner_ad_state.dart';

class BannerAdBloc extends Bloc<BannerAdEvent, BannerAdState> {
  BannerAdBloc() : super(BannerAdInitial()) {
    on<InitAds>((event, emit) async {
      final AnchoredAdaptiveBannerAdSize? size =
          await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(event.screenWidth);

      final adUnit = Platform.isIOS ? AdUnits.prodIosId : AdUnits.prodAndroidId;

      final BannerAd bannerAd = BannerAd(
          adUnitId: adUnit,
          size: size ?? AdSize.banner,
          request: const AdRequest(),
          listener: BannerAdListener(
            onAdFailedToLoad: (ad, error) {
              emit(BannerAdError());
              ad.dispose();
            },

          )
      );


      await bannerAd.load();
      emit(BannerAdLoaded(bannerAd: bannerAd));
    });
  }
}
