import 'package:flutter/material.dart';

import '../cubit/driver_selection/driver_selection_cubit.dart';
import '../cubit/taxi_app_cubit.dart';
import '../screens/order_confirmation.dart';
import '../screens/order_fulfillment_page.dart';

class PassDataRoutes {
  static void orderExample(
    BuildContext context, {
    required DriverSelectionCubit driverSelectionCubit,
    required TaxiAppCubit taxiAppCubit,
  }) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => OrderConfirmation(
        driverSelectionCubit: driverSelectionCubit,
        taxiAppCubit: taxiAppCubit,
      ),
    ));
  }

  static void waiting(
    BuildContext context, {
    required DriverSelectionCubit driverSelectionCubit,
    required TaxiAppCubit taxiAppCubit,
  }) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => OrderFulFillmentPage(
                  taxiAppCubit: taxiAppCubit,
                  driverSelectionCubit: driverSelectionCubit,
                )),
        (route) => false);
  }
}
