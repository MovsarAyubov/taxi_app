// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:taxi_service_imitation/cubit/driver_selection/driver_selection_cubit.dart';
import 'package:taxi_service_imitation/model/driver_card.dart';

class DriverCard extends StatelessWidget {
  final DriverSelectionCubit driverSelectionCubit;
  DriverCard({
    Key? key,
    required this.driverSelectionCubit,
  }) : super(key: key);

  final driverCard = [
    DriverCardModel(
        image: "assets/images/iba.jpg", name: "Ибрагим", driverRaiting: "3"),
    DriverCardModel(
        image: "assets/images/malik.jpg", name: "Малик", driverRaiting: "4"),
    DriverCardModel(
        image: "assets/images/ramzan.jpg", name: "Рамзан", driverRaiting: "5"),
    DriverCardModel(
        image: "assets/images/muslim.jpg", name: "Муслим", driverRaiting: "3"),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: 300,
        child: Card(
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  driverCard[driverSelectionCubit.state.driverIndex].name,
                  style: Theme.of(context).primaryTextTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  driverCard[driverSelectionCubit.state.driverIndex].image,
                  height: constraints.maxHeight * 0.65,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Рейтинг ${driverCard[driverSelectionCubit.state.driverIndex].driverRaiting}',
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
