// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DriverSelectionState {
  final int driverIndex;
  final int remainingTime;
  final bool isSearchCompleted;
  DriverSelectionState({
    this.driverIndex = 0,
    this.remainingTime = 5,
    this.isSearchCompleted = false,
  });

  DriverSelectionState copyWith({
    int? driverIndex,
    int? remainingTime,
    bool? isSearchCompleted,
  }) {
    return DriverSelectionState(
      driverIndex: driverIndex ?? this.driverIndex,
      remainingTime: remainingTime ?? this.remainingTime,
      isSearchCompleted: isSearchCompleted ?? this.isSearchCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'driverIndex': driverIndex,
      'remainingTime': remainingTime,
      'isSearchCompleted': isSearchCompleted,
    };
  }

  factory DriverSelectionState.fromMap(Map<String, dynamic> map) {
    return DriverSelectionState(
      driverIndex: map['driverIndex'] as int,
      remainingTime: map['remainingTime'] as int,
      isSearchCompleted: map['isSearchCompleted'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory DriverSelectionState.fromJson(String source) =>
      DriverSelectionState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'DriverSelectionState(driverIndex: $driverIndex, remainingTime: $remainingTime, isSearchCompleted: $isSearchCompleted)';

  @override
  bool operator ==(covariant DriverSelectionState other) {
    if (identical(this, other)) return true;

    return other.driverIndex == driverIndex &&
        other.remainingTime == remainingTime &&
        other.isSearchCompleted == isSearchCompleted;
  }

  @override
  int get hashCode =>
      driverIndex.hashCode ^
      remainingTime.hashCode ^
      isSearchCompleted.hashCode;
}
