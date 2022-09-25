import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:taxi_service_imitation/cubit/driver_selection/driver_selection_cubit.dart';
import 'package:taxi_service_imitation/cubit/driver_selection/driver_selection_state.dart';
import 'package:taxi_service_imitation/cubit/taxi_app_cubit.dart';
import 'package:taxi_service_imitation/widgets/buttons/simple_floating_action_button.dart';
import 'package:taxi_service_imitation/widgets/driver_card.dart';
import 'package:taxi_service_imitation/widgets/my_app_bar.dart';
import 'package:taxi_service_imitation/widgets/my_circular_progress_indicator.dart';
import 'package:taxi_service_imitation/widgets/my_count_down_timer.dart';

class OrderFulFillmentPage extends StatefulWidget {
  final TaxiAppCubit taxiAppCubit;
  final DriverSelectionCubit driverSelectionCubit;
  const OrderFulFillmentPage({
    Key? key,
    required this.taxiAppCubit,
    required this.driverSelectionCubit,
  }) : super(key: key);

  @override
  State<OrderFulFillmentPage> createState() => _OrderFulFillmentPageState();
}

class _OrderFulFillmentPageState extends State<OrderFulFillmentPage> {
  final PreferredSizeWidget appBar = const MyAppBar();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return BlocBuilder<DriverSelectionCubit, DriverSelectionState>(
      bloc: widget.driverSelectionCubit,
      builder: (context, state) {
        return Scaffold(
            floatingActionButton:
                widget.driverSelectionCubit.state.isSearchCompleted
                    ? SimpleFloatinActionButton(
                        driverSelectionCubit: widget.driverSelectionCubit,
                        taxiAppCubit: widget.taxiAppCubit)
                    : null,
            resizeToAvoidBottomInset: false,
            appBar: appBar,
            body: Padding(
                padding: const EdgeInsets.all(15),
                child: widget.driverSelectionCubit.state.isSearchCompleted
                    ? SizedBox(
                        height: mediaQuery.size.height -
                            appBar.preferredSize.height -
                            mediaQuery.padding.top,
                        width: mediaQuery.size.width,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: (mediaQuery.size.height -
                                          appBar.preferredSize.height -
                                          mediaQuery.padding.top) *
                                      0.45,
                                  width: mediaQuery.size.width * 0.6,
                                  child: DriverCard(
                                      driverSelectionCubit:
                                          widget.driverSelectionCubit),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            MyCountDownTimer(
                              taxiAppCubit: widget.taxiAppCubit,
                              driverSelectionCubit: widget.driverSelectionCubit,
                            ),
                          ],
                        ),
                      )
                    : const MyCircularProgressIndicator()));
      },
    );
  }
}
