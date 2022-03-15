import 'package:geolocator/geolocator.dart';

class Location {
  static const latitudeKyiv = 50.450001;
  static const longitudeKyiv = 30.523333;

  double latitude = latitudeKyiv;
  double longitude = longitudeKyiv;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      latitude = latitudeKyiv;
      longitude = longitudeKyiv;
    }
  }
}
