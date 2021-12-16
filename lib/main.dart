import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_youtube_ui/widgets/video_info.dart';
import 'package:provider/provider.dart' as provider;
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_youtube_ui/screens/nav_screen.dart';
import 'package:flutter_youtube_ui/widgets/custom_sliver_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'lab1_dart.dart';

Future<List<Map<String, dynamic>>> getJSONData() async {
  final response = await http.get(Uri.parse(
      "https://raw.githubusercontent.com/LukaDjent/flutter_labs/lib/data.json"));

  if (response.statusCode == 200) {
    final list = (jsonDecode(response.body) as List);
    return list.map((e) => e as Map<String, dynamic>).toList();
  } else {
    throw Exception('Failed fetch data');
  }
}

Future<String> getDataWithDelay() async {
  return await fetchDataWithDelay();
}

Future<String> fetchDataWithDelay() => Future.delayed(
  const Duration(seconds: 3), () => 'Data from server with delay',
);

Future<void> main() async {
  runApp(
    provider.ChangeNotifierProvider(
      create: (context) => DrawerModel(),
      child: ProviderScope(
          child: MyApp()
      ),
    ),
  );

  print('Json data: ');
  print(await getJSONData());
  print('Example of await...');
  print(await getDataWithDelay());
  print('Example of .then()...');
  getDataWithDelay().then((response) {
    print(response);
  });

  MyClass obj = MyClass(num1: 10, num2: 20);
  obj.setPrivateNum = obj.num1;
  print("private: ${obj.getPrivateNum}");
  print(obj.sugarDemonstration(null));
  print(obj.toString());
  print(obj.sugarDemonstration(5));
  print(obj.toString());

  MyClass obj2 = MyClass.init(num1: 100, num2: 200);
  print(obj2.toString());

  var b = MyClass.factory(false, -10, -20);
  print(b.toString());

  var addOne = sum(1);
  print(addOne(1));

  functionWithParameters(10);
  functionWithParameters(10, y: 20);
  functionWithParameters(10, y: 20, z: 30);

  SelectDayOfWeek()
    ..setColor(Days.Thursday)
    ..printDay();

  assertExample(25);

  var list = [1, 2, 3, 4, 5];
  print("list length: ${list.length}");
  list.add(10);
  list.removeAt(0);
  list.forEach((element) {print(element);});

  var infoAboutMe = {
    "name": "Jack",
    "surname": "Lysenko",
    "group": "TI-82",
    "birthday": "01.01.2001"
  };
  infoAboutMe["name"] = "Luka";
  infoAboutMe.remove(4);
  print("keys: ${infoAboutMe.keys}, values: ${infoAboutMe.values}, length: ${infoAboutMe.length}");
  print(infoAboutMe);

  var set = {1, 2, 3, 4, 5};
  set.add(6);
  print("first: ${set.first}, last: ${set.last}, length: ${set.length}");
  var newSet = set.where((element) => element > 3);
  print(newSet);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool isDarkTheme = true;

  _MyAppState() {
    SharedPreferences.getInstance().then((sp) {
      setState(() {
        isDarkTheme = sp.getBool('isDarkTheme') ?? true;
      });
    });
  }// This widget is the root of your application.

  void toggleTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme;
      SharedPreferences.getInstance().then((sp) {
        sp.setBool('isDarkTheme', isDarkTheme);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'TI-82 Luka Lysenko',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(selectedItemColor: Colors.white),
      ),
      themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      initialRoute: '',
      routes: {
        '': (context) => NavScreen(toggleTheme: toggleTheme),
        '/avatar': (context) => AvatarScreen(),
      }
    );
  }
}
