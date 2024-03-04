import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingOrder extends StatefulWidget {

  var order;
   TrackingOrder({super.key,this.order});

  @override
  State<TrackingOrder> createState() => _TrackingOrderState();
}

class _TrackingOrderState extends State<TrackingOrder> {
  late GoogleMapController mapController;
  late CollectionReference _locationCollection;

  final LatLng initialLocation = const LatLng(0, 0);
  late LatLng customerLocation;
  late LatLng deliveryBoyLocation;
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  late StreamSubscription<Position> deliveryBoyLocationStream;

  @override
  void initState() {
    super.initState();
     _locationCollection = FirebaseFirestore.instance.collection('trackingOrder');
    _initializeLocations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Location Tracking Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: initialLocation,
          zoom: 14.0,
        ),
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
        markers: markers,
        polylines: polylines,
      ),
    );
  }


  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void _initializeLocations() {


    double userlat = widget.order['userLatitude'];
    double userlng = widget.order['userLongitude'];
    customerLocation = LatLng(userlat, userlng);
    _addCustomerMarker();


    double lat =  widget.order['deliveryLatitude'];
    double lng = widget.order['deliveryLongitude'];
    deliveryBoyLocation = LatLng(lat, lng);
    _addDeliveryBoyMarker();
    _updatePath();


    updatedataOnFirebase();
  }

  void _addCustomerMarker() {
    setState(() {
      markers.add(
        Marker(
          markerId: MarkerId('customer_marker'),
          position: customerLocation,
          infoWindow: InfoWindow(title: 'Customer'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      );
    });
  }

  void _addDeliveryBoyMarker() {
    setState(() {
      markers.add(
        Marker(
          markerId: MarkerId('delivery_boy_marker'),
          position: deliveryBoyLocation,
          infoWindow: InfoWindow(title: 'Delivery Boy'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      );
    });
  }

  void _updateDeliveryBoyMarker() {
    setState(() {
      markers.removeWhere((marker) => marker.markerId.value == 'delivery_boy_marker');
      markers.add(
        Marker(
          markerId: MarkerId('delivery_boy_marker'),
          position: deliveryBoyLocation,
          infoWindow: InfoWindow(title: 'Delivery Boy'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      );
    });
  }


  void updatedataOnFirebase(){

    double lat =  widget.order['deliveryLatitude'];
    double lng = widget.order['deliveryLongitude'];

    widget.order.reference.update({
      'deliveryLatitude': lat,
      'deliveryLongitude': lng,
    }).then((_) {
      print('pending updated successfully');
    }).catchError((error) {
      print('Error updating pending: $error');
    });
    _updateDeliveryBoyMarker();
    _updatePath();

    deliveryBoyLocation = LatLng(lat, lng);

    _locationCollection.doc('delivery_boy').snapshots().listen((snapshot) {
      if (snapshot.exists) {
        double lat = snapshot['latitude'];
        double lng = snapshot['longitude'];
        setState(() {
          deliveryBoyLocation = LatLng(lat, lng);
          _updateDeliveryBoyMarker();
          _updatePath();
        });
      }
    });
  }


  Future<void> _updatePath() async {
    var apiKey="AIzaSyBlpz67sTT_ZPj3p512jy5z-m-GJPHUd98";

    final String apiUrl = "https://maps.googleapis.com/maps/api/directions/json?origin=${deliveryBoyLocation.latitude},${deliveryBoyLocation.longitude}&destination=${customerLocation.latitude},${customerLocation.longitude}&key=$apiKey";

    try {
      final http.Response response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);

        List<LatLng> points = [];

        decoded['routes'].forEach((route) {
          route['legs'].forEach((leg) {
            leg['steps'].forEach((step) {
              points.add(LatLng(step['start_location']['lat'], step['start_location']['lng']));
              points.add(LatLng(step['end_location']['lat'], step['end_location']['lng']));
            });
          });
        });

        setState(() {
          polylines.clear();
          polylines.add(
            Polyline(
              polylineId: PolylineId('path'),
              color: Colors.blue,
              width: 5,
              points: points,
            ),
          );
        });
      } else {
        throw Exception('Failed to load directions');
      }
    } catch (error) {
      print('Error fetching directions: $error');
      // Handle error gracefully, e.g., show a dialog to the user
    }
  }



}