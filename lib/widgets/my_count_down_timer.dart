// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

import 'package:taxi_service_imitation/cubit/driver_selection/driver_selection_cubit.dart';
import 'package:taxi_service_imitation/cubit/taxi_app_cubit.dart';
import 'package:taxi_service_imitation/my_styles/text_styles.dart';
import 'package:taxi_service_imitation/screens/home_page.dart';

class MyCountDownTimer extends StatelessWidget {
  final DriverSelectionCubit driverSelectionCubit;
  final TaxiAppCubit taxiAppCubit;
  const MyCountDownTimer({
    Key? key,
    required this.driverSelectionCubit,
    required this.taxiAppCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularCountDownTimer(
            onComplete: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomePage(
                    driverSelectionCubit: driverSelectionCubit,
                    taxiAppCubit: taxiAppCubit),
              ));
            },
            isReverse: true,
            strokeWidth: 10,
            width: 90,
            height: 90,
            duration: 120,
            fillColor: Theme.of(context).primaryColor,
            ringColor: Colors.white),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Водитель в пути",
          style: textStyleForOrderFulfillment,
        ),
      ],
    );
  }
}
