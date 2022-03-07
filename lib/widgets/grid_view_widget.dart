import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:tomasz_krason_flutter_academy_task_zero/providers/grid_style_provider.dart';
import 'package:tomasz_krason_flutter_academy_task_zero/styles/styles.dart';
import 'package:tomasz_krason_flutter_academy_task_zero/widgets/description_widget.dart';
import 'package:tomasz_krason_flutter_academy_task_zero/widgets/foto_widget.dart';
import 'package:tomasz_krason_flutter_academy_task_zero/widgets/hobby_widget.dart';
import 'package:tomasz_krason_flutter_academy_task_zero/widgets/name_widget.dart';
import 'package:tomasz_krason_flutter_academy_task_zero/widgets/social_widget.dart';
import 'package:tomasz_krason_flutter_academy_task_zero/widgets/theme_switcher_widget.dart';
import 'package:tomasz_krason_flutter_academy_task_zero/widgets/weather_widget.dart';

class GridViewWidget extends StatefulWidget {
  const GridViewWidget({Key? key}) : super(key: key);

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => GridStyleProvider(),
        builder: (context, _) {
          final gridStyleProvider = Provider.of<GridStyleProvider>(context);
          return WillPopScope(
            onWillPop: () async => false,
            child: GestureDetector(
              onTap: () {
                final provider =
                    Provider.of<GridStyleProvider>(context, listen: false);
                provider.gridChange();
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: border,
                    color: gridStyleProvider.isFirstTime
                        ? Colors.grey[900]
                        : gridStyleProvider.randomBackgroundGridColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(spacing),
                    child: StaggeredGrid.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: gridStyleProvider.spacing,
                      crossAxisSpacing: gridStyleProvider.spacing,
                      children: const [
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: NameWidget(),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 1,
                          child: DescriptionWidget(),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 2,
                          child: WeatherWidget(),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: FotoWidget(),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: HobbyWidget(),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: SocialWidget(),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: ThemeSwitcherWidget(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
