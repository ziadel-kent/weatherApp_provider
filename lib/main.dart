import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moreeeeee/core/provider.dart';
import 'package:moreeeeee/data/models/weather_model.dart';
import 'package:moreeeeee/data/services/weather_services.dart';
import 'package:moreeeeee/presentation/screens/search_screen.dart';
import 'package:moreeeeee/root.dart';
import 'package:moreeeeee/data/services/news_service.dart';
import 'package:moreeeeee/presentation/screens/business_card_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moreeeeee/tests/home.dart';
import 'package:provider/provider.dart';

// dependency injection
final newsService = NewsService(Dio());
// final weatherServices = WeatherServices(Dio());

//!Practice
// Future<void> fetchData() async {
//   try {
//     final response = await http.get(Uri.parse('http://10.0.2.2:5000/users'));
//     var data = jsonDecode(response.body);
//     if (response.statusCode == 200) {
//       print('User email:${data}');
// print(response.body);
//     }
//   } catch (e) {
//     print(e);
//   }
// }

//!Practicehttp
// Future<void> postData() async {
//   try {
//     final request = await http.post(
//       Uri.parse('http://10.0.2.2:5000/users'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({"name": "New", "email": "new"}),
//     );
//     var data = jsonDecode(request.body);
//     if (request.statusCode == 201) {
//       print('${data['name']}');
//     } else {
//       print('something off');
//     }
//   } catch (e) {
//     print(e);
//   }
// }
//!Practicehttp
// Future<void> sendData() async {
//   final response = await http.post(
//     Uri.parse('http://10.0.2.2:5000/users'),
//     headers: {'Content-Type': 'application/json'},
//     body: jsonEncode({"name": "New User", "email": "new@example.com"}),
//   );
//   if (response.statusCode == 201) {
//     print(response.body);
//   }
// }
//!Practice http
// Future<void> fetchUser() async {
//   try {
//     final response = await http
//         .get(Uri.parse('https://reqres.in/api/users/2'))
//         .timeout(Duration(seconds: 10));
//     if (response.statusCode == 200) {
//       var data = jsonDecode(response.body);
//       print("User name: ${data['data']['first_name']}");
//     } else if (response.statusCode == 403) {
//       print("Forbidden: Server refused the request");
//     } else {
//       print("Server error: ${response.statusCode}");
//     }
//   } catch (e) {
//     print("Connection failed: $e");
//   }
// }

//!dio
// Future<void> postData() async {
//   Dio dio = Dio();
//   final id = 8115268;
//   final token =
//       'b87f923f384ec2c3f28546b90125de9e86138c9ee93ca97f8f515e310f1ab0da';
//   try {
//     final response = await dio.put(
//       'https://gorest.co.in/public/v2/users/${id}',
//       options: Options(
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $token',
//         },
//       ),
//       data: {'name': 'moahamed', 'status': 'inactive'},
//     );
//  body:{ 'name':'ziad',
//         'email':'ziad_${DateTime.now().millisecondsSinceEpoch}@example.com',
// 'gender':'male',
// 'status':'active'
//  }
//     if (response.statusCode == 200) {
//       print(response.data);
//       print('done');
//     } else {
//       print(response.statusCode);
//     }
//   } on DioException catch (e) {
//     print('Error: ${e.response?.statusCode} - ${e.message}');
//   }
// }

//!this code is (model+serverapi+ui)
// void main() {
//   runApp(MyApp());
// }
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
// class _MyAppState extends State<MyApp> {
//   bool isLoading = false;
//   VoidCallbackAction? onTap;
//   String postResult = '';
//   List<User> users = [];
//   final String baseUrl = 'http://10.0.2.2:5000';
//   // get
//   Future<void> fetchData() async {
//     try {
//       setState(() {
//         isLoading = true;
//       });
//       final response = await http.get(Uri.parse('$baseUrl/users'));
//       List data = jsonDecode(response.body);
//       if (response.statusCode == 200) {
//         setState(() {
//           users = data.map((json) => User.fromJson(json)).toList();
//         });
//       } else {
//         postResult = 'wrong in ${response.statusCode}';
//       }
//     } catch (e) {
//       setState(() {
//         postResult = 'connection failed${e}';
//         print(e);
//       });
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//   Future<void> postData() async {
//     try {
//       setState(() {
//         isLoading = true;
//       });
//       final request = await http.post(
//         Uri.parse('http://10.0.2.2:5000/users'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'name': 'New Name', 'email': 'new@example.com'}),
//       );
//       if (request.statusCode == 201) {
//         var data = jsonDecode(request.body);
//         setState(() {
//           postResult = 'Created: ${data['name']},${data['email']}';
//         });
//       } else {
//         postResult = 'created failed${request.statusCode}';
//       }
//     } catch (e) {
//       print('connection failed${e}');
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
// @override
// void initState() {
//   super.initState();
//   fetchData();
// }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(title: Text('')),
//         body: Column(
//           children: [
//             Row(
//               children: [
//                 TextFormField(onTap: () => onTap,),
//                 ElevatedButton(
//                   child: Text('GET'),
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
//                   ),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
//                   onPressed: postData,
//                   child: Text('SendData(POST)'),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             if (isLoading)
//               const CircularProgressIndicator()
//             else ...[
//               if (postResult.isNotEmpty) ...[
//                 Text(
//                   postResult,
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10),
//               ],
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: users.length,
//                   itemBuilder: (context, index) {
//                     final user = users[index];
//                     return ListTile(
//                       title: Text(user.name),
//                       subtitle: Text(user.email),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }
// // Model class
// class User {
//   final int id;
//   final String name;
//   final String email;
//   User({required this.id, required this.name, required this.email});
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(id: json['id'], name: json['name'], email: json['email']);
//   }
// }

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  // NewsService(Dio()).getNewsCategory('business');
  // weatherServices.getWeather('qina');

  runApp(
    ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: DevicePreview(enabled: true, builder: (context) => const MyApp()),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp();
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;
  @override
  WeatherModel? weather;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // ecosystem theming
        brightness:
            (Provider.of<WeatherProvider>(context).weatherData?.maxTemp ?? 30) >
                    25
                ? Brightness.light
                : Brightness.light,
        // primarySwatch: Provider.of<WeatherProvider>(context).getColorIcon(),
      ),
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: Root(),
      // theme: isDark ? ThemeData.dark() : ThemeData.light(),
    );
  }
}

class MyApp2 extends StatelessWidget {
  WeatherModel? weather;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // ecosystem theming
        brightness:
            (Provider.of<WeatherProvider>(context).weatherData?.maxTemp ?? 30) >
                    25
                ? Brightness.dark
                : Brightness.light,
        // primarySwatch: Provider.of<WeatherProvider>(context).getColorIcon(),
      ),
      home: HomeScreen(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         fontFamily: 'Cabin',
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: const login(),
//     );
//   }
// }
