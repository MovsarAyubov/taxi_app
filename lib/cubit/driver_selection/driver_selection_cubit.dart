import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randomizer_null_safe/randomizer_null_safe.dart';
import 'package:taxi_service_imitation/cubit/driver_selection/driver_selection_state.dart';

class DriverSelectionCubit extends Cubit<DriverSelectionState> {
  DriverSelectionCubit() : super(DriverSelectionState());

  Timer? timer;

  Randomizer randomizer = Randomizer.instance();

  void driverSelection() {
    final time = state.remainingTime;
    emit(state.copyWith(isSearchCompleted: false));
    if (state.remainingTime > 0) {
      timer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (state.remainingTime > 0) {
          emit(state.copyWith(remainingTime: state.remainingTime - 1));
        }
        if (state.remainingTime == 0) {
          timer?.cancel();
        }
        if (state.remainingTime == 0) {
          final randomIndex = randomizer.randomIntInRange(0, 3);
          emit(state.copyWith(
              remainingTime: time,
              isSearchCompleted: true,
              driverIndex: randomIndex));
          return;
        }
      });
    }
  }
}
