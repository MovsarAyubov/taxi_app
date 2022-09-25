import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaxiAppState {
  final String fromWhereField;
  final String whereField;
  final String nameField;
  final int taxiType;
  final int costOfTrip;
  final bool orderIsReady;
  final int clickLock;
  TaxiAppState({
    this.fromWhereField = "",
    this.whereField = "",
    this.nameField = "",
    this.taxiType = 0,
    this.costOfTrip = 0,
    this.orderIsReady = false,
    this.clickLock = 0,
  });

  TaxiAppState copyWith({
    String? fromWhereField,
    String? whereField,
    String? nameField,
    int? taxiType,
    int? costOfTrip,
    bool? orderIsReady,
    int? clickLock,
  }) {
    return TaxiAppState(
      fromWhereField: fromWhereField ?? this.fromWhereField,
      whereField: whereField ?? this.whereField,
      nameField: nameField ?? this.nameField,
      taxiType: taxiType ?? this.taxiType,
      costOfTrip: costOfTrip ?? this.costOfTrip,
      orderIsReady: orderIsReady ?? this.orderIsReady,
      clickLock: clickLock ?? this.clickLock,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fromWhereField': fromWhereField,
      'whereField': whereField,
      'nameField': nameField,
      'taxiType': taxiType,
      'costOfTrip': costOfTrip,
      'orderIsReady': orderIsReady,
      'clickLock': clickLock,
    };
  }

  factory TaxiAppState.fromMap(Map<String, dynamic> map) {
    return TaxiAppState(
      fromWhereField: map['fromWhereField'] as String,
      whereField: map['whereField'] as String,
      nameField: map['nameField'] as String,
      taxiType: map['taxiType'] as int,
      costOfTrip: map['costOfTrip'] as int,
      orderIsReady: map['orderIsReady'] as bool,
      clickLock: map['clickLock'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaxiAppState.fromJson(String source) =>
      TaxiAppState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TaxiAppState(fromWhereField: $fromWhereField, whereField: $whereField, nameField: $nameField, taxiType: $taxiType, costOfTrip: $costOfTrip, orderIsReady: $orderIsReady, clickLock: $clickLock)';
  }

  @override
  bool operator ==(covariant TaxiAppState other) {
    if (identical(this, other)) return true;

    return other.fromWhereField == fromWhereField &&
        other.whereField == whereField &&
        other.nameField == nameField &&
        other.taxiType == taxiType &&
        other.costOfTrip == costOfTrip &&
        other.orderIsReady == orderIsReady &&
        other.clickLock == clickLock;
  }

  @override
  int get hashCode {
    return fromWhereField.hashCode ^
        whereField.hashCode ^
        nameField.hashCode ^
        taxiType.hashCode ^
        costOfTrip.hashCode ^
        orderIsReady.hashCode ^
        clickLock.hashCode;
  }
}
