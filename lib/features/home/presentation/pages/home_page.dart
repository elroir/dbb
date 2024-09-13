import 'package:flutter/material.dart';

import '../widgets/banner_ad.dart';
import '../widgets/navigator_curved_bar.dart';

class HomePage extends StatelessWidget {
  final Widget child;

  const HomePage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BannerAdWidget(),
      ),
      body: child,
      bottomNavigationBar: const NavigatorCurvedBar(),
    );
  }
}
