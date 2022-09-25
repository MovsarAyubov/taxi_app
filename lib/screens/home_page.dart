import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_service_imitation/core/widgets/size_config.dart';

import 'package:taxi_service_imitation/cubit/driver_selection/driver_selection_cubit.dart';
import 'package:taxi_service_imitation/cubit/taxi_app_cubit.dart';
import 'package:taxi_service_imitation/cubit/taxi_app_state.dart';
import 'package:taxi_service_imitation/widgets/address_card.dart';
import 'package:taxi_service_imitation/widgets/buttons/my_floating_action_button.dart';
import 'package:taxi_service_imitation/widgets/buttons/type_of_taxi.dart';
import 'package:taxi_service_imitation/widgets/my_app_bar.dart';

class HomePage extends StatefulWidget {
  final DriverSelectionCubit driverSelectionCubit;
  final TaxiAppCubit taxiAppCubit;
  const HomePage({
    Key? key,
    required this.driverSelectionCubit,
    required this.taxiAppCubit,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PreferredSizeWidget appBar = const MyAppBar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MyFloatingActionButton(
        driverSelectionCubit: widget.driverSelectionCubit,
        taxiAppCubit: widget.taxiAppCubit,
      ),
      body: Container(
          margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    child: AddressCard(
                      taxiAppCubit: widget.taxiAppCubit,
                    ),
                  ),
                  SizedBox(
                    height:
                        SizeConfig(context, 15.0).getProportionateScreenHeight,
                  ),
                  BlocBuilder<TaxiAppCubit, TaxiAppState>(
                      bloc: widget.taxiAppCubit,
                      builder: (context, state) {
                        return SizedBox(
                          height: constraints.maxHeight * 0.25,
                          child: TypeOfTaxi(
                            taxiAppCubit: widget.taxiAppCubit,
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
