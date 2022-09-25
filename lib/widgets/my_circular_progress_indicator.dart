import 'package:flutter/material.dart';
import 'package:taxi_service_imitation/my_styles/text_styles.dart';

class MyCircularProgressIndicator extends StatelessWidget {
  const MyCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            strokeWidth: 5,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Ваш заказ размещен",
            style: textStyleForOrderFulfillment,
          ),
          const Text(
            "Ожидайте отклик водителя",
            style: textStyleForOrderFulfillment,
          ),
        ],
      ),
    );
  }
}
