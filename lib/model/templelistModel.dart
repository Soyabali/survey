
class TempleListModel {

  final int iTempleCode;
  final String sTempleName;
  final double fLatitude;
  final double fLongitude;
  final String sLocation;
  final String sImage;
  final String sDistance;

  TempleListModel({
    required this.iTempleCode,
    required this.sTempleName,
    required this.fLatitude,
    required this.fLongitude,
    required this.sLocation,
    required this.sImage,
    required this.sDistance,
  });

  factory TempleListModel.fromJson(Map<String, dynamic> json) {
    return TempleListModel(
      iTempleCode: json['iTempleCode'],
      sTempleName: json['sTempleName'],
      fLatitude: json['fLatitude'],
      fLongitude: json['fLongitude'],
      sLocation: json['sLocation'],
      sImage: json['sImage'],
      sDistance: json['sDistance'],
    );
  }
}
