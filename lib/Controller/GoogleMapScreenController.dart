import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleMapScreenController extends GetxController{
  Location location = Location();
  LocationData? currentLocation;
  StreamSubscription<Position>? _positionStreamSubscription;

  var order;
  var orderData;

  double userLat=0.0,userLng=0.0,delLat=0.0,delLng=0.0;

  void init(var order) async {
    try {

      userLat = order['userLatitude'];
      userLng = order['userLongitude'];
      print("-userLat---${userLat}");
      print("-userLng---${userLng}");
      print("---------------------");

        delLat = currentLocation!.latitude!;
        delLng = currentLocation!.longitude!;
        print("-delLat---${delLat}");
        print("-delLng---${delLng}");

      openMap(userLat, userLng, delLat, delLng);

    } catch (e) {
      print("Error getting location: $e");
    }
  }

  void openMap(double userLatitude, double userLongitude, double deliverLatitude, double deliverLongitude) async {
    String googleUrl = 'https://www.google.com/maps/dir/?api=1&origin=$deliverLatitude,$deliverLongitude&destination=$userLatitude,$userLongitude&travelmode=driving&dir_action=navigate';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }

    print(googleUrl);
  }

  Future<void> getLocation() async {

      bool serviceEnabled;
      LocationPermission locationPermission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        return Future.error("Location service is disable");
      }

      locationPermission = await Geolocator.checkPermission();

      if (locationPermission == LocationPermission.denied) {
        locationPermission = await Geolocator.requestPermission();
        if (locationPermission == LocationPermission.denied) {
          return Future.error("Location permission is disable");
        }
      }

      if (locationPermission == LocationPermission.deniedForever) {
        return Future.error("Location permission is disable forever");
      }
      var deliveryLocation = await location.getLocation();
      currentLocation = deliveryLocation;

      print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      print("--------)${currentLocation}");

      order.reference.update({
        'deliveryLatitude': currentLocation!.latitude,
        'deliveryLongitude': currentLocation!.longitude,
      }).then((_) {
        print('delivery Data updated successfully');
      }).catchError((error) {
        print('Error updating delivery Data: $error');
      });
      print("xxxxxxx1111xxxxxxxxxxx111xxxxxxxxxxxxxx11xxxxxxxx111xxxxxxxx");
      return Future.value(true);

  }

}