import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomasz_krason_flutter_academy_task_zero/models/models.dart';
import 'package:tomasz_krason_flutter_academy_task_zero/providers/grid_style_provider.dart';
import 'package:tomasz_krason_flutter_academy_task_zero/services/data_service.dart';
import 'package:tomasz_krason_flutter_academy_task_zero/styles/styles.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({Key? key}) : super(key: key);

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  WeatherResponse? _response;

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }

  @override
  void initState() {
   
    super.initState();
    _search();
  }

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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: _response == null
                      ? [
                          const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ]
                      : [
                          Center(
                            child: Text(_response!.cityName,
                                style: provider.nameStyle),
                          ),
                          Image.network(_response!.iconUrl),
                          Center(
                            child: Text(
                              '${_response!.tempInfo.temperature.toStringAsFixed(0)}°',
                              style: provider.nameStyle,
                            ),
                          ),
                          Center(
                            child: Text(_response!.weatherInfo.description,
                                style: provider.nameStyle,textAlign: TextAlign.center,),
                          ),
                        ],
                ),
              ],
            ),
          )),
    );
  }
}
