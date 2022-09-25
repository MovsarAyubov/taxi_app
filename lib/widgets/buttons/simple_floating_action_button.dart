// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:taxi_service_imitation/cubit/driver_selection/driver_selection_cubit.dart';
import 'package:taxi_service_imitation/cubit/taxi_app_cubit.dart';
import 'package:taxi_service_imitation/screens/home_page.dart';

class SimpleFloatinActionButton extends StatelessWidget {
  final DriverSelectionCubit driverSelectionCubit;
  final TaxiAppCubit taxiAppCubit;
  const SimpleFloatinActionButton({
    Key? key,
    required this.driverSelectionCubit,
    required this.taxiAppCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomePage(
              driverSelectionCubit: driverSelectionCubit,
              taxiAppCubit: taxiAppCubit),
        ));
      },
      label: const Text(
        "Отмена",
        style: TextStyle(fontSize: 22),
      ),
      icon: const Icon(
        Icons.cancel_outlined,
        size: 34,
      ),
    );
  }
}
