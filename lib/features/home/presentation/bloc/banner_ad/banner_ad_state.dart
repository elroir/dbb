part of 'banner_ad_bloc.dart';

sealed class BannerAdState extends Equatable {
  const BannerAdState();
}

final class BannerAdInitial extends BannerAdState {
  @override
  List<Object> get props => [];
}

final class BannerAdLoaded extends BannerAdState {
  final BannerAd bannerAd;

  const BannerAdLoaded({required this.bannerAd});

  @override
  List<Object> get props => [bannerAd];
}

final class BannerAdReady extends BannerAdState {
  final BannerAd bannerAd;

  const BannerAdReady({required this.bannerAd});

  @override
  List<Object> get props => [bannerAd];
}

final class BannerAdError extends BannerAdState {

  @override
  List<Object> get props => [];
}