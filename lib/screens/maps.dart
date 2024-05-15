import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:cloud_firestore/cloud_firestore.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageScreen(),
    );
  }
}

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(15.9738, 120.2536); // Coordinates of Pangasinan
  final TextEditingController _searchController = TextEditingController();
  Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Resorts and Travel Destinations',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _searchPlaces(_searchController.text);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 10.0,
              ),
              markers: _markers,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveMarkers,
        tooltip: 'Save Markers',
        child: Icon(Icons.save),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _searchPlaces(String searchText) async {
    List<geocoding.Location> locations = await geocoding.locationFromAddress(searchText);

    if (locations.isNotEmpty) {
      final location = locations.first;
      final marker = Marker(
        markerId: MarkerId(searchText),
        position: LatLng(location.latitude, location.longitude),
        infoWindow: InfoWindow(
          title: searchText,
          snippet: 'Latitude: ${location.latitude}, Longitude: ${location.longitude}',
        ),
      );

      setState(() {
        _markers = {marker};
      });

      mapController.animateCamera(CameraUpdate.newLatLngZoom(
        LatLng(location.latitude, location.longitude),
        12.0,
      ));
    }
  }

  void _saveMarkers() async {
    final firestore = FirebaseFirestore.instance;
    final batch = firestore.batch();

    for (var marker in _markers) {
      final docRef = firestore.collection('markers').doc(marker.markerId.value);
      batch.set(docRef, {
        'id': marker.markerId.value,
        'latitude': marker.position.latitude,
        'longitude': marker.position.longitude,
        'title': marker.infoWindow.title,
        'snippet': marker.infoWindow.snippet,
      });
    }

    await batch.commit();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Markers saved to Firebase!')));
  }
}
