import 'package:geolocator/geolocator.dart';

void fetchLocation() async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low);
  print(position);
}
