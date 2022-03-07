import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomasz_krason_flutter_academy_task_zero/styles/styles.dart';
import '../providers/grid_style_provider.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({Key? key}) : super(key: key);

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
        child: Container(
          margin: const EdgeInsets.all(4),
          child: Center(
            child: ClipRRect(
              borderRadius: border,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Dlaczego Flutter Academy?? Chciałbym podnieść swojego skilla flutterowego, a później... kto wie ?',
                  style: provider.nameStyle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
