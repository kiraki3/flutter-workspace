import 'package:geolocator/geolocator.dart';

class MyLocation {
  double? latitude2;
  double? longitude2;

  Future<void> getMyCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print("Location permissions are denied.");
      return;
    }

    // 예외처리
    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );
      latitude2 = position.latitude;
      longitude2 = position.longitude;
      print(latitude2);
      print(longitude2);
    } catch (e) {
      print("There was a problem with the internet connection.");
    }
  }
}
