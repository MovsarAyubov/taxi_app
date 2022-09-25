// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:taxi_service_imitation/cubit/driver_selection/driver_selection_cubit.dart';
import 'package:taxi_service_imitation/cubit/taxi_app_cubit.dart';
import 'package:taxi_service_imitation/routes/pass_data_routes.dart';
import 'package:taxi_service_imitation/screens/order_fulfillment_page.dart';
import 'package:taxi_service_imitation/widgets/my_app_bar.dart';

class OrderConfirmation extends StatelessWidget {
  final DriverSelectionCubit driverSelectionCubit;
  final TaxiAppCubit taxiAppCubit;
  const OrderConfirmation({
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                height: (mediaQuery.size.height -
                        appBar.preferredSize.height -
                        mediaQuery.padding.top) *
                    0.65,
                width: mediaQuery.size.width * 0.8,
                child: OrderInformation(
                    driverSelectionCubit: driverSelectionCubit,
                    taxiAppCubit: taxiAppCubit)),
          ),
        ],
      ),
    );
  }
}

class PositionedText extends StatelessWidget {
  final double top;
  final double left;
  final String text;
  const PositionedText({
    Key? key,
    required this.top,
    required this.left,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top,
        left: left,
        child: Text(
          text,
          style: Theme.of(context).primaryTextTheme.bodyText2,
        ));
  }
}

class OrderInformation extends StatelessWidget {
  final DriverSelectionCubit driverSelectionCubit;
  final TaxiAppCubit taxiAppCubit;
  const OrderInformation({
    Key? key,
    required this.driverSelectionCubit,
    required this.taxiAppCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LayoutBuilder(builder: (context, constraints) {
          return Image.asset(
            "assets/images/note.png",
            fit: BoxFit.cover,
            height: constraints.maxHeight,
            width: constraints.maxWidth,
          );
        }),
        PositionedText(
          top: 80,
          left: 30,
          text: taxiAppCubit.state.fromWhereField,
        ),
        PositionedText(
          top: 130,
          left: 50,
          text: taxiAppCubit.state.whereField,
        ),
        PositionedText(
          top: 180,
          left: 40,
          text: taxiAppCubit.state.nameField,
        ),
        PositionedText(
          top: 240,
          left: 110,
          text: "Цена: ${taxiAppCubit.state.costOfTrip.toString()}",
        ),
        Positioned(
            top: 315,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Редактировать",
                style: TextStyle(fontSize: 30, fontFamily: "Handwritten"),
              ),
            )),
        Positioned(
            top: 315,
            left: 190,
            child: GestureDetector(
              onTap: () {
                PassDataRoutes.waiting(context,
                    driverSelectionCubit: driverSelectionCubit,
                    taxiAppCubit: taxiAppCubit);
                driverSelectionCubit.driverSelection();
              },
              child: const Text(
                "Подтвердить",
                style: TextStyle(fontSize: 30, fontFamily: "Handwritten"),
              ),
            )),
      ],
    );
  }
}
