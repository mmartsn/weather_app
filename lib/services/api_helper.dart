import 'package:http/http.dart' as http;
//import 'dart:convert';

class ApiHelper {
  final String apiKey = 'd6d420c46489d10eef8414e71ab90f50';
  late final Uri requestUri;
  final double longitude;
  final double latitude;
  ApiHelper(this.longitude, this.latitude) {
    String url =
        'https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&exclude=minutely&appid=$apiKey&units=metric';
    requestUri = Uri.parse(url);
  }

  Future getData() async {
    http.Response response = await http.get(requestUri);
    if (response.statusCode == 200) {
      String data = response.body;
      return data; //jsonDecode(data);
    } else {
      //print(response.statusCode.toString());
      return 'statusIsNot200';
    }
  }
}



  // double currentTemperature = weatherData['current']['temp'];
  // String cityName = weatherData['timezone'];
  // int currentCondition = weatherData['current']['weather'][0]['id'];
  // var hourly = weatherData['hourly'];
  // var daily = weatherData['daily'];

