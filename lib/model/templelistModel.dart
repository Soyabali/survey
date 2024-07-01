class TempleListModel {

  final int iTempleCode;
  final String sTempleName;
  final double fLatitude;
  final double fLongitude;
  final String sLocation;
  final String sImage;
  final String sDistance;

  const TempleListModel({
    required this.iTempleCode,
    required this.sTempleName,
    required this.fLatitude,
    required this.fLongitude,
    required this.sLocation,
    required this.sImage,
    required this.sDistance,
  });

  factory TempleListModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'iTempleCode': int iTempleCode,
      'sTempleName': String sTempleName,
      'fLatitude': double fLatitude,
      'fLongitude': double fLongitude,
      'sLocation': String sLocation,
      'sImage': String sImage,
      'sDistance': String sDistance,

      } =>
          TempleListModel(
            iTempleCode: iTempleCode,
            sTempleName: sTempleName,
            fLatitude: fLatitude,
            fLongitude: fLongitude,
            sLocation: sLocation,
            sImage: sImage,
            sDistance: sDistance,
          ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}