import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    longitude = position.longitude;
    latitude = position.latitude;
  }

  Future<void> getCurrentPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    print(position);
  }
}
