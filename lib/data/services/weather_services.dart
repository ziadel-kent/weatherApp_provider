import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:moreeeeee/data/models/article_model.dart';
import 'package:moreeeeee/data/models/weather_model.dart';

// class WeatherServices {
//   final Dio dio;

//   WeatherServices(this.dio);

//   Future<WeatherResponse> getWeather(String city) async {
//     try {
//       final response = await dio.get(
//         'https://api.weatherapi.com/v1/forecast.json',
//         queryParameters: {
//           'q': city,
//           'key': '5e99b33ca39c4d31946182852260601',
//           'days': '7',
//         },
//       );

//       Map<String, dynamic> jsonData = response.data;
//       WeatherResponse weather = WeatherResponse.fromJson(response.data);
//       return WeatherResponse.fromJson(response.data);
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }

class WeatherServices {
  WeatherModel? weather;

  String baseUrl = 'https://api.weatherapi.com/v1';
  String apiKey = '5e99b33ca39c4d31946182852260601';
  Future<WeatherModel?> getWeather({required String cityName}) async {
    try {
      Uri url = Uri.parse(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7',
      );
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);

      var jsonData = data['forecast']['forecastday'][0];
      weather = WeatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }
    // WeatherModel(
    //   date: data['location']['localtime'],
    //   temp: jsonData['avgtemp_c'],
    //   maxTemp: jsonData['maxtemp_c'],
    //   minTemp: jsonData['mintemp_c'],
    //   weatherStateName: jsonData['condition']['text'],
    // );
    // String localTime = data['location']['localtime'];
    // String avg = data['forecast']['forecastday'][0]['avgtemp_c'];
    // if (localTime != null) print('$localTime,\n$avg');

    return weather;
  }
}

// class ApiResponse {
//   Location? location;
//   Current? current;

//   ApiResponse({this.location, this.current});

//   ApiResponse.fromJson(Map<String, dynamic> json) {
//     location =
//         json['location'] != null
//             ? new Location.fromJson(json['location'])
//             : null;
//     current =
//         json['current'] != null ? new Current.fromJson(json['current']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.location != null) {
//       data['location'] = this.location!.toJson();
//     }
//     if (this.current != null) {
//       data['current'] = this.current!.toJson();
//     }
//     return data;
//   }
// }

// class Location {
//   String? name;
//   String? country;
//   String? localtime;

//   Location({this.name, this.country, this.localtime});

//   Location.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     country = json['country'];
//     localtime = json['localtime'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['country'] = this.country;
//     data['localtime'] = this.localtime;
//     return data;
//   }
// }

class Current {
  double? tempC;
  int? isDay;
  Condition? condition;
  double? windKph;
  double? precipMm;
  int? humidity;
  double? uv;

  Current({
    this.tempC,
    this.isDay,
    this.condition,
    this.windKph,
    this.precipMm,
    this.humidity,
    this.uv,
  });

  Current.fromJson(Map<String, dynamic> json) {
    tempC = json['temp_c'];
    isDay = json['is_day'];
    condition =
        json['condition'] != null
            ? new Condition.fromJson(json['condition'])
            : null;
    windKph = json['wind_kph'];
    precipMm = json['precip_mm'];
    humidity = json['humidity'];
    uv = json['uv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp_c'] = this.tempC;
    data['is_day'] = this.isDay;
    if (this.condition != null) {
      data['condition'] = this.condition!.toJson();
    }
    data['wind_kph'] = this.windKph;
    data['precip_mm'] = this.precipMm;
    data['humidity'] = this.humidity;
    data['uv'] = this.uv;
    return data;
  }
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({this.text, this.icon, this.code});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['icon'] = this.icon;
    data['code'] = this.code;
    return data;
  }
}
