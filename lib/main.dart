import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather_repository.dart';
import 'screens/home_screen.dart';
import 'package:weather_app/blocs/blocs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.blueGrey, // navigation bar color
    statusBarColor: Colors.blueGrey, // status bar color
    statusBarIconBrightness: Brightness.light, // status bar icon color
    systemNavigationBarIconBrightness:
        Brightness.light, // color of navigation controls
  ));
  FlutterNativeSplash.removeAfter(initialization);
  BlocOverrides.runZoned(
    () => runApp(BlocProvider(
      create: (context) =>
          WeatherCubit(weatherRepository: ApiLocalRepo())..getWeather(),
      child: const MyApp(),
    )),
  );
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 3));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DaysHoursCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        //   brightness: Brightness.dark,
        // ),
        initialRoute: '/',
        routes: {'/': (_) => const HomeScreen()},
      ),
    );
  }
}
