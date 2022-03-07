import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomasz_krason_flutter_academy_task_zero/styles/styles.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/grid_style_provider.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GridStyleProvider>(context, listen: true);
    return GestureDetector(
      onTap: () {
        final provider = Provider.of<GridStyleProvider>(context, listen: false);
        provider.gridChange();
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: provider.isFirstTime
              ? Colors.grey[800]
              : provider.randomCardColor,
          borderRadius: border,
        ),
        child: IconButton(
            icon: Image.asset('assets/icons/linkedin.png'),
            onPressed: () async {
              const url = 'https://www.linkedin.com/in/tomasz-krason/';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            }),
      ),
    );
  }
}