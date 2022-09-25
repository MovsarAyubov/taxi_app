// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:taxi_service_imitation/cubit/taxi_app_cubit.dart';

class TypeOfTaxi extends StatelessWidget {
  final TaxiAppCubit taxiAppCubit;

  const TypeOfTaxi({
    Key? key,
    required this.taxiAppCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TypeOfTaxiCard(
              onTap: () {
                taxiAppCubit.economClass();
              },
              taxiAppCubit: taxiAppCubit,
              borderColor: taxiAppCubit.state.taxiType == 0
                  ? Theme.of(context).primaryColor
                  : Colors.transparent,
              index: 0,
              boxHeight: constraints.maxHeight,
              boxWidth: constraints.maxWidth * 0.48,
              imageHeight: constraints.maxHeight * 0.45,
            ),
            TypeOfTaxiCard(
              onTap: () {
                taxiAppCubit.businessClass();
              },
              taxiAppCubit: taxiAppCubit,
              borderColor: taxiAppCubit.state.taxiType == 1
                  ? Theme.of(context).primaryColor
                  : Colors.transparent,
              index: 1,
              boxHeight: constraints.maxHeight,
              boxWidth: constraints.maxWidth * 0.48,
              imageHeight: constraints.maxHeight * 0.45,
            )
          ],
        );
      }),
    );
  }
}

class TypeOfTaxiCard extends StatelessWidget {
  final VoidCallback onTap;
  final Color borderColor;
  final TaxiAppCubit taxiAppCubit;
  final int index;
  final double boxHeight;
  final double boxWidth;
  final double imageHeight;
  const TypeOfTaxiCard({
    Key? key,
    required this.onTap,
    required this.borderColor,
    required this.taxiAppCubit,
    required this.index,
    required this.boxHeight,
    required this.boxWidth,
    required this.imageHeight,
  }) : super(key: key);

  final List<String> images = const [
    "assets/images/econom_taxi_2.png",
    "assets/images/luxury_taxi_1.png"
  ];

  final List<String> taxiType = const [
    "Эконом",
    "Бизнес",
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        taxiAppCubit.choiceTaxiType(index: index);
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 4, color: borderColor),
            borderRadius: BorderRadius.circular(15)),
        height: boxHeight,
        width: boxWidth,
        child: Card(
          elevation: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: imageHeight, //0.42
                child: Image.asset(images[index]),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                taxiType[index],
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
