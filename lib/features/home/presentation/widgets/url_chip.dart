import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../core/resources/app_resources.dart';
import '../bloc/url_launcher/url_bloc.dart';
class UrlChip extends StatelessWidget {
  final String text;
  final String url;
  const UrlChip({super.key, this.text = '', required this.url});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UrlBloc,UrlState>(
      listener: (context, state) {
        if(state is UrlError){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: OutlinedButton(
        onPressed: () => context.read<UrlBloc>().add(LaunchUrl(link: url)),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.horizontalPadding),
          visualDensity: VisualDensity.compact,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(IconsaxPlusBold.link,size: 20,),
            const SizedBox(width: 5,),
            Flexible(
              child: Text(text,
                  overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
