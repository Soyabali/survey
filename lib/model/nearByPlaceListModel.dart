
class NearByPlaceListModel {
  final int iPlaceCode;
  final String sPlaceName;
  final double fLatitude;
  final double fLongitude;
  final String sLocation;
  final String sImage;
  final String sDistance;

  NearByPlaceListModel({
    required this.iPlaceCode,
    required this.sPlaceName,
    required this.fLatitude,
    required this.fLongitude,
    required this.sLocation,
    required this.sImage,
    required this.sDistance,
  });

  factory NearByPlaceListModel.fromJson(Map<String, dynamic> json) {
    return NearByPlaceListModel(
      iPlaceCode: json['iPlaceCode'],
      sPlaceName: json['sPlaceName'],
      fLatitude: json['fLatitude'],
      fLongitude: json['fLongitude'],
      sLocation: json['sLocation'],
      sImage: json['sImage'],
      sDistance: json['sDistance'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'iPlaceCode': iPlaceCode,
      'sPlaceName': sPlaceName,
      'fLatitude': fLatitude,
      'fLongitude': fLongitude,
      'sLocation': sLocation,
      'sImage': sImage,
      'sDistance': sDistance,
    };
  }
}