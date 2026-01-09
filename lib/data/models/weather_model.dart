class Location {
  String? name;
  String? country;
  String? localtime;

  Location({this.name, this.country, this.localtime});
  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      country: json['country'],
      localtime: json['localtime'],
    );
  }
}

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
    this.windKph,
    this.precipMm,
    this.humidity,
    this.uv,
    this.condition,
  });
  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      tempC: json['temp_c'],
      isDay: json['is_day'],
      windKph: json['wind_kph'],
      precipMm: json['precip_mm'],
      humidity: json['humidity'],
      uv: json['uv'],
      condition: Condition.fromJson(json['condition']),
    );
  }
}

class Condition {
  String? text;
  String? icon;
  int? code;
  Condition({this.text, this.icon, this.code});

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json['text'],
      icon: json['icon'],
      code: json['code'],
    );
  }
}

// class FD {
//   Day day;

//   FD(this.fd, {required fd});

//   factory FD.fromJson(List<dynamic> json) {
//     return FD(fd: json[2]);
//   }
// }

// class Day {
//   double? maxtemp_c;
//   double? mintemp_c;

//   Day({this.maxtemp_c, this.mintemp_c});

//   factory Day.fromJson(Map<String, dynamic> json) {
//     return Day(
//       maxtemp_c: json['maxtemp_c'],
//       mintemp_c: json['mintemp_c'],
//       fd: FD.fromJson(json[2]),
//     );
//   }
// }

// class ForeCast {
//   Day day;
//   ForeCast({required this.day});

//   factory ForeCast.fromJson(Map<String, dynamic> json) {
//     return ForeCast(day: Day.fromJson(json['day']));
//   }
// }

// class WeatherModel {
//   final Location location;
//   final Current current;
//   // final ForeCast forecast;

//   WeatherModel({
//     required this.location,
//     required this.current,
//     // required this.forecast,
//   });

//   factory WeatherModel.fromJson(Map<String, dynamic> json) {
//     return WeatherModel(
//       location: Location.fromJson(json['location']),
//       current: Current.fromJson(json['current']),
// forecast: ForeCast.fromJson(json['forecast']),
//     );
//   }
// }

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    // print('${jsonData['avgtemp_c']}');
    return WeatherModel(
      date: (data['location']['localtime']),
      temp: jsonData['avgtemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData['mintemp_c'],
      weatherStateName: jsonData['condition']['text'],
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'temp=$temp,\nmaxtemp=$maxTemp,mintemp=$minTemp,';
  }
}
