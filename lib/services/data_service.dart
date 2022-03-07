import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tomasz_krason_flutter_academy_task_zero/models/models.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    

    final queryParameters = {
      'q': 'wroclaw',
      'appid': 'e138e59f1e2b0984e231364b3679f98a',
      'units': 'metric',
      'lang': 'pl'
    };

    final uri = Uri.https(
        'api.openweathermap.org','/data/2.5/weather',queryParameters);

    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}