
class ToiletListModel {
  final int iToiletCode;
  final String sToiletName;
  final double fLatitude;
  final double fLongitude;
  final String sLocation;
  final String sImage;
  final String sDistance;

  ToiletListModel({
    required this.iToiletCode,
    required this.sToiletName,
    required this.fLatitude,
    required this.fLongitude,
    required this.sLocation,
    required this.sImage,
    required this.sDistance,
  });

  factory ToiletListModel.fromJson(Map<String, dynamic> json) {
    return ToiletListModel(
      iToiletCode: json['iToiletCode'],
      sToiletName: json['sToiletName'],
      fLatitude: json['fLatitude'],
      fLongitude: json['fLongitude'],
      sLocation: json['sLocation'],
      sImage: json['sImage'],
      sDistance: json['sDistance'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'iToiletCode': iToiletCode,
      'sToiletName': sToiletName,
      'fLatitude': fLatitude,
      'fLongitude': fLongitude,
      'sLocation': sLocation,
      'sImage': sImage,
      'sDistance': sDistance,
    };
  }
}


//
// class ToiletListModel {
//
//   final int iTempleCode;
//   final String sTempleName;
//   final double fLatitude;
//   final double fLongitude;
//   final String sLocation;
//   final String sImage;
//   final String sDistance;
//
//   ToiletListModel({
//     required this.iTempleCode,
//     required this.sTempleName,
//     required this.fLatitude,
//     required this.fLongitude,
//     required this.sLocation,
//     required this.sImage,
//     required this.sDistance,
//   });
//
//   factory ToiletListModel.fromJson(Map<String, dynamic> json) {
//     return ToiletListModel(
//       iTempleCode: json['iTempleCode'],
//       sTempleName: json['sTempleName'],
//       fLatitude: json['fLatitude'],
//       fLongitude: json['fLongitude'],
//       sLocation: json['sLocation'],
//       sImage: json['sImage'],
//       sDistance: json['sDistance'],
//     );
//   }
// }
