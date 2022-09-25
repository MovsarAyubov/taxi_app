// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_service_imitation/cubit/driver_selection/driver_selection_cubit.dart';

import 'package:taxi_service_imitation/cubit/taxi_app_cubit.dart';
import 'package:taxi_service_imitation/cubit/taxi_app_state.dart';
import 'package:taxi_service_imitation/screens/order_confirmation.dart';

class MyFloatingActionButton extends StatelessWidget {
  final DriverSelectionCubit driverSelectionCubit;
  final TaxiAppCubit taxiAppCubit;
  const MyFloatingActionButton({
    Key? key,
    required this.driverSelectionCubit,
    required this.taxiAppCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaxiAppCubit, TaxiAppState>(
        bloc: taxiAppCubit,
        listenWhen: (previous, current) {
          return current.nameField != "" &&
              current.fromWhereField.split('').length >= 5 &&
              current.whereField.split('').length >= 5 &&
              current.orderIsReady == false;
        },
        listener: (context, state) {
          taxiAppCubit.orderReadiness();
          taxiAppCubit.setCostOfTrip();
        },
        builder: (context, state) {
          taxiAppCubit.setCostOfTrip;
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            child: taxiAppCubit.state.fromWhereField == "" ||
                    taxiAppCubit.state.fromWhereField.split('').length < 5 ||
                    taxiAppCubit.state.whereField.split('').length < 5 ||
                    taxiAppCubit.state.whereField == "" ||
                    taxiAppCubit.state.nameField == ""
                ? const FloatingActionButton.extended(
                    backgroundColor: Color.fromARGB(255, 206, 203, 203),
                    extendedPadding: EdgeInsets.zero,
                    isExtended: true,
                    label: Text("Не удается расcчитать заказ"),
                    onPressed: null)
                : FloatingActionButton.extended(
                    extendedPadding: EdgeInsets.zero,
                    isExtended: true,
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("ЦЕНА ${taxiAppCubit.state.costOfTrip}P",
                            style:
                                Theme.of(context).primaryTextTheme.bodyText1),
                        SizedBox(
                          width:
                              MediaQuery.of(context).size.width > 400 ? 90 : 60,
                        ),
                        Text("ЗАКАЗАТЬ",
                            style:
                                Theme.of(context).primaryTextTheme.bodyText1),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => OrderConfirmation(
                                driverSelectionCubit: driverSelectionCubit,
                                taxiAppCubit: taxiAppCubit,
                              ))));
                    },
                  ),
          );
        });
  }
}
