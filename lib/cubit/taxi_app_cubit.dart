import 'package:bloc/bloc.dart';
import 'package:randomizer_null_safe/randomizer_null_safe.dart';

import 'taxi_app_state.dart';

class TaxiAppCubit extends Cubit<TaxiAppState> {
  TaxiAppCubit() : super(TaxiAppState());

  Randomizer randomizer = Randomizer.instance();

  void choiceTaxiType({required int index}) {
    emit(state.copyWith(taxiType: index));
  }

  void setFromWhere({required String fromWhere}) {
    if (fromWhere != "") {
      emit(state.copyWith(fromWhereField: fromWhere));
      print(state.fromWhereField);
    }
  }

  void setWhere({required String where}) {
    if (where != "") {
      emit(state.copyWith(whereField: where));
    }
  }

  void setClientName({required String name}) {
    if (name != "") {
      emit(state.copyWith(nameField: name));
    }
  }

  void setCostOfTrip() {
    final cost = randomizer.randomIntInRange(100, 350);

    if (state.taxiType == 1) {
      emit(state.copyWith(costOfTrip: cost * 2));
      return;
    }
    emit(state.copyWith(costOfTrip: cost));
  }

  void businessClass() {
    if (state.taxiType == 1 && state.clickLock != 1) {
      emit(state.copyWith(
          costOfTrip: state.costOfTrip * 2, clickLock: state.clickLock + 1));
    }
  }

  void economClass() {
    if (state.taxiType == 0 && state.clickLock != 0) {
      emit(state.copyWith(
          costOfTrip: state.costOfTrip ~/ 2, clickLock: state.clickLock - 1));
    }
  }

  orderReadiness() {
    emit(state.copyWith(orderIsReady: true));
  }
}
