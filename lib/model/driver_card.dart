class DriverCardModel {
  final String image;
  final String name;
  final String driverRaiting;
  DriverCardModel({
    required this.image,
    required this.name,
    required this.driverRaiting,
  });

  DriverCardModel copyWith({
    String? image,
    String? name,
    String? driverRaiting,
  }) {
    return DriverCardModel(
      image: image ?? this.image,
      name: name ?? this.name,
      driverRaiting: driverRaiting ?? this.driverRaiting,
    );
  }
}
