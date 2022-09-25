import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_service_imitation/cubit/driver_selection/driver_selection_cubit.dart';
import 'package:taxi_service_imitation/cubit/taxi_app_cubit.dart';

import 'package:taxi_service_imitation/screens/home_page.dart';
import 'package:taxi_service_imitation/screens/order_fulfillment_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final taxiAppCubit = TaxiAppCubit();
  final driverSelectionCubit = DriverSelectionCubit();

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          primaryIconTheme: const IconThemeData(color: Colors.red),
          iconTheme: const IconThemeData(color: Colors.grey),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              elevation: 8, backgroundColor: Colors.amberAccent),
          primaryTextTheme: const TextTheme(
            bodyText2: TextStyle(fontSize: 38, fontFamily: "Handwritten"),
            bodyText1: TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
        home: HomePage(
          driverSelectionCubit: driverSelectionCubit,
          taxiAppCubit: taxiAppCubit,
        ));
  }
}
