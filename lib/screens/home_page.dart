import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:taxi_service_imitation/cubit/driver_selection/driver_selection_cubit.dart';
import 'package:taxi_service_imitation/cubit/taxi_app_cubit.dart';
import 'package:taxi_service_imitation/cubit/taxi_app_state.dart';
import 'package:taxi_service_imitation/widgets/address_card.dart';
import 'package:taxi_service_imitation/widgets/buttons/my_floating_action_button.dart';
import 'package:taxi_service_imitation/widgets/buttons/type_of_taxi.dart';
import 'package:taxi_service_imitation/widgets/my_app_bar.dart';

class HomePage extends StatelessWidget {
  final DriverSelectionCubit driverSelectionCubit;
  final TaxiAppCubit taxiAppCubit;
  const HomePage({
    Key? key,
    required this.driverSelectionCubit,
    required this.taxiAppCubit,
  }) : super(key: key);

  final PreferredSizeWidget appBar = const MyAppBar();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MyFloatingActionButton(
        driverSelectionCubit: driverSelectionCubit,
        taxiAppCubit: taxiAppCubit,
      ),
      body: Container(
          margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          height: mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top -
              mediaQuery.padding.bottom,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      height: mediaQuery.size.height > 800
                          ? constraints.maxHeight * 0.55
                          : constraints.maxHeight * 0.67,
                      child: AddressCard(
                        taxiAppCubit: taxiAppCubit,
                      )),
                  SizedBox(
                    height: constraints.maxHeight * 0.015,
                  ),
                  BlocBuilder<TaxiAppCubit, TaxiAppState>(
                      bloc: taxiAppCubit,
                      builder: (context, state) {
                        return SizedBox(
                          height: constraints.maxHeight * 0.25,
                          child: TypeOfTaxi(
                            taxiAppCubit: taxiAppCubit,
                          ),
                        );
                      })
                ],
              );
            },
          )),
    );
  }
}
