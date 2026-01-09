import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:moreeeeee/core/provider.dart';
import 'package:moreeeeee/data/models/color_model.dart';
import 'package:moreeeeee/data/models/weather_model.dart';
import 'package:moreeeeee/data/services/dio_service.dart';
import 'package:moreeeeee/data/services/weather_services.dart';
import 'package:moreeeeee/main.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  WeatherModel? weathermodel;

  HomeScreen({super.key, this.weathermodel});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  void updateUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final weatherData = Provider.of<WeatherProvider>(context).weatherData;
    final cityName = Provider.of<WeatherProvider>(context).cityName;
    final weatherColor = Provider.of<WeatherProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        bottomOpacity: 12,
        elevation: 32,
        backgroundColor:
            weatherData == null
                ? Colors.grey
                : Provider.of<WeatherProvider>(
                  context,
                ).getColorIcon(weatherData.weatherStateName),
        title: Text('Weather App'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchPage(updateUi: updateUi);
                  },
                ),
              );
              // نفتح صفحة البحث ونستنى النتيجة
              // final city = await Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (_) => SearchPage()),
              // );

              // if (city != null) {
              //   // ننتقل لـ FindWeather أو نحدثه
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (_) => FindWeather(cityName: city),
              //     ),
              //   );
              // }
            },
          ),
        ],
      ),
      body:
          weatherData == null
              ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'There\'s no weather start 😶',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Text(
                      'Searching Now 👀',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey
                      ),
                    ),
                  ],
                ),
              )
              : Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      weatherColor.getColorIcon(weatherData.weatherStateName),
                      const Color.fromARGB(255, 197, 195, 195),
                      weatherColor.getColorIcon(weatherData.weatherStateName),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                // color: Provider.of<WeatherProvider>(
                //   context,
                // ).getColorIcon(weatherData.weatherStateName),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 1),
                    Text(
                      '${cityName.toUpperCase()}',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${weatherData.date}',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(flex: 1),
                    Row(
                      children: [
                        Spacer(flex: 1),
                        getimageIcon(weatherData.weatherStateName),
                        // Image.asset(
                        //   '${getimageIcon('${weatherData.weatherStateName}')}',
                        //   height: 40,
                        //   width: 40,
                        // ),
                        Spacer(flex: 1),
                        Text('Temp:${weatherData.temp}'),
                        Spacer(flex: 1),
                        Column(
                          children: [
                            Text('MaxTemp:${weatherData.maxTemp.toInt()}'),
                            Text('MinTemp:${weatherData.minTemp.toInt()}'),
                          ],
                        ),

                        Spacer(flex: 1),
                      ],
                    ),
                    Spacer(flex: 1),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        maxLines: 1,
                        weatherData.weatherStateName,
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(flex: 2),
                  ],
                ),
              ),
    );
  }
}

class SearchPage extends StatelessWidget {
  VoidCallback updateUi;
  SearchPage({required this.updateUi, super.key});
  var cityName;
  var service = WeatherServices();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text('Search For a City'),
          ),

          // backgroundColor: Colors.orange,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              onChanged: (value) => cityName = value,
              onFieldSubmitted: (value) async {
                var cityName = value.trim();

                WeatherModel? weathermodel = await service.getWeather(
                  cityName: cityName,
                );
                Provider.of<WeatherProvider>(context, listen: false)
                    .weatherData = weathermodel;
                Provider.of<WeatherProvider>(context, listen: false).cityName =
                    cityName;
                Navigator.pop(context);
              },
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () async {
                    WeatherModel? weathermodel = await service.getWeather(
                      cityName: cityName!,
                    );
                    Provider.of<WeatherProvider>(context, listen: false)
                        .weatherData = weathermodel;
                    Provider.of<WeatherProvider>(context, listen: false)
                        .cityName = cityName;
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.search),
                ),
                label: Text('Search'),
                hintText: 'search ya sa7by',
                hintStyle: TextStyle(color: Colors.grey),
                constraints: BoxConstraints(
                  minHeight: 120,
                  maxHeight: 200,
                  minWidth: 220,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class FindWeather extends StatefulWidget {
//   final String cityName;
//   const FindWeather({super.key, required this.cityName});

//   @override
//   State<FindWeather> createState() => _FindWeatherState();
// }

// class _FindWeatherState extends State<FindWeather> {
//   late final WeatherServices weather;
//   late Future<WeatherResponse> weatherFuture;

//   @override
//   void initState() {
//     super.initState();
//     weather = WeatherServices(createDio());
//     weatherFuture = weather.getWeather(widget.cityName);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Weather in ${widget.cityName}')),
//       body: Center(
//         child: FutureBuilder<WeatherResponse>(
//           future: weatherFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return CircularProgressIndicator();
//             }

//             if (snapshot.hasError) {
//               print(snapshot.error);
//               return Text('Error: ${snapshot.error}');
//             }

//             if (!snapshot.hasData) {
//               return Text('No data');
//             }

//             final weatherData = snapshot.data!;

//             return Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ListTile(
//                   title: Text(weatherData.location.name!),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('${weatherData.current.tempC}°C'),
//                       Text(weatherData.current.condition!.text!),
//                     ],
//                   ),
//                   trailing: Text('${weatherData.location.localtime}'),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }


Image getimageIcon(String name) {
  switch (name.toLowerCase()) {
    case 'sunny':
      return Image.asset('assets/images/weather/clear.png');
    case 'thunder':
      return Image.asset('assets/images/weather/cloudy.png');
    case 'moderate rain':
      return Image.asset('assets/images/weather/rainy.png');
    case 'moderate snow':
      return Image.asset('assets/images/weather/snow.png');
    case 'Heavy rain':
      return Image.asset('assets/images/weather/thunderstorm.png');
    default:
      return Image.asset(
        'assets/images/weather/thunderstorm.png',
      ); // fallback icon
  }
}
