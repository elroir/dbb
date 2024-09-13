part of 'banner_ad_bloc.dart';

sealed class BannerAdEvent extends Equatable {
  const BannerAdEvent();
}

class InitAds extends BannerAdEvent {
  final int screenWidth;

  const InitAds({required this.screenWidth});

  @override
  List<Object> get props => [screenWidth];
}